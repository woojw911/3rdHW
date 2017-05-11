module seg7withhex(
	input [3:0] num,
	output [6:0] seg1
	);
	
	assign seg1[0] = num[2]^num[1] | num[3] | num[1]&~num[0];
	assign seg1[1] = num[3]^num[2] | num[2]&num[1] | ~num[3]&~num[1]&~num[0];
	assign seg1[2] = num[1]&~num[0] | num[3]&num[2] | num[3]&num[1] | ~num[2]&~num[1]&~num[0];
	assign seg1[3] = num[3]&~num[1] | ~num[2]&num[1]&num[0] | num[2]&(num[1]^num[0]) | ~num[3]&~num[2]&~num[0];
	assign seg1[4] = ~num[3]&~num[1] | ~num[3]&num[0] | ~num[1]&num[0] | num[3]^num[2];
	assign seg1[5] = ~num[3]&~num[2] | ~num[3]&~num[1]&~num[0] | (num[3]^num[1])&num[0] | num[3]&~num[2]&~num[0];
	assign seg1[6] = num[1]&~num[0] | ~num[3]&num[1] | num[2]&num[1] | ~num[3]&num[2]&num[0] | num[3]&~num[2]&~num[1] | ~num[2]&~num[1]&~num[0];
endmodule