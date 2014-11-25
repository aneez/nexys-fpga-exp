`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:45:00 08/26/2014 
// Design Name: 
// Module Name:    LedBlink 
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
module Counter(
	 input rst,
    input clk,
    input [7:0] sw,
    output [7:0] led
    );

reg [31:0] count;

initial count = 32'b0;
assign led[7:0] = count[31:24];
always @(posedge clk) 
begin
	if(~rst)
		count <= count + sw;
	else
		count <= 0;
end

endmodule
