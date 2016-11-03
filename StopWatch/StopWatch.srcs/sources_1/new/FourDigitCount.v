`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2015 03:40:59 PM
// Design Name: 
// Module Name: FourDigitCount
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FourDigitCount(
    input clk,
    input rst,
    input En,
    output reg [1:0]curDigit,
    output reg [3:0]first,
    output reg [3:0]second,
    output reg [3:0]third,
    output reg [3:0]fourth
    );
            
always @ (posedge clk, posedge rst)
    begin
    curDigit <= 2'b00; 
        if (rst) begin
            first <= 0;
            second <= 0;
            third <= 0;
            fourth <= 0;
        end
        else if (first==4'd9 && En)
        begin  //xxx9 reached
            first <= 0;
            curDigit <= 2'b01;
            if (second == 4'd9 && En) 
            begin //xx99 reached
                second <= 0;
                curDigit <= 2'b10;
                if (third == 4'd9 && En) 
                begin //x999 reached
                    third <= 0;
                    curDigit <= 2'b11;
                    if (fourth == 4'd9 && En) //9999 reached
                        fourth <= 0;
                    else
                        fourth <= fourth +1;
                end
                else
                   third <= third +1;
             end
             else
                second <= second + 1;
        end
        else
            first <= first + 1;
    end      
        
endmodule

