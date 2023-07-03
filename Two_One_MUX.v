module Two_One_MUX #(
    parameter WIDTH = 8
) (
    input [WIDTH-1:0] d0, d1,
    input s,
    output [WIDTH-1:0] y
);
    
    // MUX Select statement
    assign y = s ? d1 : d0;
endmodule