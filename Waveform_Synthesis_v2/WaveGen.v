`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:13:27 11/06/2014 
// Design Name: 
// Module Name:    WaveGen 
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
module WaveGen(
    input clk,
    input [9:0] divider,
    output reg [9:0] out
    );
reg [9:0] count;

always @(posedge(clk)) begin
	if (count == divider) begin
		out = out + 1;
		count = 0;
	end
	else count = count + 1;
end


endmodule
