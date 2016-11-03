`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:25:35 10/27/2014 
// Design Name: 
// Module Name:    ToneSelector 
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
module ToneSelector(
    input ps2clk,
    input [7:0] keyin,
    output reg [9:0] tonediv
    );
always @(posedge(ps2clk)) begin
	case (keyin)
		8'h0D : tonediv <= 758;
		8'h16 : tonediv <= 705;
		8'h15 : tonediv <= 665;
		8'h1E : tonediv <= 628;
		8'h1D : tonediv <= 592;
		8'h24 : tonediv <= 559;
		8'h25 : tonediv <= 527;
		8'h2d : tonediv <= 498;
		8'h2e : tonediv <= 471;
		8'h2c : tonediv <= 444;
		8'h36 : tonediv <= 419;
		8'h35 : tonediv <= 395;
		8'h3c : tonediv <= 373;
		8'h3e : tonediv <= 352;
		8'h43 : tonediv <= 332;
		8'h46 : tonediv <= 314;
		8'h44 : tonediv <= 296;
		8'h4d : tonediv <= 280;
		8'h4e : tonediv <= 264;
		8'h54 : tonediv <= 249;
		8'h55 : tonediv <= 235;
		8'h5b : tonediv <= 222;
		default : tonediv <= 2000;
	endcase
end

endmodule
