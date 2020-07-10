module id_stage_test();
	logic        clk, reset, rb_selector, we;
	logic [1:0]  ext_selector, func;
	logic [2:0]  op;
	logic [31:0] instruction, wd, rda, rdb, extended;
	
	id_stage #(32) DUT(clk, reset, rb_selector, we, instruction, wd, ext_selector, op, func, rda, rdb, extended);
	
	initial begin
		#10 clk=1; reset=1;
		#10 clk=0; reset=0;
		
		// ADD R0, R1, R2
		#10 clk=1; instruction=32'h00088000; rb_selector=0; we=0; wd=32'b0; ext_selector=2'b11;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, wd=%h, ext_sel=%b, op=%b, func=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, wd, ext_selector, op, func, rda, rdb, extended);
		
		#10 clk=0; instruction=32'h00088000; rb_selector=0; we=1; wd=32'h0000001; ext_selector=2'b11;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, wd=%h, ext_sel=%b, op=%b, func=%b, rda=%h, rdb=%h, extended=%b\n\n",
		            clk, instruction, rb_selector, we, wd, ext_selector, op, func, rda, rdb, extended);


		// ADD R1, R2, 10
		#10 clk=1; instruction=32'h01100029; rb_selector=0; we=0; wd=32'b0; ext_selector=2'b00;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, wd=%h, ext_sel=%b, op=%b, func=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, wd, ext_selector, op, func, rda, rdb, extended);
		
		#10 clk=0; instruction=32'h01100029; rb_selector=0; we=1; wd=32'h0000002; ext_selector=2'b00;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, wd=%h, ext_sel=%b, op=%b, func=%b, rda=%h, rdb=%h, extended=%b\n\n",
		            clk, instruction, rb_selector, we, wd, ext_selector, op, func, rda, rdb, extended);


		// SUB R2, R3, R4
		#10 clk=1; instruction=32'h02190002; rb_selector=0; we=0; wd=32'b0; ext_selector=2'b00;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, wd=%h, ext_sel=%b, op=%b, func=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, wd, ext_selector, op, func, rda, rdb, extended);
		
		#10 clk=0; instruction=32'h02190002; rb_selector=0; we=1; wd=32'h0000003; ext_selector=2'b00;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, wd=%h, ext_sel=%b, op=%b, func=%b, rda=%h, rdb=%h, extended=%b\n\n",
		            clk, instruction, rb_selector, we, wd, ext_selector, op, func, rda, rdb, extended);


		// SUB R3, R4, 10
		#10 clk=1; instruction=32'h0320002B; rb_selector=0; we=0; wd=32'b0; ext_selector=2'b00;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, wd=%h, ext_sel=%b, op=%b, func=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, wd, ext_selector, op, func, rda, rdb, extended);
		
		#10 clk=0; instruction=32'h0320002B; rb_selector=0; we=1; wd=32'h0000004; ext_selector=2'b00;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, wd=%h, ext_sel=%b, op=%b, func=%b, rda=%h, rdb=%h, extended=%b\n\n",
		            clk, instruction, rb_selector, we, wd, ext_selector, op, func, rda, rdb, extended);


      // LDR R5, 32 (R6)
		#10 clk=1; instruction=32'h45300020; rb_selector=1; we=0; wd=32'b0; ext_selector=2'b01;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, wd=%h, ext_sel=%b, op=%b, func=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, wd, ext_selector, op, func, rda, rdb, extended);
		
		#10 clk=0; instruction=32'h45300020; rb_selector=1; we=1; wd=32'h0000004; ext_selector=2'b01;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, wd=%h, ext_sel=%b, op=%b, func=%b, rda=%h, rdb=%h, extended=%b\n\n",
		            clk, instruction, rb_selector, we, wd, ext_selector, op, func, rda, rdb, extended);


      // STR R6, 32 (R7)
		#10 clk=1; instruction=32'h66380020; rb_selector=0; we=0; wd=32'b0; ext_selector=2'b01;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, wd=%h, ext_sel=%b, op=%b, func=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, wd, ext_selector, op, func, rda, rdb, extended);
		
		#10 clk=0; instruction=32'h66380020; rb_selector=0; we=1; wd=32'h0000005; ext_selector=2'b01;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, wd=%h, ext_sel=%b, op=%b, func=%b, rda=%h, rdb=%h, extended=%b\n\n",
		            clk, instruction, rb_selector, we, wd, ext_selector, op, func, rda, rdb, extended);


      // CMP R0, R1
		#10 clk=1; instruction=32'h20080000; rb_selector=0; we=0; wd=32'b0; ext_selector=2'b01;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, wd=%h, ext_sel=%b, op=%b, func=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, wd, ext_selector, op, func, rda, rdb, extended);
		
		#10 clk=0; instruction=32'h20080000; rb_selector=0; we=1; wd=32'h0000005; ext_selector=2'b01;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, wd=%h, ext_sel=%b, op=%b, func=%b, rda=%h, rdb=%h, extended=%b\n\n",
		            clk, instruction, rb_selector, we, wd, ext_selector, op, func, rda, rdb, extended);


      // JEQ 0x0


      // CMP R3, R3


      // JNE 0x8


      // JMP 0x10

	end

endmodule // id_stage_test
