module reg_data_out(clk, reset, busB, out_en, data_out);
	input clk, reset, out_en;
	input [15:0] busB;
	output reg [15:0] data_out = 16'd0;
	always @(clk or busB or out_en or reset) begin
		if(reset == 1) begin
			data_out = 16'd0;
		end else begin
			if(out_en == 1'b1 && clk == 1'b1) begin
				data_out = busB;
			end
		end
	end
endmodule