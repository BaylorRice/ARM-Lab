`include "definitions.vh"

module mux#(
    parameter SIZE=8)(
    input [SIZE-1:0] a_in,
    input [SIZE-1:0] b_in,
    input control,
    output [SIZE-1:0] mux_out
);

    // 0 -> a, 1 -> b

    // DONE: Add body of mux here
    assign mux_out = control ? b_in : a_in;

endmodule
