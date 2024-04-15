`timescale 1ns / 1ps
`include "verification_functions.sv"
//////////////////////////////////////////////////////////////////////////////////
// Company: Baylor University
// Engineer: Reese Ford
// 
// Create Date: 04/15/2024 12:19:42 PM
// Design Name: Full Datapath Integration
// Module Name: datapath
// Project Name: Lab 11 - Write Back
// Target Devices: Vivado Simulation
// Tool Versions: Vivado 2021.2
// Description: I don't even know anymore
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module datapath;
    import verification::*;

    int tc = 1;
    int ts = 1;
    
    string pc_string = "|cur_pc|";
    string instr_string = "|instruction|";
    string sign_extended_output_string = "|sign_extended_output|";
    string reg2_loc_string = "|reg2_loc|";
    string uncondbranch_string = "|uncondbranch|";
    string branch_string = "|branch|";
    string mem_read_string = "|mem_read|";
    string mem_to_reg_string = "|mem_to_reg|";
    string alu_op_string = "|alu_op|";
    string mem_write_string = "|mem_write|";
    string alu_src_string = "|alu_src|";
    string reg_write_string = "|reg_write|";
    string read_data1_string = "|read_data1|";
    string read_data2_string = "|read_data2|";
    string opcode_string = "|opcode|";
    
    
   
endmodule 
