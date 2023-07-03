module ALU(
    input [31:0] A,
    input [31:0] B,
    input [2:0] AluControl,
    output reg [31:0] AluResult,
    output reg Zero
    );
    
    always @(A or B or AluControl)
    begin
    case(Control)
    3'b000: AluResult = A&B;
    3'b001: AluResult = A|B;
    3'b010: AluResult = A+B;
    3'b110: AluResult = A-B;
    3'b111: AluResult = A<B;
    endcase
    end
    
    always @(AluResult)
    begin
    if(AluResult==0)
    Zero=1;
    else 
    Zero=0;
    end
endmodule