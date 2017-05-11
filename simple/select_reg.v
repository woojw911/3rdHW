module select_reg(reg_idx, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg_dat);
	input [2:0] reg_idx;
	input [15:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7;
	output reg [15:0] reg_dat;
	always @(reg_idx or reg0 or reg1 or reg2 or reg3 or reg4 or reg5 or reg6 or reg7) begin
		case(reg_idx)
			3'b000 : reg_dat = reg0;
			3'b001 : reg_dat = reg1;
			3'b010 : reg_dat = reg2;
			3'b011 : reg_dat = reg3;
			3'b100 : reg_dat = reg4;
			3'b101 : reg_dat = reg5;
			3'b110 : reg_dat = reg6;
			3'b111 : reg_dat = reg7;
		endcase
	end
	
endmodule
			