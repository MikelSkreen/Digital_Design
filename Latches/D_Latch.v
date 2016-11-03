`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2014 07:15:22 PM
// Design Name: 
// Module Name: D_Latch
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


module D_Latch(
input D, 
input G,
output Q_t, 
output Qn_t
);

wire n1;
wire n2;

NAND_Latch uut(
.S(n1),
.R(n2),
.Q(Q_t),
.Qn(Qn_t)
);

assign n1 = ~(D & G);
assign n2 = ~(~D & G);

endmodule
