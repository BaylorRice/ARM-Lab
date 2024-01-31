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
    output reg [`INSTR_LEN-1:0] instruction,
    output reg [`WORD-1:0] cur_pc
);

    // Module Definitions
    mux#(`WORD) MUX (
        .a_in(branch_target),
        .b_in( ),
        .control(pc_src),
        .mux_out( )
    );

    register PC(
        .clk(clk),
        .reset(reset),
        .D( ),
        .Q( )
    );

    instr_mem#(SIZE) INS_MEM (
        .clk(clk),
        .pc( ),
        .instruction(instruction)
    );

    adder ADD (
        .a_in( ),
        .b_in( ),
        .add_out( )
    );

endmodule
