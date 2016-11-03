`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2014 05:05:52 PM
// Design Name: 
// Module Name: VGA_Controller
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


module VGA_Controller(
    input clk,
    input rst,
    output HS,
    output VS,
    output [3:0]Red,
    output [3:0]Green,
    output [3:0]Blue
    );
    
wire newclk;
wire [9:0]hCount;
wire [9:0]vCount;
wire TC_En;
wire in_range;
wire hertclk;

// generates a clock close to 1Hz in order to drive Mario Animation
ClkDivider kitty_poop(
    .clk(clk),
    .rst(rst),
    .clk_div(hertclk)
    );

clk_divider kitty_poop0(
    .clk(clk),
    .rst(rst),
    .clkD(newclk)
    );

// Horizontal counter module    
Hor_Count kitty_poop1(
    .clk(newclk),
    .rst(rst),
    .TC(TC_En),
    .hCount(hCount)
    );

// Verticle counter module, driven by Hor_Count's TC     
Vert_Count kitty_poop2(
    .clk(TC_En),
    .En(1'd1),
    .rst(rst),
    .vCount(vCount)
    );

// Module determines Horizontal sync
Hor_cmp kitty_poop3(
    .A(hCount),
    .HS(HS)
    );

// Module determines Verticle Sync    
Vert_cmp kitty_poop5(
    .A(vCount),
    .VS(VS)
    );
    
// Looks at the current horizontal and verticle counts and determines
// whether they're in the viewable range    
cmp kitty_poop4(
    .A(hCount),
    .B(vCount),
    .out(in_range)
    );

// Mario animation subroutine driven by the hertclk
M_stand kitty_poop6(
    .v(vCount),
    .h(hCount),
    .clk(hertclk),
    .in_range(in_range),
    .R(Red),
    .G(Green),
    .B(Blue)
    ); 

endmodule
