`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:28 01/13/2024 
// Design Name: 
// Module Name:    datapath_rtype 
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
module DATAPATH(rs_offset, rt_offset, op_code,shamt,rd_offset,constant,sel);

input sel;
// wire sel2;
input [3:0] op_code;
output reg [5:0] constant;
// wire [15:0] constant_ex;
reg [15:0] alu_input;
reg [15:0] rs,rt;
// reg [15:0] rd;
input [2:0] rd_offset, rs_offset, rt_offset,shamt;
// output [31:0] mul;
reg [31:0] mul;
reg [15:0] mul_high;
reg [15:0] mul_low;

reg [15:0] Regfile [0:7];

/// reg file ///
initial
begin
assign constant=0;
assign mul = 0;
assign mul_low = 0;
assign mul_high = 0;
end
initial
begin
	 Regfile[0] = 16'b 0000_000_000_100_001;  // Register on which ALU will perform action
    Regfile[1] = 16'b 0000_000_000_100_001;
    Regfile[2] = 16'b 0000_000_000_100_010;
    Regfile[3] = 16'b 0000_000_000_000_000;
    Regfile[4] = 16'b 0000_000_000_000_000;
    Regfile[5] = 16'b 0000_000_000_000_000;
    Regfile[6] = 16'b 0000_000_000_000_000;
    Regfile[7] = 16'b 0000_000_000_000_000;
end
initial
begin
assign rs = Regfile[rs_offset];
assign rt = Regfile[rt_offset];
end
/* trying sign bit extension
if (constant[15] == 1)

*/
assign constant_ex = ((16'b 0000_0000_0000_0000)|constant);
// constant or register
always @(*)
begin
if (sel == 0)
alu_input = rt;
else if (sel == 1)
alu_input = constant_ex;
end

always@(*)
begin
	if (op_code == 4'b 0000)begin		//if sel = 0 then A + B
		Regfile[rd_offset] = rs + alu_input;end
	else if (op_code == 4'b0001)begin	//if sel = 1 then A << B
		Regfile[rd_offset] = rs << shamt;end	
   else if (op_code == 4'b0010)begin	//if sel = 2 then A >> B
		Regfile[rd_offset] = rs >> shamt;end
	else if (op_code== 4'b0011 )begin	//if sel =3  then A | B
		Regfile[rd_offset] = rs|alu_input;end
	else if (op_code == 4'b0100 )begin	//if sel = 4 then A & B
		Regfile[rd_offset] = rs&alu_input;end
	else if (op_code == 4'b1110)begin	//if sel = 14 then A * B
		mul = rs * alu_input;end
	else if (op_code==13)begin
		mul_high=mul[31:16];end
	else if (op_code==15)begin
		mul_low=mul[15:0];end
	
		
	

/////////////////////////////////////(I -TYPE)//////////////////////////////////////////////////////////////////////////////////

	
	else if (op_code == 4'b0101 )begin	
		Regfile[rt_offset] = rs+alu_input;
	end
	else if (op_code == 4'b0110 )begin	
		Regfile[rt_offset] = alu_input;
	end
	else if (op_code == 4'b0111 )begin	
		rt = Regfile[rs+alu_input];
	end
	else if (op_code == 4'b1000 )begin	
		Regfile[rs+alu_input]=rt;
	end
	else begin 						
		rt = 0;
	end

end




endmodule