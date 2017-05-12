module decode(IR, AR_idx, BR_idx, wr_idx, op3, d, alu_en, sft_en, out_en, immd_en, rdAR_en, rdBR_en, wr_en);

	input [15:0] IR;
	output reg alu_en, sft_en, out_en, immd_en, rdAR_en, rdBR_en, wr_en;
	output reg [2:0] AR_idx, BR_idx, wr_idx;
	output reg [3:0] op3;
	output reg [7:0] d;
	
	always@(IR) begin
		case(IR[15:14])
			2'b00:begin //LD
						AR_idx = IR[13:11];
						BR_idx = IR[10:8];
						d = IR[7:0];
					end
			2'b01:begin //ST
						AR_idx = IR[13:11];
						BR_idx = IR[10:8];
						d = IR[7:0];
					end
			2'b10:begin //LI,B...
						AR_idx = IR[13:11]; //op2
						BR_idx = IR[10:8];
						d = IR[7:0];
						casex (IR[13:11])
							3'b000: begin
											{alu_en, sft_en, out_en, immd_en, rdAR_en, rdBR_en, wr_en} = {1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1};
											wr_idx = IR[10:8]; // r[rb] = sign_ext(d)
									end
						endcase
					end
			2'b11:begin //ADD,SUB,SLL...
						AR_idx = IR[13:11];
						BR_idx = IR[10:8];
						op3 = IR[7:4];
						d = IR[3:0];
						casex(IR[7:4])
							4'b0???: begin
											{alu_en, sft_en, out_en, immd_en, rdAR_en, rdBR_en, wr_en} = {1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1}; // CMP doesn't matter. Beacuse of alu.
											wr_idx = IR[10:8];
										end
							4'b10??: begin
											{alu_en, sft_en, out_en, immd_en, rdAR_en, rdBR_en, wr_en} = {1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1};
											wr_idx = IR[10:8];
										end
							4'b1101: begin
											{alu_en, sft_en, out_en, immd_en, rdAR_en, rdBR_en, wr_en} = {1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0};
										end
										
							default: begin
											{alu_en, sft_en, out_en, immd_en, rdAR_en, rdBR_en, wr_en} = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
										end
						endcase
					end
		endcase

	end


endmodule
