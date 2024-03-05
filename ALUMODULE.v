`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:02:36 01/13/2024 
// Design Name: 
// Module Name:    ALUMODULE 
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
module ALUMODULE(rsval,rtval,shamt,opcode,rdval,clk,rst);
input clk,rst;
input [15:0] rsval, rtval;
input [2:0] shamt;
input [3:0] opcode;
output reg [15:0] rdval;
reg [31:0] y;
reg [15:0]temp_lo,temp_hi;
initial
begin
y = rsval*rtval;
temp_lo = y[15:0];
temp_hi = y[31:16];
end
always@(posedge clk,posedge rst)  begin
if(rst == 1)
rdval = 0;
else if (opcode == 11)
rdval = temp_lo;
end

always@(posedge clk,posedge rst)  begin
if(rst == 1)
rdval = 0;
else if (opcode == 12)
rdval = temp_hi;
end
  always @(*)
  begin
    if (opcode == 0)
      rdval = rsval+rtval; //Addition
	 else if (opcode == 3)
		rdval = rsval*rtval; //Multiplication
	 else if (opcode == 4)
		rdval = rsval/rtval; //Division
	 else if (opcode == 1)
		rdval = rsval<<shamt; //Left shift
	 else if (opcode == 2)
		rdval = rsval>>shamt; //Right Shift
	 else if (opcode == 7)
		rdval = rsval & rtval; //AND Operation
	 else if (opcode == 6)
		rdval = rsval | rtval; //OR Operation
  end

endmodule
