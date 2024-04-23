`timescale 1ns / 1ps
`include "verification_functions.sv"
//////////////////////////////////////////////////////////////////////////////////
// Company: Baylor University
// Engineer: Reese Ford
// 
// Create Date: 04/23/2024 03:23:12 PM
// Design Name: Simple Division
// Module Name: division
// Project Name: Lab 12 - Division
// Target Devices: Vivado Simulation
// Tool Versions: Vivado 2021.2
// Description: what do you think it does genius?
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module division;
    import verification::*;

    int tc = 1;
    int ts = 1;

    string pc_string = "|cur_pc|";
    string instr_string = "|instruction|";
    string sign_extended_output_string = "|sign_extended_output|";
    string reg2_loc_string = "|reg2_loc|";
    string uncondbranch_string = "|uncondbranch|";
    string branch_string = "|branch|";
    string mem_read_string = "|mem_read|";
    string mem_to_reg_string = "|mem_to_reg|";
    string alu_op_string = "|alu_op|";
    string mem_write_string = "|mem_write|";
    string alu_src_string = "|alu_src|";
    string reg_write_string = "|reg_write|";
    string read_data1_string = "|read_data1|";
    string read_data2_string = "|read_data2|";
    string opcode_string = "|opcode|";
    string mem_read_data_string = "|mem_read_data|";
    string pc_src_string = "|pc_src|";
    string write_data_string = "|write_data|";


    // iFetch
    wire clk;
    reg reset;
    reg pc_src;
    reg [`WORD-1:0] branch_target;
    wire [`WORD-1:0] cur_pc;
    wire [`INSTR_LEN-1:0] instruction;

    reg [`INSTR_LEN-1:0] er_instruction;
    reg [`WORD-1:0] er_cur_pc;

    iFetch#(.SIZE(16))  iF(
        .clk(clk),
        .clk_delayed(decode_clk),
        .reset(reset),
        .pc_src(pc_src),
        .branch_target(branch_target),
        .instruction(instruction),
        .cur_pc(cur_pc)
    );


    // iDecode
    wire decode_clk;
    wire read_clk;
    wire write_clk;
    wire [`WORD-1:0] write_data;
    wire [`WORD-1:0] sign_extended_output;
    wire reg2_loc;
    wire uncondbranch;
    wire branch;
    wire mem_read;
    wire mem_to_reg;
    wire [1:0] alu_op;
    wire mem_write;
    wire alu_src;
    wire reg_write;
    wire [`WORD-1:0]read_data1;
    wire [`WORD-1:0]read_data2;
    wire [10:0] opcode;

    reg er_uncondbranch;
    reg er_reg2_loc;
    reg er_branch;
    reg er_mem_read;
    reg er_mem_to_reg;
    reg [1:0] er_alu_op;
    reg er_mem_write;
    reg er_alu_src;
    reg er_reg_write;
    reg [`WORD-1:0] er_sign_extended_output;
    reg [`WORD -1:0] er_read_data1;
    reg [`WORD -1:0] er_read_data2;
    reg [10:0] er_opcode;

    iDecode iD(
        .clk(decode_clk),
        .read_clk(read_clk),
        .write_clk(write_clk),
        .instruction(instruction),
        .write_data(write_data),
        .opcode(opcode),
        .sign_extended_output(sign_extended_output),
        .reg2_loc(reg2_loc),
        .uncondbranch(uncondbranch),
        .branch(branch),
        .mem_read(mem_read),
        .mem_to_reg(mem_to_reg),
        .alu_op(alu_op),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .reg_write(reg_write),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // iExecute

    wire[`WORD-1:0] branch_target;
    wire [`WORD-1:0] alu_result;
    wire zero;

    reg [`WORD-1:0] er_branch_target;
    reg [`WORD-1:0] er_alu_result;
    reg er_zero;

    string branch_target_string = "|branch_target|";
    string alu_result_string = "|alu_result|";
    string zero_string = "|zero|";

    iExecute myExecute(
        .cur_pc(cur_pc),
        .sign_extended_output(sign_extended_output),
        .alu_op(alu_op),
        .alu_src(alu_src),
        .opcode(opcode),
        .read_data1(read_data1),
        .read_data2(read_data2),
        .branch_target(branch_target),
        .alu_result(alu_result),
        .zero(zero)
    );
    
    
    // iMemory
    wire data_clk;
    wire [`WORD-1:0] mem_read_data;
    
    reg [`WORD - 1:0] er_mem_read_data;
    reg er_pc_src;

    iMemory myMemory(
        .clk(data_clk),
        .zero(zero),
        .uncondbranch(uncondbranch),
        .branch(branch),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_address(alu_result),
        .mem_write_data(read_data2),
        .mem_read_data(mem_read_data),
        .pc_src(pc_src)
    );
    
    
    // iWriteBack
    reg [`WORD:1-0] er_write_data;
    
    iWriteBack myWriteBack(
        .mem_to_reg(mem_to_reg),
        .read_data(mem_read_data),
        .alu_result(alu_result),
        .write_back(write_data)
    );

    oscillator myOsc(clk);

    delay #(1) clk_delay_decode(
        .a(clk),
        .a_delayed(decode_clk)
    );

    delay #(1) clk_delay_decode_read(
        .a(decode_clk),
        .a_delayed(read_clk)
    );

    delay #(6) clk_delay_decode_write(
        .a(decode_clk),
        .a_delayed(write_clk)
    );
    
    delay #(1) clk_delay_data(
        .a(read_clk),
        .a_delayed(data_clk)
    );

    function void verify_control_signals();
        verify(ts++, reg2_loc_string, er_reg2_loc, $bits(er_reg2_loc), reg2_loc, $bits(reg2_loc), `BINARY);
        verify(ts++, uncondbranch_string, er_uncondbranch, $bits(er_uncondbranch), uncondbranch, $bits(uncondbranch), `BINARY);
        verify(ts++, branch_string, er_branch, $bits(er_branch), branch, $bits(branch), `BINARY);
        verify(ts++, mem_read_string, er_mem_read, $bits(er_mem_read), mem_read, $bits(mem_read), `BINARY);
        verify(ts++, mem_to_reg_string, er_mem_to_reg, $bits(er_mem_to_reg), mem_to_reg, $bits(mem_to_reg), `BINARY);
        verify(ts++, alu_op_string, er_alu_op, $bits(er_alu_op), alu_op, $bits(alu_op), `BINARY);
        verify(ts++, mem_write_string, er_mem_write, $bits(er_mem_write), mem_write, $bits(mem_write), `BINARY);
        verify(ts++, alu_src_string, er_alu_src, $bits(er_alu_src), alu_src, $bits(alu_src), `BINARY);
        verify(ts++, reg_write_string, er_reg_write, $bits(er_reg_write), reg_write, $bits(reg_write), `BINARY);
    endfunction


    initial
    begin

    begin_test();

    // set reset to 1 to make sure that the PC doesn't increment on the first positive clock edge, 
    // then set it back to 0 after that first positive clock edge
    reset = 1;
    #`CYCLE;
    reset = 0;
    
    // DIVIDE TEST
    $display("Test Case %0d: | DIVIDE 57/8", tc++);
    ts = 1;
    
    er_read_data2 = 7;
    
    #335;
    verify(ts++, read_data2_string, er_read_data2, $bits(er_read_data2), read_data2, $bits(read_data2), `S_DEC);
    
    final_result();

        $finish;
    end
endmodule
