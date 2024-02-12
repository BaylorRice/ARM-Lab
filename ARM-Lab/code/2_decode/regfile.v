`timescale 1ns / 1ps
`include "definitions.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: Baylor University
// Engineer: Reese Ford
// 
// Create Date: 02/12/2024 01:50:24 PM
// Design Name: Register File
// Module Name: regfile
// Project Name: Lab 4 - Beginnning to Decode
// Target Devices: Vivado Simulation
// Tool Versions: Vivado 2021.2
// Description: *shrug*
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module regfile(
    input wire read_clk,
    input wire write_clk,
    input wire [4:0] read_register1,
    input wire [4:0] read_register2,
    input wire [4:0] write_register,
    input wire [`WORD-1:0] write_data,
    input wire reg_write,
    output reg [`WORD-1:0] read_data2,
    output reg [`WORD-1:0] read_data2,
);

    reg[`WORD-1:0] rmem [31:0];

    initial
    $readmemh(`RMEMFILE, rmem);

    always @(posedge read_clk) begin
        read_data1 = rmem[read_register1];
        read_data2 = rmem[read_register2];
    end

    always @(posedge write_clk) begin
        if (reg_write)
            rmem[write_register] = write_data;
    end


endmodule
