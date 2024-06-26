`timescale 1ns / 1ps
`include "definitions.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: Baylor University
// Engineer: Reese Ford
// 
// Create Date: 03/25/2024 12:57:19 PM
// Design Name: AlU Control Unit
// Module Name: alu_control
// Project Name: Lab 8 - ALU and ALU Control
// Target Devices: Vivado Simulator 
// Tool Versions: Vivado 2021.2
// Description: ha!
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_control(
    input wire [1:0] alu_op,
    input wire [10:0] opcode,
    output reg [3:0] alu_control
    );
    
    always @(*) begin
        casex(alu_op)
        `ALUOp_B, `ALUOp_DTYPE: alu_control = `ALU_ADD;
        `ALUOp_CBZ: alu_control = `ALU_PASS;
        `ALUOp_RTYPE: begin
            alu_control[3] = 0;
            alu_control[2] = opcode[9];
            alu_control[1] = opcode[3];
            alu_control[0] = opcode[8];
            end
        default: alu_control = 4'b0000;
        endcase
    end
            
endmodule
