`timescale 1ns / 1ps
module PWM(
    input clk,
	 input rst,
	 input en,
    input [7:0] val,
    output reg o
    );
	 
	reg [7:0] count = 0;
	
	always @(posedge(clk)) begin
		if (rst) count <= 0;
		else if (en) begin
			count <= count + 1;
			if (count <= val) o <= 1'b1;
			else o <= 1'b0;
			if (count >= 255) count <= 0;
		end
	end
endmodule
