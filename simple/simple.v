module simple(clk, reset, exec, Aseg, Bseg, Cseg, Dseg, segsel, Eseg, Fseg, Gseg, Hseg);
	input clk, reset, exec;
	output [6:0] Aseg, Bseg, Cseg, Dseg;
	output [6:0] Eseg, Fseg, Gseg, Hseg;
	output reg segsel = 1'b1;
	
	wire alu_en, sft_en, out_en, in_en, rdAR_en, rdBR_en, wr_en, write_ram_en;
	wire phase1, phase2, phase3, phase4, phase5, phase6;
	wire [2:0] AR_idx, BR_idx, wr_idx;
	wire [3:0] op3;
	wire [7:0] immd;
	wire [15:0] wr_dat;
	wire [11:0] address;
	wire [15:0] din;
	wire [15:0] reg_data_out;
	phasecounter Iphasecounter(clk, reset, exec, phase1, phase2, phase3, phase4, phase5, phase6);
	
	PC IPC(phase6, inaddress, addressplus, address);
	
	ram01 ram(address,phase1,dout,write_ram_en,din);
	
	controller Icontroller(phase2, reset, exec, din, AR_idx, BR_idx, wr_idx, op3, immd, alu_en, sft_en, out_en, immd_en, rdAR_en, rdBR_en, wr_en);
	
	datapath Idatapath(phase3, phase5, alu_en, sft_en, immd_en, op3, immd, AR_idx, BR_idx, rdAR_en, rdBR_en, wr_idx, wr_en, din, in_en, out_en, reg_data_out);
	
	seg7out Iseg7out(reg_data_out, Aseg, Bseg, Cseg, Dseg);
	
	seg7out Nseg7out(address, Eseg, Fseg, Gseg, Hseg);

endmodule