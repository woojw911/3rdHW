module phasecounter (clock, reset, exec, a,b,c,d,e,f);
input clock, reset, exec;
output reg a=0,b=0,c=0,d=0,e=0,f=1;


always@(posedge clock or posedge reset) begin
	if(reset ==1)
	begin
	a<=0;
	b<=0;
	c<=0;
	d<=0;
	e<=0;
	f<=1;
	end
	else if(exec == 1 || f == 0) begin
		a <= f & ~a;
		b <= a & ~b;
		c <= b & ~c;
		d <= c & ~d;
		e <= d & ~e;
		f <= e & ~f;
	end
end


endmodule


