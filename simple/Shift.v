module Shift( in, sft_ctl, d, out, SZCV);
	input [3:0] sft_ctl, d;
	input [15:0] in;
	output reg [15:0] out;
	output [3:0] SZCV;
	reg carry;
	always @(in or sft_ctl or d) begin
		case (sft_ctl)
			4'b1000: begin
							out = in << d;
							carry = in[16-d];
						end
			4'b1001: begin
							out = in << d | in >> (16-d);
							carry = 0;
						end
			4'b1010: begin
							out = in >> d;
							carry = in[d-1];
						end
			4'b1011: begin
							out = ({16{in[15]}} << (16-d)) | (in >> d);
							carry = in[d-1];
						end
		endcase
	end
	assign SZCV[3] = out[15];
	assign SZCV[2] = ~|out;
	assign SZCV[1] = carry;
	assign SZCV[0] = 1'b0;

endmodule