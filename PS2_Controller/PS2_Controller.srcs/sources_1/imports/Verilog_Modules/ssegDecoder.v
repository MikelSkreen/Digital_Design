`timescale 1ns / 1ps
//////////////////////////////////////////////
// Module: 7-seg decoder
// Author: Mikel Skreen
// Created: 09-28-2015 03:38 PM
//////////////////////////////////////////////


module sseg_Decoder(
	input clk,
	input rst,
	input [3:0]digit1,
	input [3:0]digit2,
	input [3:0]digit3,
	input [3:0]digit4,
	input [3:0]digit5,
	input [3:0]digit6,
	input [3:0]digit7,
	input [3:0]digit8,
	output [6:0]seg,
	output [7:0]an,
	output reg dp
	);

	localparam N = 18;

	reg [7:0]an_temp;
    reg [6:0]sseg_temp;
    reg [3:0]sseg;
	reg [N-1:0]count; //the 18 bit counter which allows us to multiplex at 1000Hz

always @ (posedge clk or posedge rst)
begin
    if (rst)
        count <= 0;
    else
        count <= count + 1;
end

always@(*)
begin
    case(count[N-1:N-2]) //[N-1:N-3])
    2'b00: begin
        sseg = digit1;
        an_temp = 8'b11111110;
        dp = 1'b1;
    end
    
    2'b01: begin
        sseg = digit2;
        an_temp = 8'b11111101;
        dp = 1'b1;
    end
    
    2'b10: begin
        sseg = digit3;
        an_temp = 8'b11111011;
        dp = 1'b1;
    end
     
    2'b11: begin
        sseg = digit4;
        an_temp = 8'b11110111;
        dp = 1'd1;
    end

//    2'b100: begin
//        sseg = digit5;
//        an_temp = 4'b11101111;
//        dp = 1'd1;
//    end

//    2'b101: begin
//        sseg = digit6;
//        an_temp = 4'b11011111;
//        dp = 1'd1;
//    end

//    2'b110: begin
//        sseg = digit7;
//        an_temp = 4'b10111111;
//        dp = 1'd1;
//    end

//    2'b011: begin
//        sseg = digit8;
//        an_temp = 4'b01111111;
//        dp = 1'd1;
//    end
         
    endcase
end
  
    
    always @ (*)
    begin
        case(sseg)
            4'd0 : sseg_temp = 7'b1000000; // 0
            4'd1 : sseg_temp = 7'b1111001; // 1
            4'd2 : sseg_temp = 7'b0100100; // 2
            4'd3 : sseg_temp = 7'b0110000; // 3
            4'd4 : sseg_temp = 7'b0011001; // 4
            4'd5 : sseg_temp = 7'b0010010; // 5
            4'd6 : sseg_temp = 7'b0000010; // 6
            4'd7 : sseg_temp = 7'b1111000; // 7
            4'd8 : sseg_temp = 7'b0000000; // 8
            4'd9 : sseg_temp = 7'b0010000; // 9
            4'd10 : sseg_temp = 7'b0001000;// A
            4'd11 : sseg_temp = 7'b0000011;// b
            4'd12 : sseg_temp = 7'b1000110;// C
            4'd13 : sseg_temp = 7'b0100001;// d
            4'd14 : sseg_temp = 7'b0000110;// E
            4'd15 : sseg_temp = 7'b0001110;// F
            default : sseg_temp = 7'b0111111; //dash
        endcase
    end

    assign an[3:0] = an_temp[3:0];
    assign seg = sseg_temp;

    // Use this to turn off first four digits
     assign an[7:4] = 6'b111111;


endmodule