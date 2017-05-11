module reg_file(clk, AR_idx, BR_idx, rdAR_en, rdBR_en, wr_idx, wr_en, wr_dat, rdAR_dat, rdBR_dat);
	input clk;
	input [2:0] AR_idx, BR_idx, wr_idx;
	input rdAR_en, rdBR_en, wr_en;
	input [15:0] wr_dat;
	output [15:0] rdAR_dat, rdBR_dat;
	
	wire [15:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7;
	wire [15:0] rdAR_dat_temp, rdBR_dat_temp;
	
	unit_reg Ireg0( .clk(clk), .wr_en(wr_en && wr_idx == 3'b000), .wr_dat(wr_dat), .rd_dat(reg0));
	unit_reg Ireg1( .clk(clk), .wr_en(wr_en && wr_idx == 3'b001), .wr_dat(wr_dat), .rd_dat(reg1));
	unit_reg Ireg2( .clk(clk), .wr_en(wr_en && wr_idx == 3'b010), .wr_dat(wr_dat), .rd_dat(reg2));
	unit_reg Ireg3( .clk(clk), .wr_en(wr_en && wr_idx == 3'b011), .wr_dat(wr_dat), .rd_dat(reg3));
	unit_reg Ireg4( .clk(clk), .wr_en(wr_en && wr_idx == 3'b100), .wr_dat(wr_dat), .rd_dat(reg4));
	unit_reg Ireg5( .clk(clk), .wr_en(wr_en && wr_idx == 3'b101), .wr_dat(wr_dat), .rd_dat(reg5));
	unit_reg Ireg6( .clk(clk), .wr_en(wr_en && wr_idx == 3'b110), .wr_dat(wr_dat), .rd_dat(reg6));
	unit_reg Ireg7( .clk(clk), .wr_en(wr_en && wr_idx == 3'b111), .wr_dat(wr_dat), .rd_dat(reg7));
	
	select_reg selAreg(AR_idx, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, rdAR_dat_temp);
	select_reg selBreg(BR_idx, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, rdBR_dat_temp);
	
	assign rdAR_dat = rdAR_en ? rdAR_dat_temp : 16'hz;
	assign rdBR_dat = rdBR_en ? rdBR_dat_temp : 16'hz;
	
endmodule