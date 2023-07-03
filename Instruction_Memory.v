module Instruction_Memory (
    input [5:0] Blocks,
    output [31:0] Instruction
);
    // Blocks of 32-bit instruction divided in RAM
    reg [31:0] RAM [63:0];

    initial begin
    end

    assign Instruction = RAM[Blocks];
endmodule