module PC(clk, reset, outaddress);
	input clk, reset;
	output reg [11:0] outaddress = 11'd0;
	always @(posedge clk or posedge reset) begin
		if(reset == 1) begin
			outaddress = 11'd0;
		end else begin
			outaddress = outaddress + 1;
		end
	end
endmodule