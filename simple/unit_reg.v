module unit_reg(clk, wr_en, wr_dat, rd_dat);
input clk, wr_en;
input [15:0] wr_dat;
output reg [15:0] rd_dat;

always @(posedge clk) begin
	if(wr_en) begin
		rd_dat = wr_dat;
	end
end
endmodule