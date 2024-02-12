`timescale 1ns / 1ps
`include "definitions.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: Baylor University
// Engineer: Reese Ford
// 
// Create Date: 02/12/2024 12:46:26 PM
// Design Name: Isntruction Parse
// Module Name: instr_parse
// Project Name: Lab 4 - Beginning to Decode
// Target Devices: Vivado Simulation
// Tool Versions: Vivado 2021.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instr_parse(
    input wire [`INSTR_LEN-1:0] instruction,
    output wire [10:0] opcode,
    output wire [8:0] address,
    output wire [4:0] rm_num,
    output wire [4:0] rn_num,
    output wire [4:0] rd_num
    );
    
    assign opcode = (instruction >> 21) & 11'h7FF;
    assign address = (instruction >> 12) & 9'h1FF;
    assign rm_num = (instruction >> 16) & 5'h1F;
    assign rn_num = (instruction >> 5) & 5'h1F;
    assign rd_num = instruction & 5'h1F;
    
endmodule
