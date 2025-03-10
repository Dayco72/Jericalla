//Diego Jared Jimenez Silva

//RAM
module RAM(
	input [3:0] Dir, //Direcciones
	input [31:0] Din, 
	input en,
	output reg [31:0] DatoS //Dato de salida
);

reg [31:0]mem[0:15]; //Memoria


always @(*)
begin
	if(en)
	begin
		mem[Dir] = Din; //Escribir
	end
	else
		DatoS = mem[Dir]; //Leemos
	end
end
endmodule
