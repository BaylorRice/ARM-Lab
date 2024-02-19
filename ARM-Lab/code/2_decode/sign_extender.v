`timescale 1ns / 1ps
`include "definitions.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: Baylor University
// Engineer: Reese Ford
// 
// Create Date: 02/19/2024 01:47:03 PM
// Design Name: Sign Extender
// Module Name: sign_extender
// Project Name: Lab 5 - Control unit and Sign Extenders
// Target Devices: Vivado Simulation
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


module sign_extender(
    input [`INSTR_LEN-1:0] instruction,
    output reg [`WORD-1:0] sign_extended_output
);
    
    reg [10:0] opcode;
    reg [7:0] d_address;
    reg [17:0] cb_address;
    reg [25:0] b_address;
    
    always @(*) begin
        // Get opcode from instruction
        opcode = instruction[31:21];
        
        // Run cases
        casex(opcode)
            `LDUR, `STUR: begin
                d_address = instruction[20:12];
                if (d_address[7] == 0) begin
                    sign_extended_output[`WORD-1:8] = 0;
                end else begin
                    sign_extended_output[`WORD-1:8] = {((`WORD-1)-7){1'b1}};
                end
                sign_extended_output[7:0] = d_address;
                end
            `CBZ: begin
                cb_address = instruction[23:5];
                if (cb_address[17] == 0) begin
                    sign_extended_output[`WORD-1:18] = 0;
                end else begin
                    sign_extended_output[`WORD-1:18] = {((`WORD-1)-17){1'b1}};
                end
                sign_extended_output[17:0] = cb_address; 
                end
             `B: begin
                b_address = instruction[25:0];
                if (b_address[25] == 0) begin
                    sign_extended_output[`WORD-1:26] = 0;
                end else begin
                    sign_extended_output[`WORD-1:26] = {((`WORD-1)-25){1'b1}};
                end
                sign_extended_output[25:0] = b_address;
                end
            default: begin
                sign_extended_output = 0;
            end
            
             endcase
        end
    
endmodule
