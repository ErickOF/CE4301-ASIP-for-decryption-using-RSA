module comparator_tb;
	logic [9:0] a, b, c, d, e;
	
	logic a_lt_e, a_gte_b, a_gte2_c, a_gte3_c;
	
	initial begin
		 a = 10'd5;
		 b = 10'd3;
       c = 10'd5;
       d = 10'd7;
       e = 10'd8;
	end
	comparator#(10) co0(a, b, c, d, e, a_lt_e, a_gte_b, a_gte2_c, a_gte3_c);

	endmodule