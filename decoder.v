`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:24:27 01/28/2024
// Design Name:   main
// Module Name:   G:/Projects/PROJECT0/bbb.v
// Project Name:  PROJECT0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bbb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [15:0] rdval;
	wire [15:0] rsval;
	wire [15:0] rtval;
	wire [3:0] opcode;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.rst(rst), 
		.rdval(rdval), 
		.rsval(rsval), 
		.rtval(rtval), 
		.opcode(opcode)
	);
always
begin
#10 clk=!clk;
#10 rst=!rst;
end
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

