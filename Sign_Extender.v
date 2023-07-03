module Sign_Extender (
    input [15:0] a,
    output [31:0] y
);
    // Extend from 16 to 32 bits
    assign y = {{16{a[15]}},a};
endmodule