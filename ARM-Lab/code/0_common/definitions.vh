`timescale 1ns / 1ps
`define CYCLE 10
`define WORD  64
`define INSTR_LEN 32
`define HEX 0
`define S_DEC 1
`define US_DEC 2
`define BINARY 3

// School Computer
//`define DMEMFILE  "C:/Users/reese_ford1/Documents/GitHub/ARM-Lab/ARM-Lab/testfiles/ramData.data"
//`define IMEMFILE  "C:/Users/reese_ford1/Documents/GitHub/ARM-Lab/ARM-Lab/testfiles/instrData.data"
//`define RMEMFILE  "C:/Users/reese_ford1/Documents/GitHub/ARM-Lab/ARM-Lab/testfiles/regData.data"

// Personal Laptop
`define DMEMFILE  "C:/Users/reese/Documents/GitHub/ARM-Lab/ARM-Lab/testfiles/ramData.data"
`define IMEMFILE  "C:/Users/reese/Documents/GitHub/ARM-Lab/ARM-Lab/testfiles/instrData.data"
`define RMEMFILE  "C:/Users/reese/Documents/GitHub/ARM-Lab/ARM-Lab/testfiles/regData.data"

// For Control Unit
`define ADD 11'b10001011000
`define SUB 11'b11001011000
`define AND 11'h450
`define ORR 11'b10101010000
`define LDUR 11'b11111000010
`define STUR 11'b11111000000
`define CBZ 11'b10110100XXX
`define B 11'b000101XXXXX
`define ALUOp_RTYPE 2'b10
`define ALUOp_DTYPE 2'b00
`define ALUOp_B 2'b00
`define ALUOp_CBZ 2'b01

// For ALU
`define ALU_AND 4'b0000
`define ALU_ORR 4'b0001
`define ALU_ADD 4'b0010
`define ALU_SUB 4'b0110
`define ALU_PASS 4'b0111