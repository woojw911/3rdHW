module controller (
clk, reset, exec, din, AR_idx, BR_idx, wr_idx, op3, immd, alu_en, sft_en, out_en, immd_en, rdAR_en, rdBR_en, wr_en

);
input clk, reset, exec;
input [15:0] din;

output alu_en, sft_en, out_en, immd_en, rdAR_en, rdBR_en, wr_en;
output [2:0] AR_idx, BR_idx, wr_idx;
output [3:0] op3;
output [7:0] immd;

reg [15:0] IR;

fetch Ifetch(clk, din, IR);

decode Idecode(IR, AR_idx, BR_idx, wr_idx, op3, immd, alu_en, sft_en, out_en, immd_en, rdAR_en, rdBR_en, wr_en);

endmodule
