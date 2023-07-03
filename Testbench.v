module testbench();
reg clk;
reg reset;

wire [31:0] WriteData, DataAddress;
wire MemWrite;
Top u(clk, reset, WriteData, DataAddress, MemWrite);

initial begin
    reset <= 1;
    #3;
    reset <= 0;
end

always
begin
    clk <= 1;
    #5;
    clk <= 0;
    #5;
end
endmodule