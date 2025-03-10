//Diego Jared Jimenez Silva

//ROM
module ROM(
	input [3:0] Dir1, //Direcciones
	input [3:0] Dir2, 
	output reg [31:0] DatoL1, //Dato de lectura
	output reg [31:0] DatoL2, //Dato de lectura
);

reg [31:0]mem[0:15]; //Memoria

//Leemos el archivo
initial
begin 
	#100
	$readmemb("datos", inst.mem); 
end

//Asignamos
always @(*)
begin
	DatoL1 = mem[Dir1];	
	DatoL2 = mem[Dir2];		
end
endmodule
//--------------


