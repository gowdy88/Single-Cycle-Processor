module MIPS (input clk, reset,
    output [31:0] PC,
    input [31:0] Instruction,
    output MemWrite,
    output [31:0] AluOut, WriteData,
    input [31:0] ReadData);

    wire MemtoReg, Branch, AluSrc, RegDst, RegWrite, Jump;
    wire [2:0] AluControl;
    Control_Path cp(Instruction[31:26], Instruction[5:0], Zero,
    MemtoReg, MemWrite, PCSrc,
    AluSrc, RegDst, RegWrite, Jump,
    AluControl);
    Datapath dp(clk, reset, MemtoReg, PCSrc,
    AluSrc, regdst, regwrite, Jump,
    AluControl,
    Zero, PC, Instruction,
    AluOut, WriteData, ReadData);
endmodule