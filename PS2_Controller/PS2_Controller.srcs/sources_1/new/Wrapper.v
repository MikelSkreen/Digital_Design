`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2015 04:06:54 PM
// Design Name: 
// Module Name: Wrapper
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


module Wrapper(
    input clk,
    input rst,
    input PS2Clk,
    input PS2Data,
    output [6:0]seg,
    output [7:0]an,
    output dp,
    output [0:0]led
    );
    
PS2_Keyboard kitty_poop(
    .clk25(clk25),
    .rst(rst),
    .PS2Clk(PS2Clk),
    .PS2Data(PS2Data),
    .xkey(code),
    .space(led)
    );
    
sseg_Decoder kitty_poop2(
    .clk(clk),
    .rst(rst),
    .digit1(code[3:0]),
    .digit2(code[7:4]),
    .digit3(code[11:8]),
    .digit4(code[15:12]),
    .digit5(4'h0),
    .digit6(4'h0),
    .digit7(4'h0),
    .digit8(4'h0),
    .seg(seg),
    .an(an),
    .dp(dp)
    );
    
    wire [15:0]code;
    
    reg [24:0]count;
    
    always @(posedge clk or posedge rst)
        begin
            if (rst == 1)
                count <= 0;
            else 
                count <= count + 1;
        end
        
    assign clk190 = count[17];
    assign clk25 = count[0];
    assign clk3 = count[23];
    
endmodule
