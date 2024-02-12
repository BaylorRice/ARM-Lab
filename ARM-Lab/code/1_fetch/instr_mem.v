`include "definitions.vh"

module instr_mem#(
    parameter SIZE=1024)(
    // DONE: Add ports for this module
    input wire clk,
    input wire [`WORD-1:0] pc,
    output reg [`INSTR_LEN-1:0] instruction
);

    // DONE: create imem array here
    reg[`INSTR_LEN-1:0] imem [SIZE-1:0];

    // DONE: insert code here to fetch the correct
    // instruction from imem
    always @(posedge clk) begin
        instruction = imem[pc/4];
    end

    //initialize memory from file
    initial
    $readmemh(`IMEMFILE, imem);

endmodule
