module ex_stage_test();
	logic        alu_func, opb_selector, Z, C;
	logic [31:0] rda, rdb, extended, alu_result;

	ex_stage #(32) DUT(rda, rdb, extended, alu_func, opb_selector, alu_result, Z, C);

	initial begin
		// ADD1
		#10 rda=32'hAA00AA00; rdb=32'h00AA00AA; extended=32'h00004444; alu_func=0; opb_selector=0;
		#1 $display("rda=%h, rdb=%h, extended=%h, alu_func=%b, opb_selector=%b, result=%h, Z=%b\n", rda, rdb, extended, alu_func, opb_selector, alu_result, Z);

		// ADD2
		#10 rda=32'hAA00AA01; rdb=32'h00AA00AA; extended=32'h00004444; alu_func=0; opb_selector=0;
		#1 $display("rda=%h, rdb=%h, extended=%h, alu_func=%b, opb_selector=%b, result=%h, Z=%b\n", rda, rdb, extended, alu_func, opb_selector, alu_result, Z);

		// ADD3
		#10 rda=32'hAA00AA00; rdb=32'h00AA00AA; extended=32'h00004444; alu_func=0; opb_selector=1;
		#1 $display("rda=%h, rdb=%h, extended=%h, alu_func=%b, opb_selector=%b, result=%h, Z=%b\n", rda, rdb, extended, alu_func, opb_selector, alu_result, Z);

		// ADD4
		#10 rda=32'hAA00AA01; rdb=32'h00AA00AA; extended=32'h00004444; alu_func=0; opb_selector=1;
		#1 $display("rda=%h, rdb=%h, extended=%h, alu_func=%b, opb_selector=%b, result=%h, Z=%b\n", rda, rdb, extended, alu_func, opb_selector, alu_result, Z);

		// SUB1
		#10 rda=32'hAA00AA00; rdb=32'h00AA00AA; extended=32'h00004444; alu_func=1; opb_selector=0;
		#1 $display("rda=%h, rdb=%h, extended=%h, alu_func=%b, opb_selector=%b, result=%h, Z=%b\n", rda, rdb, extended, alu_func, opb_selector, alu_result, Z);

		// SUB2
		#10 rda=32'hAA00AA00; rdb=32'hAA00AA00; extended=32'h00004444; alu_func=1; opb_selector=0;
		#1 $display("rda=%h, rdb=%h, extended=%h, alu_func=%b, opb_selector=%b, result=%h, Z=%b\n", rda, rdb, extended, alu_func, opb_selector, alu_result, Z);

		// SUB3
		#10 rda=32'hAA00AA00; rdb=32'h00AA00AA; extended=32'h00004444; alu_func=1; opb_selector=1;
		#1 $display("rda=%h, rdb=%h, extended=%h, alu_func=%b, opb_selector=%b, result=%h, Z=%b\n", rda, rdb, extended, alu_func, opb_selector, alu_result, Z);

		// SUB4
		#10 rda=32'h00004444; rdb=32'hAA00AA00; extended=32'h00004444; alu_func=1; opb_selector=1;
		#1 $display("rda=%h, rdb=%h, extended=%h, alu_func=%b, opb_selector=%b, result=%h, Z=%b\n", rda, rdb, extended, alu_func, opb_selector, alu_result, Z);

		// CMP1
		#10 rda=32'h00004444; rdb=32'hAA00AA00; extended=32'h00004444; alu_func=1; opb_selector=0;
		#1 $display("rda=%h, rdb=%h, extended=%h, alu_func=%b, opb_selector=%b, result=%h, Z=%b\n", rda, rdb, extended, alu_func, opb_selector, alu_result, Z);

		// CMP2
		#10 rda=32'h00004444; rdb=32'hAA00AA00; extended=32'h00004444; alu_func=1; opb_selector=1;
		#1 $display("rda=%h, rdb=%h, extended=%h, alu_func=%b, opb_selector=%b, result=%h, Z=%b\n", rda, rdb, extended, alu_func, opb_selector, alu_result, Z);

	end

endmodule // ex_stage_test
