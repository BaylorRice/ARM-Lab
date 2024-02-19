`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Baylor University
// Engineer: Reese Ford
// 
// Create Date: 02/19/2024 12:30:48 PM
// Design Name: Control Unit
// Module Name: control
// Project Name: Lab 5 - Control Unit and Sign Extender
// Target Devices: Vivado Simulation
// Tool Versions: Vivado 2021.2
// Description: Who cares
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module control(
    input wire [10:0] opcode,
    output reg reg2_loc,
    output reg uncondbranch,
    output reg branch,
    output reg mem_read,
    output reg mem_to_reg,
    output reg [1:0] alu_op,
    output reg mem_write,
    output reg alu_src,
    output reg reg_write
    );
    
    
    
endmodule
