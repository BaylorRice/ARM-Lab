`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Baylor University
// Engineer: Reese Ford
// 
// Create Date: 01/31/2024 01:33:58 PM
// Design Name: Fetch Stage
// Module Name: iFetch
// Project Name: Lab03 - Fetch Stage
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module iFetch#(
    parameter SIZE=1024)(
    input wire clk,
    input wire clk_delayed, // Don't use yet
    input wire reset,
    input wire pc_src,
    input wire [`WORD-1:0] branch_target,
    output wire [`INSTR_LEN-1:0] instruction,
    output wire [`WORD-1:0] cur_pc
);

    // Module Definitions
    mux#(`WORD) MUX (
        .a_in(branch_target),
        .b_in(add_out_wire),
        .control(pc_src),
        .mux_out(mux_out_wire)
    );

    register PC(
        .clk(clk),
        .reset(reset),
        .D(mux_out_wire),
        .Q(pc_out_wire)
    );

    instr_mem#(SIZE) INS_MEM (
        .clk(clk),
        .pc(pc_out_wire),
        .instruction(instruction)
    );

    adder ADD (
        .a_in(pc_out_wire),
        .b_in(`WORD'd4),
        .add_out(add_out_wire)
    );


    // Wire and Reg definitions
    wire [`WORD-1:0] add_out_wire;
    wire [`WORD-1:0] pc_out_wire;
    wire [`WORD-1:0] mux_out_wire;
    

endmodule
