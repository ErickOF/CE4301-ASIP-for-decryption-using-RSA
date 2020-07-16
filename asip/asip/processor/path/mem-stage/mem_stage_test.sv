module mem_stage_test();
	logic [31:0] address, write_data, read_data;
	logic			 clk, write_enable;

	mem_stage #(32) DUT(clk, write_enable, address, write_data, read_data);

	initial begin
		// Read memory 0
		$display("Read memory 0");
		#10 clk=1; write_enable=0; address=32'h0; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h0; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		
		#10 clk=1; write_enable=0; address=32'h4; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h4; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=1; write_enable=0; address=32'h8; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h8; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		

		// Read memory 1
		$display("Read memory 1");
		#10 clk=1; write_enable=0; address=32'h10000; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h10000; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		
		#10 clk=1; write_enable=0; address=32'h10004; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h10004; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=1; write_enable=0; address=32'h10008; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h10008; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);


		// Read memory 2
		$display("Read memory 2");
		#10 clk=1; write_enable=0; address=32'h20000; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h20000; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		
		#10 clk=1; write_enable=0; address=32'h20004; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h20004; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=1; write_enable=0; address=32'h20008; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h20008; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);


		// Read memory 3
		$display("Read memory 3");
		#10 clk=1; write_enable=0; address=32'h30000; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h30000; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		
		#10 clk=1; write_enable=0; address=32'h30004; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h30004; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=1; write_enable=0; address=32'h30008; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h30008; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		
		
		// Write into memory 0
		$display("Write into memory 0");
		#10 clk=1; write_enable=1; address=32'h0; write_data=32'h10;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=1; address=32'h0; write_data=32'h10;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		
		#10 clk=1; write_enable=1; address=32'h4; write_data=32'h11;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=1; address=32'h4; write_data=32'h11;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=1; write_enable=1; address=32'h8; write_data=32'h12;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=1; address=32'h8; write_data=32'h12;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);


		// Write into memory 1
		$display("Write into memory 1");
		#10 clk=1; write_enable=1; address=32'h10000; write_data=32'h10024;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=1; address=32'h10000; write_data=32'h10024;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		
		#10 clk=1; write_enable=1; address=32'h10004; write_data=32'h10007;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=1; address=32'h10004; write_data=32'h10007;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=1; write_enable=1; address=32'h10008; write_data=32'h10009;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=1; address=32'h10008; write_data=32'h10009;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);


		// Write into memory 2
		$display("Write into memory 2");
		#10 clk=1; write_enable=1; address=32'h20000; write_data=32'h20024;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=1; address=32'h20000; write_data=32'h20024;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		
		#10 clk=1; write_enable=1; address=32'h20004; write_data=32'h20007;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=1; address=32'h20004; write_data=32'h20007;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=1; write_enable=1; address=32'h20008; write_data=32'h20009;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=1; address=32'h20008; write_data=32'h20009;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);


		// Write into memory 3
		$display("Write into memory 3");
		#10 clk=1; write_enable=1; address=32'h30000; write_data=32'h30012;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=1; address=32'h30000; write_data=32'h30012;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		
		#10 clk=1; write_enable=1; address=32'h30004; write_data=32'h30018;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=1; address=32'h30004; write_data=32'h30018;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=1; write_enable=1; address=32'h30008; write_data=32'h30032;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=1; address=32'h30008; write_data=32'h30032;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);


		
		// Read memory 0
		$display("Read memory 0");
		#10 clk=1; write_enable=0; address=32'h0; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h0; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		
		#10 clk=1; write_enable=0; address=32'h4; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h4; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=1; write_enable=0; address=32'h8; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h8; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		
		
		// Read memory 1
		$display("Read memory 1");
		#10 clk=1; write_enable=0; address=32'h10000; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h10000; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		
		#10 clk=1; write_enable=0; address=32'h10004; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h10004; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=1; write_enable=0; address=32'h10008; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h10008; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);


		// Read memory 2
		$display("Read memory 2");
		#10 clk=1; write_enable=0; address=32'h20000; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h20000; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		
		#10 clk=1; write_enable=0; address=32'h20004; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h20004; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=1; write_enable=0; address=32'h20008; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h20008; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);


		// Read memory 3
		$display("Read memory 3");
		#10 clk=1; write_enable=0; address=32'h30000; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h30000; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		
		#10 clk=1; write_enable=0; address=32'h30004; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h30004; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=1; write_enable=0; address=32'h30008; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h30008; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%h, read_data=%h\n", clk, write_enable, address, write_data, read_data);
	end

endmodule // mem_stage_test