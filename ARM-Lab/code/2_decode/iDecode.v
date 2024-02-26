`timescale 1ns / 1ps
`include "definitions.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: Baylor University
// Engineer: Reese Ford
// 
// Create Date: 02/26/2024 12:34:43 PM
// Design Name: Decode Stage Wrapper Module
// Module Name: iDecode
// Project Name: Lab 6 - Finishing Decode
// Target Devices: Vivado Simulation
// Tool Versions: Vivado 2021.2
// Description: See Pg. 28 of the manual, I mean, figure it out.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module iDecode(
    input wire clk,
    input wire read_clk,
    input wire write_clk,
    input wire [`INSTR_LEN-1:0] instruction,
    input wire [`WORD-1:0] write_data,
    output wire [`WORD-1:0] sign_extended_output,
    output wire reg2_loc,
    output wire uncondbranch,
    output wire branch,
    output wire mem_read,
    output wire mem_to_reg,
    output wire [1:0] alu_op,
    output wire mem_write,
    output wire alu_src,
    output wire reg_write,
    output wire [`WORD-1:0] read_data1,
    output wire [`WORD-1:0] read_data2,
    output wire [10:0] opcode
);

    // Wire Definitons
    wire [10:0] opcode_wire;
    wire [4:0] read_reg2_wire;
    wire [4:0] read_reg1_wire;
    wire [4:0] read_mux_0_wire;
    wire [4:0] read_mux_1_wire;
    wire reg2_loc_wire;
    wire reg_write_wire;


    // Module Definitions
    instr_parse IP (
        .instruction(instruction),
        .opcode(opcode_wire),
        .rm_num(read_mux_0_wire),
        .rn_num(read_reg1_wire),
        .rd_num(read_mux_1_wire)
    );

    control CTRL (
        .opcode(opcode_wire),
        .reg2_loc(reg2_loc_wire),
        .uncondbranch(uncondbranch),
        .branch(branch),
        .mem_read(mem_read),
        .mem_to_reg(mem_to_reg),
        .alu_op(alu_op),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .reg_write(reg_write_wire)
    );

    regfile X_REG(
        .read_clk(read_clk),
        .write_clk(write_clk),
        .read_register1(read_reg1_wire),
        .read_register2(read_reg2_wire),
        .write_register(read_mux_1_wire),
        .write_data(write_data),
        .reg_write(reg_write_wire),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    sign_extender SE(
        .instruction(instruction),
        .sign_extended_output(sign_extended_output)
    );

    mux#(5) MUX(
        .a_in(read_mux_0_wire),
        .b_in(read_mux_1_wire),
        .control(reg2_loc_wire),
        .mux_out(read_reg2_wire)
    );

    // Wire to Output Definitions
    assign opcode = opcode_wire;
    assign reg2_loc = reg2_loc_wire;

endmodule
