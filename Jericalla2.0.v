//Diego Jared Jimenez Silva

//Modulo Jericalla
module Jericalla(
	input [16:0] instruccion,
	output reg [31:0] salida,
	output reg zflag
);

wire [31:0] cable1, cable2, cable3, cable4;

ROM Romtb(.Dir1(instruccion[8:5]), .Dir2(instruccion[4:1]), .DatoL1(cable1), .DatoL2(cable2));
ALU Alutb(.A(cable1), .B(cable2), .op(instruccion[12:9]), .Res(cable3), .zflag(zflag));
RAM Ramtb(.Dir(instruccion[16:13]), .Din(cable3), .en(instruccion[0]), .DatoS(salida));
endmodule

//Testbench
module Jericallatb();
reg [16:0] instrucciontb;
wire [31:0] salidatb;
wire zflagtb;

Jericalla tb(.instruccion(instrucciontb), .salida(salidatb), .zflag(zflagtb));

initial
begin
	//Analizamos la suma
	instrucciontb= 32'b00100010010001101;
	/*
		Analizamos los siguiente
		DirRam = 0011;
		op= 0010;
		Dir1= 0100;
		Dir2= 0110;
		en= 1;
	*/

	#100;
	 
	//Leemos
	instrucciontb= 32'b00100000000000000; //Cambimos el ultimo bit que es el que importa, para leer el valor
	#100;
	 
	$stop;
end
endmodule