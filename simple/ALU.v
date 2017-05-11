module ALU(in_a, in_b, alu_ctl, out, SZCV);
	input [15:0] in_a;
	input [3:0] alu_ctl;	
	input [15:0] in_b;
	output reg [15:0] out;
	output [3:0] SZCV;
	reg carry;
	reg [15:0] forout;
	always @(in_a or in_b or alu_ctl) begin
		case (alu_ctl)
			4'b0000: begin
							{carry, forout} = in_a + in_b; //ADD
							out = forout;
						end
			4'b0001: begin
							{carry, forout} = in_a - in_b; //SUB
							out = forout;
						end
			4'b0010: begin
							{carry, forout} = {1'b0, in_a & in_b}; //AND
							out = forout;
						end
			4'b0011: begin
							{carry, forout} = {1'b0, in_a | in_b}; //OR
							out = forout;
						end
			4'b0100: begin
							{carry, forout} = {1'b0, in_a ^ in_b}; //XOR
							out = forout;
						end
			4'b0101: begin
							{carry, forout} = in_a - in_b; //CMP
							out = in_b;
						end
			4'b0110: begin 
							{carry, forout} = {1'b0, in_a}; //MOV
							out = forout;
						end
		endcase
	end
	wire	overflow;
	assign overflow = (in_a[15] == in_b[15])&&(in_a[15] != forout[15]);
	assign SZCV[3] = forout[15];
	assign SZCV[2] = ~|forout;
	assign SZCV[1] = carry;
	assign SZCV[0] = (alu_ctl[3] | alu_ctl[2] | alu_ctl[1]) ? 1'b0 : overflow;
	
endmodule