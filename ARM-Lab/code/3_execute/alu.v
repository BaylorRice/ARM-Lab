`timescale 1ns / 1ps
`include "definitions.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: Baylor University
// Engineer: Reese Ford
// 
// Create Date: 03/25/2024 12:28:52 PM
// Design Name: Aritmatic Logic Unit ("ALU")
// Module Name: alu
// Project Name: Lab 8 - ALU and ALU Control
// Target Devices: Vivado Simulator
// Tool Versions: Vivado 2021.2
// Description: figure it out
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(
    input wire [`WORD-1:0] a_in,
    input wire [`WORD-1:0] b_in,
    input wire [3:0] alu_control,
    output reg [`WORD-1:0] alu_result,
    output reg zero
);

    always @(*) begin
        case(alu_control)
            `ALU_AND : alu_result = a_in & b_in;
            `ALU_ORR : alu_result = a_in || b_in;
            `ALU_ADD : alu_result = a_in + b_in;
            `ALU_SUB : alu_result = a_in - b_in;
            `ALU_PASS : alu_result = b_in;
            default: alu_result = a_in & b_in;
        endcase

        zero = (alu_result == 0);
        
    end

endmodule
