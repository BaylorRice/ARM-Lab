`timescale 1ns / 1ps
`include "definitions.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: Baylor University
// Engineer: Reese Ford
// 
// Create Date: 04/15/2024 12:25:37 PM
// Design Name: iWriteBack Stage
// Module Name: iWriteBack
// Project Name: Lab 11 - Write Back
// Target Devices: Vivado Simulation
// Tool Versions: Vivado 2021.2
// Description: why does this need to exist
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module iWriteBack(
    input wire mem_to_reg,
    input wire [`WORD-1:0] read_data,
    input wire [`WORD-1:0] alu_result,
    output wire [`WORD-1:0] write_back
);

    mux# (`WORD) WRITEBACK_MUX(
        .b_in(read_data),
        .a_in(alu_result),
        .control(mem_to_reg),
        .mux_out(write_back)
    );

endmodule
