module hazard_unit_test();       
	logic [5:0] ra_ex, rb_ex, rf_me, rf_wb;
	logic [1:0] forward_RA, forward_RB;

	hazard_unit DUT(ra_ex, rb_ex, rf_me, rf_wb, forward_RA, forward_RB);

	initial begin

	  #10 ra_ex=5'b10000; rb_ex=5'b01000; rf_me=5'b00001; rf_wb=5'b00010;
	  #1 $display("ra_ex=%b, rb_ex=%b, rf_me=%b, rf_wb=%b, forward_RA=%b, forward_RB=%b\n", ra_ex, rb_ex, rf_me, rf_wb, forward_RA, forward_RB);
	  
	  #10 ra_ex=5'b00100; rb_ex=5'b00001; rf_me=5'b00100; rf_wb=5'b00010;
	  #1 $display("ra_ex=%b, rb_ex=%b, rf_me=%b, rf_wb=%b, forward_RA=%b, forward_RB=%b\n", ra_ex, rb_ex, rf_me, rf_wb, forward_RA, forward_RB);
	 
	  #10 ra_ex=5'b10000; rb_ex=5'b00001; rf_me=5'b00010; rf_wb=5'b10000;
	  #1 $display("ra_ex=%b, rb_ex=%b, rf_me=%b, rf_wb=%b, forward_RA=%b, forward_RB=%b\n", ra_ex, rb_ex, rf_me, rf_wb, forward_RA, forward_RB);
	  
	  #10 ra_ex=5'b10000; rb_ex=5'b00001; rf_me=5'b10000; rf_wb=5'b10000;
	  #1 $display("ra_ex=%b, rb_ex=%b, rf_me=%b, rf_wb=%b, forward_RA=%b, forward_RB=%b\n", ra_ex, rb_ex, rf_me, rf_wb, forward_RA, forward_RB);

	  #10 ra_ex=5'b00001; rb_ex=5'b00010; rf_me=5'b00010; rf_wb=5'b00000;
	  #1 $display("ra_ex=%b, rb_ex=%b, rf_me=%b, rf_wb=%b, forward_RA=%b, forward_RB=%b\n", ra_ex, rb_ex, rf_me, rf_wb, forward_RA, forward_RB);

	  #10 ra_ex=5'b10000; rb_ex=5'b00010; rf_me=5'b00001; rf_wb=5'b00010;
	  #1 $display("ra_ex=%b, rf_ex=%b, rf_me=%b, rf_wb=%b, forward_RA=%b, forward_RB=%b\n", ra_ex, rb_ex, rf_me, rf_wb, forward_RA, forward_RB);
 
	  #10 ra_ex=5'b10000; rb_ex=5'b00010; rf_me=5'b00010; rf_wb=5'b00010;
	  #1 $display("ra_ex=%b, rf_ex=%b, rf_me=%b, rf_wb=%b, forward_RA=%b, forward_RB=%b\n", ra_ex, rb_ex, rf_me, rf_wb, forward_RA, forward_RB);
   end
endmodule // hazard_unit_test