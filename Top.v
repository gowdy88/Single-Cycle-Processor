module Top (
    input clk, reset,
    output [31:0] WriteData, DataAddress,
    output MemWrite
);
    wire [31:0] PC, Instruction, ReadData;
    MIPS mips(clk, reset, PC, Instruction, MemWrite
              DataAddress, WriteData, ReadData);
    Instruction_Memory imem(PC[7:2], Instruction);
    Data_Memory dmem(clk, MemWrite, DataAddress, WriteData, ReadData);    
endmodule