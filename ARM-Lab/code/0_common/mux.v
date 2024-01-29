`include "definitions.vh"

module mux#(
    parameter SIZE=8)(
    input [SIZE-1:0] a_in,
    input [SIZE-1:0] b_in,
    input control,
    output [SIZE-1:0] mux_out
);

    always begin
        // DONE: Add body of mux here
        if (control) begin
            mux_out = a_in;
        end else begin
            mux_out = b_in;
        end
    end

endmodule
