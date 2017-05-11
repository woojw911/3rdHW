module PC(clk, inaddress, addressplus, outaddress);
	input clk;
	input addressplus;
	input [11:0] inaddress;
	output reg [11:0] outaddress = 11'd0;
	always @(posedge clk) begin
		outaddress = outaddress + 1;
	end
	

endmodule