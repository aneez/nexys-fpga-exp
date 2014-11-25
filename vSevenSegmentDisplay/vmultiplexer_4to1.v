`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:36:45 11/23/2014 
// Design Name: 
// Module Name:    vmultiplexer_4to1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module vmultiplexer_4to1(
    input [1:0] sel,
    input [3:0] inp,
    output out
    );
	 
	 assign out = ( sel == 0 )? inp[0] : ( sel == 1 )? inp[1] : ( sel == 2 )? inp[2] : inp[3];

endmodule
