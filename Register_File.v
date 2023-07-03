module Register_File (
    input clk,
    input RegWrite,
    input [4:0] Read_Register1, Read_Register2, Write_Register,
    input [31:0] Write_Data,
    output [31:0] Read_Data1, Read_Data2
);
    reg [31:0] RF [31:0];

    always@(posedge clk)
        if(RegWrite)
        begin
            RF[Write_Register] <= Write_Data;
        end
    
    assign Read_Data1 = (Read_Register1 != 0) ? RF[Read_Register1] : 0;
    assign Read_Data2 = (Read_Register2 != 0) ? RF[Read_Register2] : 0;

endmodule