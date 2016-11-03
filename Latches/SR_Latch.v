`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2014 11:04:59 AM
// Design Name: 
// Module Name: SR_Latch
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


module SR_Latch_NOR(
    input S,
    input R,
    output Q,
    output Qn
);
    
wire Q_int;
wire Qn_int;
     
assign #1 Q_int = (~S & ~Qn_int);
assign #1 Qn_int = ~(R | Q_int);
assign Q = Q_int;
assign Qn = Qn_int;

endmodule