module zero_extension_test();
	logic [28:0] value;
	logic [31:0] extended;
	logic [1:0]  extend_selector;

	zero_extension #(32) DUT(value, extend_selector, extended);

	initial begin
		// Operand Type
		#10 value=28'b1111111110000000011; extend_selector=2'b00;
		#1 $display("value=%b, extend_selector=%b, extended=%b\n", value, extend_selector, extended);
		
		#10 value=28'b1111111111100001111; extend_selector=2'b00;
		#1 $display("value=%b, extend_selector=%b, extended=%b\n", value, extend_selector, extended);
		
		#10 value=28'b1010101010101010101; extend_selector=2'b00;
		#1 $display("value=%b, extend_selector=%b, extended=%b\n\n", value, extend_selector, extended);

		// L/S
		#10 value=28'b1111111110000000011; extend_selector=2'b01;
		#1 $display("value=%b, extend_selector=%b, extended=%b\n", value, extend_selector, extended);
		
		#10 value=28'b1111111111100001111; extend_selector=2'b01;
		#1 $display("value=%b, extend_selector=%b, extended=%b\n", value, extend_selector, extended);
		
		#10 value=28'b1010101010101010101; extend_selector=2'b01;
		#1 $display("value=%b, extend_selector=%b, extended=%b\n\n", value, extend_selector, extended);

		// Jump
		#10 value=28'b1111111110000000011; extend_selector=2'b10;
		#1 $display("value=%b, extend_selector=%b, extended=%b\n", value, extend_selector, extended);
		
		#10 value=28'b1111111111100001111; extend_selector=2'b10;
		#1 $display("value=%b, extend_selector=%b, extended=%b\n", value, extend_selector, extended);
		
		#10 value=28'b1010101010101010101; extend_selector=2'b10;
		#1 $display("value=%b, extend_selector=%b, extended=%b\n\n", value, extend_selector, extended);

		// NO
		#10 value=28'b1111111110000000011; extend_selector=2'b11;
		#1 $display("value=%b, extend_selector=%b, extended=%b\n", value, extend_selector, extended);

		#10 value=28'b1111111111100001111; extend_selector=2'b11;
		#1 $display("value=%b, extend_selector=%b, extended=%b\n", value, extend_selector, extended);

		#10 value=28'b1010101010101010101; extend_selector=2'b11;
		#1 $display("value=%b, extend_selector=%b, extended=%b\n", value, extend_selector, extended);
	end

endmodule // zero_extension_test
