`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:35:24 11/16/2014
// Design Name:   vCounter2BCD
// Module Name:   /home/aneez/workspace/vLCDisplay/vCounter2BCD_tb.v
// Project Name:  vLCDisplay
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vCounter2BCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vCounter4DigitBCD_tb;

	// Inputs
	reg clk;
	reg enable;
	reg rst;

	// Outputs
	wire [15:0] count;
	wire cout;
	// Instantiate the Unit Under Test (UUT)
	vCounter4DigitBCD uut (
		.clk(clk), 
		.count(count), 
		.enable(enable),
		.cout(cout),
		.grst(rst)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		enable = 0;
		rst = 0;
		
		#10 enable = 1;

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
	always #10 clk = ~clk;
	
	initial
	#10000  $finish; 
      
endmodule

