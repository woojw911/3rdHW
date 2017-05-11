module fetch(clk, data, data_out );
input clk;
input [15:0] data;
output reg [15:0] data_out;

always@(posedge clk) begin
	data_out = data;
	
end
endmodule