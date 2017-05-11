module reg_data_out(clk, busB, out_en, data_out);
	input clk, out_en;
	input [15:0] busB;
	output reg [15:0] data_out;
	always @(clk or busB or out_en) begin
		if(out_en == 1'b1 && clk == 1'b1) begin
			data_out = busB;
		end
	end
endmodule