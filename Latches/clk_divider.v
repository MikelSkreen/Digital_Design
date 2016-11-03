`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2014 02:44:17 AM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
    input clk,
    input rst,
    input [1:0]sw,
    output reg led
    );

wire [26:0] din;
wire [26:0] clkdiv;

dff dff_inst0 (
    .clk(clk),
    .rst(rst),
    .D(din[0]),
    .Q(clkdiv[0])
);
 
genvar i;
integer c;

generate
for (i = 1; i < 27; i=i+1)
begin : dff_gen_label
    dff dff_inst (
        .clk(clkdiv[i-1]),
        .rst(rst),
        .D(din[i]),
        .Q(clkdiv[i])
    );   
        
    end
endgenerate;
 
assign din = ~clkdiv;

always@(sw)
begin
    if(sw == 0)
        led = clkdiv[26];
    
    else if (sw == 1)
        led = clkdiv[25];
        
    else if (sw == 2)
        led = clkdiv[24];
        
    else
        led = clkdiv[23]; 
end
//assign led = clkdiv[26];
 
endmodule
