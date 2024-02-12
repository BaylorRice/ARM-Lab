`include "verification_functions.sv"

module instr_parse_test;
import verification::*;

// create signals to be be passed into/out of the instruction_parse module
reg [`INSTR_LEN-1:0] instruction;
wire [10:0] opcode;
wire [8:0] address;
wire [4:0] rm_num;
wire [4:0] rn_num;
wire [4:0] rd_num;

// create er signals that have the same names of the signals above except that they
// have er_ appended to the beginning of the name....for example, er_rm_num
reg [10:0] er_opcode;
reg [8:0] er_address;
reg [4:0] er_rm_num;
reg [4:0] er_rn_num;
reg [4:0] er_rd_num;

string opcode_string = "|opcode|";
string address_string = "|address|";
string rm_num_string = "|rm_num|";
string rn_num_string = "|rn_num|";
string rd_num_string = "|rd_num|";
int ts = 0;
int tc = 0;

// use this instruction_parse instance for this test
instr_parse parser(
.instruction(instruction),
.rm_num(rm_num),
.rn_num(rn_num),
.rd_num(rd_num),
.address(address),
.opcode(opcode)
    );
    
initial
begin
begin_test();

// populate instructions below with the binary form of the assembly instructions
// listed in the comments.  Note that these are almost very similar to the instructions
// shown in the lecture on Machine Code


///////////////////////////////////////////////////////////////////////////////////////////////
// LDUR X9, [X22, #240]


///// TEST CASE 1 /////
$display("Test Case %0d", tc++);
$display("LDUR X9, [X22, #240]");
ts = 0;

// set instruction to the binary equivalent of the instruction listed above
// 1986 240 0 22 9
// 11111000010 011110000 00 10110 01001
instruction = `INSTR_LEN'hF84F02C9;

// wait for 2 ns
#2

// DO NOT verify rm_num is correct because it is not relevant for a D Type instruction
// verify rn_num is correct
er_rn_num = 5'd22;
verify(ts++, rn_num_string, er_rn_num, $bits(er_rn_num), rn_num, $bits(rn_num), `S_DEC);

// verify rd_num is correct
er_rd_num = 5'd9;
verify(ts++, rd_num_string, er_rd_num, $bits(er_rd_num), rd_num, $bits(rd_num), `S_DEC);

// verify address is correct
er_address = 9'd240;
verify(ts++, address_string, er_address, $bits(er_address), address, $bits(address), `S_DEC);

// verify opcode is correct
er_opcode = 11'd1986;
verify(ts++, opcode_string, er_opcode, $bits(er_opcode), opcode, $bits(opcode), `S_DEC);

// wait for 8 ns
#8

///////////////////////////////////////////////////////////////////////////////////////////////
// ADD X10, X21, X9

///// TEST CASE 2 /////
$display("\nTest Case %0d", tc++);
$display("ADD X10, X21, X9");
ts = 0;

// set instruction to the binary equivalent of the instruction listed above
// 1112 9 0 21 10
// 10001011000 01001 000000 10101 01010
instruction = `INSTR_LEN'h8B0902AA;

// wait for 2 ns
#2

// verify rm_num is correct
er_rm_num = 5'd9;
verify(ts++, rm_num_string, er_rm_num, $bits(er_rm_num), rm_num, $bits(rm_num), `S_DEC);

// verify rn_num is correct
er_rn_num = 5'd21;
verify(ts++, rn_num_string, er_rn_num, $bits(er_rn_num), rn_num, $bits(rn_num), `S_DEC);

// verify rd_num is correct
er_rd_num = 5'd5;
verify(ts++, rd_num_string, er_rd_num, $bits(er_rd_num), rd_num, $bits(rd_num), `S_DEC);

// DO NOT verify address is correct because it is not relevant for an R Type instruction
// verify opcode is correct
er_opcode = 5'd1112;
verify(ts++, opcode_string, er_opcode, $bits(er_opcode), opcode, $bits(opcode), `S_DEC);

// wait for 8 ns
#8

///////////////////////////////////////////////////////////////////////////////////////////////
// STUR X10, [X23, #64]

///// TEST CASE 3 /////
$display("\nTest Case %0d", tc++);
$display("STUR X10, [X23, #64]");

// set instruction to the binary equivalent of the instruction listed above
// 1984 64 0 23 10
// 11111000000 001000000 00 10111 01010
instruction = `INSTR_LEN'hF80402EA;

// wait for 2 ns
#2

// DO NOT verify rm_num is correct because it is not relevant for a D Type instruction
// verify rn_num is correct
er_rn_num = 5'd9;
verify(ts++, rn_num_string, er_rn_num, $bits(er_rn_num), rn_num, $bits(rn_num), `S_DEC);

// verify rd_num is correct
er_rd_num = 5'd9;
verify(ts++, rd_num_string, er_rd_num, $bits(er_rd_num), rd_num, $bits(rd_num), `S_DEC);

// verify address is correct
er_address = 5'd9;
verify(ts++, address_string, er_address, $bits(er_address), address, $bits(address), `S_DEC);

// verify opcode is correct
er_opcode = 5'd9;
verify(ts++, opcode_string, er_opcode, $bits(er_opcode), opcode, $bits(opcode), `S_DEC);

// wait for 8 ns
#8

///////////////////////////////////////////////////////////////////////////////////////////////

final_result();
$finish;
end
endmodule
