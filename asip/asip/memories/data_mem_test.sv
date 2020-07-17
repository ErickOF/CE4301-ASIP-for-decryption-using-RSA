module data_mem_test();
	logic        clk, write_enable;
	logic [31:0] address, pixel_address, write_data;
	logic [7:0]  pixel;
	logic [31:0] read_data;
	
	data_mem #(32) DUT(clk, write_enable, address, pixel_address, write_data,
						    pixel, read_data);

	initial begin
		#100 clk=0;
		
		// Read data
		#10000 clk=1; write_enable=0; address=32'h0; pixel_address=32'h0; write_data=32'b0;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		#10000 clk=0; write_enable=0; address=32'h0; pixel_address=32'h0; write_data=32'b0;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h\n",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		
		#10000 clk=1; write_enable=0; address=32'h10000; pixel_address=32'h0; write_data=32'b0;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		#10000 clk=0; write_enable=0; address=32'h10000; pixel_address=32'h0; write_data=32'b0;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h\n",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		
		#10000 clk=1; write_enable=0; address=32'h10000; pixel_address=32'h10000; write_data=32'b0;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		#10000 clk=0; write_enable=0; address=32'h10000; pixel_address=32'h10000; write_data=32'b0;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h\n",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		
		#10000 clk=1; write_enable=0; address=32'h20000; pixel_address=32'h10000; write_data=32'b0;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		#10000 clk=0; write_enable=0; address=32'h20000; pixel_address=32'h10000; write_data=32'b0;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h\n",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		
		#10000 clk=1; write_enable=0; address=32'h20000; pixel_address=32'h20000; write_data=32'b0;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		#10000 clk=0; write_enable=0; address=32'h20000; pixel_address=32'h20000; write_data=32'b0;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h\n",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		
		#10000 clk=1; write_enable=0; address=32'h40000; pixel_address=32'h20000; write_data=32'b0;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		#10000 clk=0; write_enable=0; address=32'h40000; pixel_address=32'h20000; write_data=32'b0;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h\n",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		
		#10000 clk=1; write_enable=0; address=32'h40000; pixel_address=32'h40000; write_data=32'b0;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		#10000 clk=0; write_enable=0; address=32'h40000; pixel_address=32'h40000; write_data=32'b0;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h\n",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		
		// Write and read
		#10000 clk=1; write_enable=1; address=32'h40000; pixel_address=32'h00000; write_data=32'b10;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		#10000 clk=0; write_enable=1; address=32'h40000; pixel_address=32'h00000; write_data=32'b10;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h\n",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		
		#10000 clk=1; write_enable=1; address=32'h50000; pixel_address=32'h40000; write_data=32'b110;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		#10000 clk=0; write_enable=1; address=32'h50000; pixel_address=32'h40000; write_data=32'b110;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h\n",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		
		#10000 clk=1; write_enable=1; address=32'h60000; pixel_address=32'h50000; write_data=32'b1110;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		#10000 clk=0; write_enable=1; address=32'h60000; pixel_address=32'h50000; write_data=32'b1110;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h\n",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		
		#10000 clk=1; write_enable=1; address=32'h70000; pixel_address=32'h60000; write_data=32'b1110;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		#10000 clk=0; write_enable=1; address=32'h70000; pixel_address=32'h60000; write_data=32'b1110;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h\n",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		
		
		#10000 clk=1; write_enable=0; address=32'h70000; pixel_address=32'h70000; write_data=32'b11110;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
		#10000 clk=0; write_enable=0; address=32'h70000; pixel_address=32'h70000; write_data=32'b11110;
		$display("clk=%b, write_enable=%b, address=%h, pixel_address=%h, write_data=%h, pixel=%h, read_data=%h\n",
					clk, write_enable, address, pixel_address, write_data, pixel, read_data);
	end
endmodule // data_mem_test
