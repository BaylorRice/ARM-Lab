`timescale 1ns / 1ps
`include "definitions.vh"
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

    always @(*) begin
        casex(opcode)
        `ADD , `SUB, `AND, `ORR: begin
            reg2_loc = 0;
            uncondbranch = 0;
            branch = 0;
            mem_read = 0;
            mem_to_reg = 0;
            alu_op = `ALUOp_RTYPE;
            mem_write = 0;
            alu_src = 0;
            reg_write = 1;
            end
        `LDUR : begin
            reg2_loc = 0;
            uncondbranch = 0;
            branch = 0;
            mem_read = 1;
            mem_to_reg = 1;
            alu_op = `ALUOp_DTYPE;
            mem_write = 0;
            alu_src = 1;
            reg_write = 1;
            end
        `STUR : begin
            reg2_loc = 1;
            uncondbranch = 0;
            branch = 0;
            mem_read = 0;
            mem_to_reg = 0;
            alu_op = `ALUOp_DTYPE;
            mem_write = 1;
            alu_src = 1;
            reg_write = 0;
            end
        `CBZ : begin
            reg2_loc = 1;
            uncondbranch = 0;
            branch = 1;
            mem_read = 0;
            mem_to_reg = 0;
            alu_op = `ALUOp_CBZ;
            mem_write = 0;
            alu_src = 0;
            reg_write = 0;
            end
        `B : begin
            reg2_loc = 0;
            uncondbranch = 1;
            branch = 0;
            mem_read = 0;
            mem_to_reg = 0;
            alu_op = `ALUOp_B;
            mem_write = 0;
            alu_src = 0;
            reg_write = 0;
            end
        default: begin
            reg2_loc = 0;
            uncondbranch = 0;
            branch = 0;
            mem_read = 0;
            mem_to_reg = 0;
            alu_op = 0;
            mem_write = 0;
            alu_src = 0;
            reg_write = 0;
            end
        endcase
    end

endmodule
