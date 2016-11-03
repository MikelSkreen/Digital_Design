`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2015 11:12:57 AM
// Design Name: 
// Module Name: digitCount
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


module digitCount(
    input En,
    input clk,
    input rst,
    output reg [3:0]count,
    output reg nextEn
    );
    
always@(posedge(clk), posedge(rst), posedge(En))
begin

if(rst || count >= 9) begin
    count = 0;
    nextEn = 1'b1;
    end
    
else if(En) begin
    count = count + 1;
    nextEn = 1'b0;
    end

end

endmodule
