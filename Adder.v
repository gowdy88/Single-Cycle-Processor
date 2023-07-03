module Adder (
    input [31:0] a, b,
    output [31:0] y
);
    // Addition operation
    assign y = a + b;
endmodule