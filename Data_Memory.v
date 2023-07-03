module Data_Memory (
    input clk, MemWrite,
    input [31:0] Address, Write_Data,
    output [31:0] Read_Data
);
    reg [31:0] RAM[63:0];
    assign Read_Data = RAM[Address[31:2]]; // Word Aligning
    always@(posedge clk)
    if(MemWrite)
        RAM[Address[31:2]] <= Write_Data;
endmodule