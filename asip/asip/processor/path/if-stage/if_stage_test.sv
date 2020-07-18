module if_stage_test();
	logic [31:0] pc, jmp_pc;
	logic			 clk, reset, pc_selector;

	if_stage #(32) DUT(clk, reset, jmp_pc, pc_selector, pc);

	initial begin
		#10 reset=1;
		#10 reset=0;

		#10 clk=0; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=1; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=0; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=1; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=0; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=1; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=0; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=1; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=0; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=1; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n\n", clk, reset, jmp_pc, pc_selector, pc);
		
		// JUMP
		#10 clk=0; reset=0; jmp_pc=32'h1000; pc_selector=1;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=1; reset=0; jmp_pc=32'h1000; pc_selector=1;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=0; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=1; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=0; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=1; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=0; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=1; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n\n", clk, reset, jmp_pc, pc_selector, pc);
		
		// JUMP
		#10 clk=0; reset=0; jmp_pc=32'h1000; pc_selector=1;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=1; reset=0; jmp_pc=32'h1000; pc_selector=1;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=0; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=1; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=0; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=1; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=0; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n", clk, reset, jmp_pc, pc_selector, pc);
		
		#10 clk=1; reset=0; jmp_pc=32'h1000; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h\n\n", clk, reset, jmp_pc, pc_selector, pc);
	end

endmodule // if_stage_test
