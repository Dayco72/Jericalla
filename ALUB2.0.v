//Diego Jared Jimenez Silva

//ALU
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] op,
    output reg [31:0] Res,
	output reg Zflag
);

always @(*) begin
    case(op)
        4'b0000: Res = A & B;      // AND
        4'b0001: Res = A | B;      // OR
        4'b0010: Res = A + B;      // ADD
        4'b0110: Res = A - B;      // Resta
        4'b0111: Res = (A < B) ? 32'd1 : 32'd0;  // TERNARIA
        4'b1100: Res = ~(A | B); //NOR
        default: Res = 32'd0;
    endcase
	
	 Zflag = (Res == 32'd0) ? 1'b1 : 1'b0;
end
endmodule
