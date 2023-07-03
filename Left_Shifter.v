module Left_Shifter (
    input [31:0] a,
    output [31:0] y
);
    
    // Shifting left by 2
    assign y ={a[29:0],2'b00};
endmodule