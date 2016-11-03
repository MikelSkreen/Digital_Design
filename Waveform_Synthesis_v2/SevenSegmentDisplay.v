`timescale 1ns / 1ps
module SevenSegmentDisplay(
    input clk,
	 input rst,
    input [3:0] d0,
    input [3:0] d1,
    input [3:0] d2,
    input [3:0] d3,
    output reg [7:0] seg,
    output reg [3:0] an
    );

	reg [9:0] count = 0;
	reg [7:0] d0_seg, d1_seg, d2_seg, d3_seg;

	always @(posedge(clk)) begin
		if (rst)	count <= 0;
		else		count <= count + 1;
		
		if (count < 255) begin
			seg <= d3_seg;
			an <= 4'b0111;
		end else if (count < 511) begin
			seg <= d2_seg;
			an <= 4'b1011;
		end else if (count < 767) begin
			seg <= d1_seg;
			an <= 4'b1101;
		end else if (count < 1000) begin
			seg <= d0_seg;
			an <= 4'b1110;
		end else if (count > 1000) begin
			count <= 0;
		end
		else begin
			an <= 4'b1111;
			seg <= 8'b11111111;
		end
	end
	
	always @(d0, d1, d2, d3) begin
		case (d0)
			4'b0000: d0_seg <= 8'b11000000;
			4'b0001: d0_seg <= 8'b11111001;
			4'b0010: d0_seg <= 8'b10100100;
			4'b0011: d0_seg <= 8'b10110000;
			4'b0100: d0_seg <= 8'b10011001;
			4'b0101: d0_seg <= 8'b10010010;
			4'b0110: d0_seg <= 8'b10000010;
			4'b0110: d0_seg <= 8'b11111000;
			4'b1000: d0_seg <= 8'b10000000;
			4'b1001: d0_seg <= 8'b10010000;
			4'b1010: d0_seg <= 8'b10001000;
			4'b1011: d0_seg <= 8'b10000011;
			4'b1100: d0_seg <= 8'b10100111;
			4'b1101: d0_seg <= 8'b10100001;
			4'b1110: d0_seg <= 8'b10000110;
			4'b1111: d0_seg <= 8'b10001110;
			default: d0_seg <= 8'b11111111;
		endcase
				case (d1)
			4'b0000: d1_seg <= 8'b11000000;
			4'b0001: d1_seg <= 8'b11111001;
			4'b0010: d1_seg <= 8'b10100100;
			4'b0011: d1_seg <= 8'b10110000;
			4'b0100: d1_seg <= 8'b10011001;
			4'b0101: d1_seg <= 8'b10010010;
			4'b0110: d1_seg <= 8'b10000010;
			4'b0110: d1_seg <= 8'b11111000;
			4'b1000: d1_seg <= 8'b10000000;
			4'b1001: d1_seg <= 8'b10010000;
			4'b1010: d1_seg <= 8'b10001000;
			4'b1011: d1_seg <= 8'b10000011;
			4'b1100: d1_seg <= 8'b10100111;
			4'b1101: d1_seg <= 8'b10100001;
			4'b1110: d1_seg <= 8'b10000110;
			4'b1111: d1_seg <= 8'b10001110;
			default: d1_seg <= 8'b11111111;
		endcase
				case (d2)
			4'b0000: d2_seg <= 8'b11000000;
			4'b0001: d2_seg <= 8'b11111001;
			4'b0010: d2_seg <= 8'b10100100;
			4'b0011: d2_seg <= 8'b10110000;
			4'b0100: d2_seg <= 8'b10011001;
			4'b0101: d2_seg <= 8'b10010010;
			4'b0110: d2_seg <= 8'b10000010;
			4'b0110: d2_seg <= 8'b11111000;
			4'b1000: d2_seg <= 8'b10000000;
			4'b1001: d2_seg <= 8'b10010000;
			4'b1010: d2_seg <= 8'b10001000;
			4'b1011: d2_seg <= 8'b10000011;
			4'b1100: d2_seg <= 8'b10100111;
			4'b1101: d2_seg <= 8'b10100001;
			4'b1110: d2_seg <= 8'b10000110;
			4'b1111: d2_seg <= 8'b10001110;
			default: d2_seg <= 8'b11111111;
		endcase
		case (d3)
			4'b0000: d3_seg <= 8'b11000000;
			4'b0001: d3_seg <= 8'b11111001;
			4'b0010: d3_seg <= 8'b10100100;
			4'b0011: d3_seg <= 8'b10110000;
			4'b0100: d3_seg <= 8'b10011001;
			4'b0101: d3_seg <= 8'b10010010;
			4'b0110: d3_seg <= 8'b10000010;
			4'b0110: d3_seg <= 8'b11111000;
			4'b1000: d3_seg <= 8'b10000000;
			4'b1001: d3_seg <= 8'b10010000;
			4'b1010: d3_seg <= 8'b10001000;
			4'b1011: d3_seg <= 8'b10000011;
			4'b1100: d3_seg <= 8'b10100111;
			4'b1101: d3_seg <= 8'b10100001;
			4'b1110: d3_seg <= 8'b10000110;
			4'b1111: d3_seg <= 8'b10001110;
			default: d3_seg <= 8'b11111111;
		endcase
	end
endmodule
