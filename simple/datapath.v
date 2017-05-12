module datapath(clk, wrclk, reset, alu_en, sft_en, immd_en, op3, immd, AR_idx, BR_idx, rdAR_en, rdBR_en, wr_idx, wr_en, data_in, in_en, out_en, data_out);
	input clk, wrclk, reset, alu_en, sft_en, in_en, out_en, immd_en;
	input [2:0] AR_idx, BR_idx, wr_idx;
	input [3:0] op3;
	input [7:0] immd;
	input rdAR_en, rdBR_en, wr_en;
	input [15:0] data_in;
	output [15:0] data_out;
	reg [3:0] SZCV;
	wire [15:0] bus_A, bus_B, bus_T, alu_out, sft_out;
	
	reg_file Ireg_file(wrclk, AR_idx, BR_idx, rdAR_en, rdBR_en, wr_idx, wr_en, bus_T, bus_A, bus_B);
	
	ALU IALU(bus_A, bus_B, op3, alu_out, SZCV);
	
	assign bus_T = alu_en ? alu_out : 16'hz;
	
	Shift IShift( bus_B, op3, immd[3:0], sft_out, SZCV);
	
	assign bus_T = sft_en ? sft_out : 16'hz;
	
	reg_data_out Iregdataout(clk, reset, bus_B, out_en, data_out);

	assign bus_T = immd_en ? immd : 16'hz;
	
	assign bus_T = in_en ? data_in : 16'bz;
endmodule