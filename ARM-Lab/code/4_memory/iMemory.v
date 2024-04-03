`timescale 1ns / 1ps
`include "definitions.vh"

//////////////////////////////////////////////////////////////////////////////////
// Company: Baylor University
// Engineer: Reese Ford
// 
// Create Date: 04/03/2024 01:56:58 PM
// Design Name: Memory Module
// Module Name: iMemory
// Project Name: Lab 10 - Memory Stage
// Target Devices: Vivado Simulator
// Tool Versions: Vivado 2021.2
// Description: it remembers. what more do you want
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module iMemory(
    input wire clk,
    input wire zero,
    input wire uncondbranch,
    input wire branch,
    input wire mem_read,
    input wire mem_write,
    input wire [`WORD-1:0] mem_address,
    input wire [`WORD-1:0] mem_write_data,
    output reg [`WORD-1:0] mem_read_data,
    output wire pc_src
    );
    
    // PC Control
    assign pc_src = (branch && zero) || uncondbranch;


    // Memory Module
    reg[`WORD-1:0] dmem [99:0];
    
    initial
    $readmemb(`DMEMFILE, dmem);

    always @(posedge clk) begin
        mem_read_data = mem_read ? dmem[mem_address/8] : Z;
        
        if (mem_write == 1) begin
            dmem[mem_address/8] = mem_write_data;
        end
        
    end
    
endmodule
