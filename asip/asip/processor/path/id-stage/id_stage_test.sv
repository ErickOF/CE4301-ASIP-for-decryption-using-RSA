module id_stage_test();
	logic        clk, reset, rb_selector, we;
	logic [1:0]  ext_selector, func;
	logic [2:0]  op;
	logic [4:0]  ra, rb, rf, rw;
	logic [31:0] instruction, wd, rda, rdb, extended;
	
	id_stage #(32) DUT(clk, reset, rb_selector, we, instruction, wd, ext_selector, rw, op, func, ra, rb, rf, rda, rdb, extended);
	
	initial begin
		#10 clk=1; reset=1;
		#10 clk=0; reset=0;

		// ADD R0, R1, R2
		$display("ADD R0, R1, R2");
		#10 clk=1; instruction=32'h00088000; rb_selector=0; we=0; rw=5'b0; wd=32'hA000001; ext_selector=2'b11;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);

		#10 clk=0; instruction=32'h00088000; rb_selector=0; we=1; rw=5'b0; wd=32'hA000001; ext_selector=2'b11;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);


		// ADD R1, R2, 10
		$display("ADD R1, R2, 10");
		#10 clk=1; instruction=32'h01100029; rb_selector=0; we=1; rw=5'b1; wd=32'hA000002; ext_selector=2'b00;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);

		#10 clk=0; instruction=32'h01100029; rb_selector=0; we=1; rw=5'b1; wd=32'hA000002; ext_selector=2'b00;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);


		// SUB R2, R3, R4
		$display("SUB R2, R3, R4");
		#10 clk=1; instruction=32'h02190002; rb_selector=0; we=0; rw=5'b10; wd=32'hA000003; ext_selector=2'b11;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);

		#10 clk=0; instruction=32'h02190002; rb_selector=0; we=1; rw=5'b10; wd=32'hA000003; ext_selector=2'b11;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);


		// SUB R3, R4, 10
		$display("SUB R3, R4, 10");
		#10 clk=1; instruction=32'h0320002B; rb_selector=0; we=1; rw=5'b11; wd=32'hA000004; ext_selector=2'b00;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);

		#10 clk=0; instruction=32'h0320002B; rb_selector=0; we=1; rw=5'b11; wd=32'hA000004; ext_selector=2'b00;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);


      // LDR R5, 32 (R6)
		$display("LDR R5, 32 (R6)");
		#10 clk=1; instruction=32'h45300020; rb_selector=0; we=1; rw=5'b100; wd=32'hA000005; ext_selector=2'b01;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);

		#10 clk=0; instruction=32'h45300020; rb_selector=0; we=1; rw=5'b100; wd=32'hA000005; ext_selector=2'b01;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);


      // STR R6, 32 (R7)
		$display("STR R6, 32 (R7)");
		#10 clk=1; instruction=32'h66380020; rb_selector=1; we=1; rw=5'b101; wd=32'hA000006; ext_selector=2'b01;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);

		#10 clk=0; instruction=32'h66380020; rb_selector=1; we=1; rw=5'b101; wd=32'hA000006; ext_selector=2'b01;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);


      // CMP R0, R1
		$display("CMP R0, R1");
		#10 clk=1; instruction=32'h20004002; rb_selector=0; we=1; rw=5'b110; wd=32'hA000007; ext_selector=2'b00;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);

		#10 clk=0; instruction=32'h20004002; rb_selector=0; we=1; rw=5'b110; wd=32'hA000007; ext_selector=2'b00;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);


      // JEQ 0x0
		$display("JEQ 0x0");
		#10 clk=1; instruction=32'h80000000; rb_selector=0; we=1; rw=5'b111; wd=32'hA000008; ext_selector=2'b10;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);

		#10 clk=0; instruction=32'h80000000; rb_selector=0; we=1; rw=5'b111; wd=32'hA000008; ext_selector=2'b10;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);


      // CMP R3, R4
		$display("CMP R3, R4");
		#10 clk=1; instruction=32'h2010C002; rb_selector=0; we=1; rw=5'b1000; wd=32'hA000009; ext_selector=2'b00;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);

		#10 clk=0; instruction=32'h2010C002; rb_selector=0; we=1; rw=5'b1000; wd=32'hA000009; ext_selector=2'b00;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);


      // JNE 0x8
		$display("JNE 0x8");
		#10 clk=1; instruction=32'hA0000008; rb_selector=0; we=1; rw=5'b1001; wd=32'hA00000A; ext_selector=2'b10;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);

		#10 clk=0; instruction=32'hA0000008; rb_selector=0; we=1; rw=5'b1001; wd=32'hA00000A; ext_selector=2'b10;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);


      // JMP 0x10
		$display("JMP 0x10");
		#10 clk=1; instruction=32'hC0000010; rb_selector=0; we=1; rw=5'b1010; wd=32'hA00000B; ext_selector=2'b10;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);

		#10 clk=0; instruction=32'hC0000010; rb_selector=0; we=1; rw=5'b1010; wd=32'hA00000B; ext_selector=2'b10;
		#1 $display("clk=%b, inst=%h, rb_sel=%b, we=%b, rw=%b, wd=%h, ext_sel=%b, op=%b, func=%b, ra=%b, rb=%b, rf=%b, rda=%h, rdb=%h, extended=%b\n",
		            clk, instruction, rb_selector, we, rw, wd, ext_selector, op, func, ra, rb, rf, rda, rdb, extended);
	end

endmodule // id_stage_test
