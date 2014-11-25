`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:45:31 11/23/2014
// Design Name:   ssg_display
// Module Name:   /home/aneez/workspace/vSevenSegmentDisplay/ssg_display_tb.v
// Project Name:  vSevenSegmentDisplay
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ssg_display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ssg_display_tb;

	// Inputs
	reg sw;
	reg clk;
	reg rst;

	// Outputs
	wire [7:0] sseg_cathode;
	wire [3:0] sseg_anode;

	// Instantiate the Unit Under Test (UUT)
	ssg_display uut (
		//.sw(sw), 
		.clk(clk), 
		.greset(rst),
		.sseg_cathode(sseg_cathode), 
		.sseg_anode(sseg_anode)
	);

	initial begin
		// Initialize Inputs
		sw = 0;
		clk = 0;
		rst = 1;
		
		#10 rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
      //#1000 $finish;
		// Add stimulus here
		#1000000000 rst = 1;
	end
	
	always #20 clk = ~clk;

      
endmodule

