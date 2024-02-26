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
    output reg [`WORD-1:0] sign_extended_output,
    output reg reg2_loc,
    output reg uncondbranch,
    output reg branch,
    output reg mem_read,
    output reg mem_to_reg,
    output reg [1:0] alu_op,
    output reg mem_write,
    output reg alu_src,
    output reg reg_write,
    output reg [`WORD-1:0] read_data1,
    output reg [`WORD-1:0] read_data2,
    output reg [10:0] opcode
    );
    
    
endmodule
