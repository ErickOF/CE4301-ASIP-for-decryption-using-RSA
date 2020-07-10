module registers_test();
	logic [4:0]  ra, rb, rw;
	logic [31:0] rda, rdb, wd;
	logic			 clk, reset, we;

	registers #(32) DUT(clk, reset, we, ra, rb, rw, wd, rda, rdb);

	initial begin
		#10 clk=1; reset=1;
		#10 reset=0;

		// Write and read
		#10 clk=1; we=0; ra=5'b00000; rb=5'b00001; rw=5'b00000; wd=32'hFFFF0001;
		#1 $display("clk=%b, we=%b, ra=%b, rb=%b, rw=%b, wd=%h, rda=%h, rdb=%h\n", clk, we, ra, rb, rw, wd, rda, rdb);
		
		#10 clk=0; we=1;
		#1 $display("clk=%b, we=%b, ra=%b, rb=%b, rw=%b, wd=%h, rda=%h, rdb=%h\n\n", clk, we, ra, rb, rw, wd, rda, rdb);
		
		#10 clk=1; we=0; ra=5'b00000; rb=5'b00001; rw=5'b00001; wd=32'hFFFF0002;
		#1 $display("clk=%b, we=%b, ra=%b, rb=%b, rw=%b, wd=%h, rda=%h, rdb=%h\n", clk, we, ra, rb, rw, wd, rda, rdb);
		
		#10 clk=0; we=1;
		#1 $display("clk=%b, we=%b, ra=%b, rb=%b, rw=%b, wd=%h, rda=%h, rdb=%h\n\n", clk, we, ra, rb, rw, wd, rda, rdb);

		#10 clk=1; we=0; ra=5'b00010; rb=5'b00011; rw=5'b00010; wd=32'hFFFF0003;
		#1 $display("clk=%b, we=%b, ra=%b, rb=%b, rw=%b, wd=%h, rda=%h, rdb=%h\n", clk, we, ra, rb, rw, wd, rda, rdb);
		
		#10 clk=0; we=1;
		#1 $display("clk=%b, we=%b, ra=%b, rb=%b, rw=%b, wd=%h, rda=%h, rdb=%h\n\n", clk, we, ra, rb, rw, wd, rda, rdb);
		
		#10 clk=1; we=0; ra=5'b00010; rb=5'b00011; rw=5'b00011; wd=32'hFFFF0004;
		#1 $display("clk=%b, we=%b, ra=%b, rb=%b, rw=%b, wd=%h, rda=%h, rdb=%h\n", clk, we, ra, rb, rw, wd, rda, rdb);
		
		#10 clk=0; we=1;
		#1 $display("clk=%b, we=%b, ra=%b, rb=%b, rw=%b, wd=%h, rda=%h, rdb=%h\n\n", clk, we, ra, rb, rw, wd, rda, rdb);
		
		// Read only
		#10 clk=1; we=0; ra=5'b00000; rb=5'b00001; rw=5'b00000; wd=32'hFFFF000F;
		#1 $display("clk=%b, we=%b, ra=%b, rb=%b, rw=%b, wd=%h, rda=%h, rdb=%h\n", clk, we, ra, rb, rw, wd, rda, rdb);
		
		#10 clk=0;
		#1 $display("clk=%b, we=%b, ra=%b, rb=%b, rw=%b, wd=%h, rda=%h, rdb=%h\n\n", clk, we, ra, rb, rw, wd, rda, rdb);

		#10 clk=1; we=0; ra=5'b00010; rb=5'b00011; rw=5'b00000; wd=32'hFFFF000F;
		#1 $display("clk=%b, we=%b, ra=%b, rb=%b, rw=%b, wd=%h, rda=%h, rdb=%h\n", clk, we, ra, rb, rw, wd, rda, rdb);
		
		#10 clk=0;
		#1 $display("clk=%b, we=%b, ra=%b, rb=%b, rw=%b, wd=%h, rda=%h, rdb=%h\n\n", clk, we, ra, rb, rw, wd, rda, rdb);
		
		#10 clk=1; we=0; ra=5'b00100; rb=5'b00101; rw=5'b00000; wd=32'hFFFF000F;
		#1 $display("clk=%b, we=%b, ra=%b, rb=%b, rw=%b, wd=%h, rda=%h, rdb=%h\n", clk, we, ra, rb, rw, wd, rda, rdb);
		
		#10 clk=0;
		#1 $display("clk=%b, we=%b, ra=%b, rb=%b, rw=%b, wd=%h, rda=%h, rdb=%h\n\n", clk, we, ra, rb, rw, wd, rda, rdb);
	end

endmodule // registers_test
