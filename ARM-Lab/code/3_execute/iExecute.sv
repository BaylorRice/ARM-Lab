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
    output reg [`WORD-1:0] branch_target,
    output reg [`WORD-1:0] alu_result,
    output reg zero
    );
endmodule
