`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2015 02:21:59 PM
// Design Name: 
// Module Name: clkDiv
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


module clkDiv(
    input clk,
    input rst,
    input [31:0]constNum,
    output reg clk_div
    );
    
reg [31:0]count;
    
    always@(posedge(clk) or posedge(rst))
    begin
        if(rst == 1'b1)
        begin
            count <= 32'b0;
            clk_div <= 1'b0;
        end    
        else if(count == constNum - 1)
        begin
            count <= 32'b0;
            clk_div <= ~clk_div;
        end
        else
        begin
            count <= count + 1'b1;
            clk_div <= clk_div;
        end
    end
    
endmodule
