`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name:    
// Module Name:    
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments:        
//
//////////////////////////////////////////////////////////////////////////////////
module div_frec (
	input wire clk,       //Se�al de entrada, referente a comportamiento de reloj.
	input wire reset,     //Reset de se�al.
	output reg s_clk      //Se�al de salida del divisor, se�al ya dividida.
    );
	  
reg [15:0] cuenta; //Bus de datos de 3 bits referente al contador
					   //para una unidad decimal maxima de 8 (2^3 = 8) suficiente para la cuenta de 5.
 
always @(posedge clk) //Se procede a realizar el codigo posterior siempre que "clk" o "reset" est�n en alto.
	begin
		if (reset) //Si "reset" est� en alto, se pone la salida "s_clk" en 0 y se resetea la cuenta.
			begin
				s_clk <= 16'b0;
				cuenta <= 1'b0;
			end 
		else //Se est� en alto la se�al de "clk" pero no la de "reset" se procede a realizar lo siguiente.
			begin		
				if (cuenta == 16'd65535)//(5)-1 = 4, Si el contador llega a la cuenta 5:   
					//Por si las dudas => "3'd4"(notaci�n decimal) es igual a "3'b100"(notaci�n binaria). 
					begin                    
						cuenta <= 16'h0;  //Se resetea la cuenta poniendola en cero   
						s_clk <= ~s_clk;  //
					end 
				else 
					cuenta <= cuenta + 1'b1; //De no ser el valor a dividir, el contador seguir� contando (valga la redundancia)
			end
	end
 
endmodule

