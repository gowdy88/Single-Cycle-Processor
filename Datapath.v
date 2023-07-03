module Datapath (
    input clk, reset,
    input MemtoReg, PCSrc,
    input AluSrc, RegDst,
    input RegWrite, Jump,
    input [2:0] AluControl,
    output Zero,
    output [31:0] PC,
    input [31:0] Instruction,
    output [31:0] AluOut, WriteData,
    input [31:0] ReadData
);
    wire [4:0] Write_Register;
    wire [31:0] PCNext, PCNextBr, PCPlus4, PCBranch;
    wire [31:0] SignImm, SignImmSh;
    wire [31:0] SrcA, SrcB;
    wire [31:0] Result;

    // PC logic
    Flop_Reset #(32) PCReg(clk, reset, PCNext, PC);
    Adder PCAdd1(PC, 32'b100, PCPlus4);
    Left_Shifter ImmSh(SignImm, SignImmSh);
    Adder PCAdd2(PCPlus4, SignImmSh, PCBranch);
    Two_One_MUX #(32) PCBrMUX(PCPlus4, PCBranch, PCSrc, PCNextBr);
    Two_One_MUX #(32) PCMUX(PCNextBr, {PCPlus4[31:28],
                            Instruction[25:0], 2'b00},
                            Jump, PCNext);
    
    // Register File logic
    Register_File Rf(clk, RegWrite, Instruction[25:21],
                     Instruction[20:16], Write_Register,
                     Result, SrcA, WriteData);
    Two_One_MUX #(5) WriteMUX(Instruction[20:16], Instruction[15:11],
                              RegDst, Write_Register);
    Two_One_MUX #(32) ResMUX(AluOut, ReadData, MemtoReg, Result);
    Sign_Extender SExt(Instruction[15:0], SignImm);

    // ALU logic
    Two_One_MUX #(32) SrcBMUX(WriteData, SignImm, AluSrc, SrcB);
    ALU alu(SrcA, SrcB, AluControl, AluOut, Zero);
endmodule