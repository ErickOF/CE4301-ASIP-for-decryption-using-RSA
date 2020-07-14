module comparator_tb;
	logic [9:0] a, b, c, d, e;
	
	logic eq, neq, lt, lte, gt, gte, gte2, gte3;
	
	initial begin
		 a = 10'b0;
		 b = 10'd6;
         c = 10'd7;
         d = 10'd2;
         e = 10'd8;
	end
	comparator#(10) co0(a, b, c, d, e, eq);

	endmodule
