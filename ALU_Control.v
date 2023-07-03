module ALU_Control (
    input [5:0] Funct,
    input [1:0] AluOp,
    output reg [2:0] AluControl
);
    
    always@(*)
    case(AluOp)
        2'b00: AluControl <= 3'b010; // Addition
        2'b01: AluControl <= 3'b110; // Subtraction
        default: case(Funct)         // R-Type in general
            6'b100000: AluControl <= 3'b010; // Addition
            6'b100010: AluControl <= 3'b110; // Subtraction
            6'b100100: AluControl <= 3'b000; // AND Operation
            6'b100101: AluControl <= 3'b001; // OR Operation
            6'b101010: AluControl <= 3'b111; // SLT Operation
            default: AluControl <= 3'bxxx; // When ALU is not used
            endcase
    endcase
endmodule