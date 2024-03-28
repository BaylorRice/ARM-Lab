`timescale 1ns / 1ps
`include "definitions.vh"

//////////////////////////////////////////////////////////////////////////////////
// Company: Baylor University
// Engineer: Reese Ford
// 
// Create Date: 01/29/2024 11:57:39 AM
// Design Name: Simple 64-bit Adder
// Module Name: adder
// Project Name: Lab02 - Program Counter and Mux
// Target Devices: Vivado Simulation
// Tool Versions: Vivado 2021.2
// Description: This adder takes the inputs a_in and b_in and adds them together, outputting the result as add_out. All wires are 64 bits in length, defined by the WORD constant
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder(
    input [`WORD - 1:0] a_in,
    input [`WORD - 1:0] b_in,
    output [`WORD - 1:0] add_out
    );
    
assign add_out = a_in + b_in;

endmodule
