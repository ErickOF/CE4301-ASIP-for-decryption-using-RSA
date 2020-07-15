module mem_stage_test();
	logic [31:0] address, write_data, read_data;
	logic			 clk, write_enable;

	mem_stage #(32) DUT(clk, write_enable, address, write_data, read_data);

	initial begin

		#10 clk=0; write_enable=0; address=32'h0; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%b, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=1; write_enable=0; address=32'h0; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%b, read_data=%h\n", clk, write_enable, address, write_data, read_data);
		
		#10 clk=0; write_enable=0; address=32'h4; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%b, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=1; write_enable=0; address=32'h4; write_data=32'h5;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%b, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=0; write_enable=0; address=32'h8; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%b, read_data=%h\n", clk, write_enable, address, write_data, read_data);

		#10 clk=1; write_enable=0; address=32'h8; write_data=32'h9;
		#1 $display("clk=%b, write_enable=%b, address=%h, write_data=%b, read_data=%h\n", clk, write_enable, address, write_data, read_data);

	end

endmodule // mem_stage_test