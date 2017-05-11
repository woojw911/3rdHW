module seg7out(data, fourthseg, thirdseg, secondseg, firstseg);
	input [15:0] data;
	output [6:0] fourthseg, thirdseg, secondseg, firstseg;
	seg7withhex fourth(data[15:12], fourthseg);
	seg7withhex third(data[11:8], thirdseg);
	seg7withhex second(data[7:4], secondseg);
	seg7withhex first(data[3:0], firstseg);

endmodule