`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:13:20 10/22/2014 
// Design Name: 
// Module Name:    rom 
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
module rom(
//	input wire clk,
//	input wire ren,
	input wire[9:0] addr,
	output wire[9:0] data
	);
	 
	reg [9:0] rom[1023:0];
//	reg [7:0] addr_ff; 
	initial $readmemh("C:/Users/Mikel/OneDrive/School/EE 324/Project_4/Waveform_Synthesis_v2/sine2.hex",rom,0,1023);
		
//	always @(posedge clk) begin
//		if(ren==1'b1) begin
//			addr_ff <= addr;
//		end
//	end
		
	assign data = rom[addr]; 
	 
	 
endmodule
