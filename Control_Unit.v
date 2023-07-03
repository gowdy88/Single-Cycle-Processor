module Control_Unit (
    input [5:0] Opcode,
    output MemtoReg, MemWrite,
    output Branch, AluSrc,
    output RegDst, RegWrite,
    output Jump,
    output [1:0] AluOp
);
    reg [8:0] ControlSignalValues;

    assign {RegWrite, RegDst, AluSrc, Branch, MemWrite, MemtoReg, Jump, AluOp} = ControlSignalValues;

    always@(*)
    case(Opcode)
        6'b000000: ControlSignalValues <= 9'b110000010; //R-type
        6'b100011: ControlSignalValues <= 9'b101001000; //LW
        6'b101011: ControlSignalValues <= 9'b001010000; //SW
        6'b000100: ControlSignalValues <= 9'b000100001; //BEQ
        6'b001000: ControlSignalValues <= 9'b101000000; //ADDI
        6'b000010: ControlSignalValues <= 9'b000000100; //J-type
        default:   ControlSignalValues <= 9'bxxxxxxxxx; //Default Case
    endcase

endmodule