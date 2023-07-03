module Control_Path (
    input [5:0] Opcode, Funct,
    input Zero,
    output MemtoReg, MemWrite,
    output PCSrc, AluSrc,
    output RegDst, RegWrite,
    output Jump,
    output [2:0] AluControl
);
    
    // [31:26] Instruction Opcode and [5:0] Instruction Funct inputs
    wire [1:0] AluOp;
    wire Branch;

    Control_Unit CU(Opcode, MemtoReg, MemWrite, Branch
                    AluSrc, RegDst, RegWrite, Jump,
                    AluOp);
    
    ALU_Control AC(Funct, AluOp, AluControl);

    assign PCSrc = Branch & Zero;
endmodule