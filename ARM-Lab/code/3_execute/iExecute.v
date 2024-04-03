`timescale 1ns / 1ps
`include "definitions.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: Baylor University
// Engineer: Reese Ford
// 
// Create Date: 03/28/2024 12:55:30 PM
// Design Name: Instruction Execution Wrapper
// Module Name: iExecute
// Project Name: Lab 9 - Execute Stage
// Target Devices: Vivado Simulator
// Tool Versions: Vivado 2021.2
// Description: beats me
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module iExecute(
    input wire [`WORD-1:0] cur_pc,
    input wire [`WORD-1:0] read_data1,
    input wire [`WORD-1:0] read_data2,
    input wire [`WORD-1:0] sign_extended_output,
    input wire [1:0] alu_op,
    input wire [10:0] opcode,
    input wire alu_src,
    output wire [`WORD-1:0] branch_target,
    output wire [`WORD-1:0] alu_result,
    output wire zero
);

    // Modules from Top to Bottom on Figure 9.1 (pg 39 of manual)
    // Branch Target "Calculator"

    wire [`WORD-1:0] bADD_bIN_wire;
    assign bADD_bIN_wire = sign_extended_output << 2;

    adder bADD(
        .a_in(cur_pc),
        .b_in(bADD_bIN_wire),
        .add_out(branch_target)
    );

    // ALU
    wire [`WORD-1:0] ALU_bIN_wire;
    mux#(`WORD) ALU_MUX(
        .a_in(read_data2),
        .b_in(sign_extended_output),
        .control(alu_src),
        .mux_out(ALU_bIN_wire)
    );


    alu ALU(
        .a_in(read_data1),
        .b_in(ALU_bIN_wire),
        .alu_control(ALU_Cont_wire),
        .alu_result(alu_result),
        .zero(zero)
    );

    // ALU Control
    wire [3:0] ALU_Cont_wire;
    alu_control ALU_CONT(
        .alu_op(alu_op),
        .opcode(opcode),
        .alu_control(ALU_Cont_wire)
    );
    
    



endmodule
