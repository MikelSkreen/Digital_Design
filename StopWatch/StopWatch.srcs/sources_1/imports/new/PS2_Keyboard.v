`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2015 04:37:18 PM
// Design Name: 
// Module Name: PS2_Keyboard
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


module PS2_Keyboard(
    input wire clk_25, 
	input wire rst,
	input wire PS2Clk,
	input wire PS2Data,
	output wire [15:0] xkey,
	output wire space,
	output wire start,
	output wire stop,
	output wire inc
    );
    
    reg PS2Clkf, PS2Dataf;
    reg [7:0] ps2clk_filter, ps2data_filter; //clk and data filters
    reg [10:0] shift1, shift2; //2, 2-digit shift registers
    
    always @(posedge clk_25 or posedge rst)
        begin 
            if (rst == 1)
                begin 
                    ps2clk_filter <= 0;
                    ps2data_filter <= 0;
                    PS2Clkf <= 1;
                    PS2Dataf <= 1;
                end
            else
                begin
                    ps2clk_filter[7] <= PS2Clk;
                    ps2clk_filter[6:0] <= ps2clk_filter[7:1];
                    ps2data_filter[7] <= PS2Data;
                    ps2data_filter[6:0] <= ps2data_filter[7:1];
                    
                    if (ps2clk_filter == 8'b11111111) //If filters are full display code
                        PS2Clkf <= 1;
                    else if (ps2clk_filter == 8'b00000000)
                        PS2Clkf <= 0;
                    if(ps2data_filter == 8'b11111111)
                        PS2Dataf <= 1;
                    else if(ps2data_filter == 8'b00000000)
                            PS2Dataf <= 0;
                end
        end
        
    always @(negedge PS2Clkf or posedge rst)
        begin
            if (rst == 1)
                begin 
                    shift1 <= 0;
                    shift2 <= 0;
                end
            else
                begin
                    shift1 <= {PS2Dataf,shift1[10:1]};
                    shift2 <= {shift1[0],shift2[10:1]};
                end
        end
        
        
    assign xkey = {shift2[8:1], shift1[8:1]};
    //assign key3 = xkey == 'hF026 ? 1 : 0;
    assign space = shift1[8:1] == shift2[8:1];//xkey == 'hF029 ? 1 : 0;
    
    assign start = xkey == 'hF05a ? 1 : 0;
    assign inc = xkey == 'hF043 ? 1 : 0;
    assign stop = xkey == 'hF076 ? 1 : 0;
    
endmodule
