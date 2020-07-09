module instr_fetch_test();
	logic [31:0] pc, jmp_pc, instr;
	logic			 clk, reset, pc_selector;

	if_stage #(32) DUT(clk, reset, jmp_pc, pc_selector, pc);
	instruction_mem imen(pc, instr);

	initial begin
		#10 reset=1;
		#10 reset=0;

		#10 clk=0; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=1; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=0; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=1; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=0; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=1; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=0; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=1; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=0; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=1; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		// JUMP
		#10 clk=0; reset=0; jmp_pc=32'h5C; pc_selector=1;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=1; reset=0; jmp_pc=32'h5C; pc_selector=1;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=0; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=1; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=0; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=1; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=0; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=1; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		// JUMP
		#10 clk=0; reset=0; jmp_pc=32'h5C; pc_selector=1;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=1; reset=0; jmp_pc=32'h5C; pc_selector=1;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=0; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=1; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=0; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=1; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=0; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n", clk, reset, jmp_pc, pc_selector, pc, instr);
		
		#10 clk=1; reset=0; jmp_pc=32'h5C; pc_selector=0;
		#1 $display("clk=%b, reset=%b, jmp_pc=%h, pc_selector=%b, pc=%h, instr=%h\n\n", clk, reset, jmp_pc, pc_selector, pc, instr);
	end

endmodule // instr_fetch_test
