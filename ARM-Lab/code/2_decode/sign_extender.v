`timescale 1ns / 1ps
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
    
    always @(*) begin
        // Get opcode from instruction
        reg [10:0] opcode = instruction[31:21];
        
        // Run cases
        casex(opcode)
            `LDUR, `STUR: begin
                reg [7:0] address = instruction[20:12];
                if (address[7] == 0) begin
                    sign_extended_output[`WORD-1:8] = 0;
                end else begin
                    sign_extended_output[`WORD-1:8] = '1;
                end
                sign_extended_output[7:0] = address;
                end
            `CBZ: begin
                reg [17:0] address = instruction[23:5];
                if (address[17] == 0) begin
                    sign_extended_output[`WORD-1:18] = 0;
                end else begin
                    sign_extended_output[`WORD-1:18] = '1;
                end
                sign_extended_output[17:0] = address;
                end
             `B: begin
                reg [25:0] address = instruction[25:0];
                if (address[25] == 0) begin
                    sign_extended_output[`WORD-1:26] = 0;
                end else begin
                    sign_extended_output[`WORD-1:26] = '1;
                end
                sign_extended_output[25:0] = address;
                end
             endcase
        end
    
endmodule
