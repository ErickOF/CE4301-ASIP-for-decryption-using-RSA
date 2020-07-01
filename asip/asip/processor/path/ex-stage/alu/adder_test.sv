module adder_test();

	logic [2:0] a, b, y;
	logic cin, cout;

	adder #(3) DUT(.a(a), .b(b), .cin(cin), .sum(y), .cout(cout));

	initial begin
		#10 a = 3'b000; b = 3'b000; cin = 0;
		#1 $display("a=%b, b=%b, cin=%b, y=%b, cout=%b\n", a, b, cin, y, cout);
		#10 a = 3'b000; b = 3'b000; cin = 1;
		#1 $display("a=%b, b=%b, cin=%b, y=%b, cout=%b\n", a, b, cin, y, cout);

		#10 a = 3'b111; b = 3'b000; cin = 0;
		#1 $display("a=%b, b=%b, cin=%b, y=%b, cout=%b\n", a, b, cin, y, cout);
		#10 a = 3'b111; b = 3'b000; cin = 1;
		#1 $display("a=%b, b=%b, cin=%b, y=%b, cout=%b\n", a, b, cin, y, cout);

		#10 a = 3'b000; b = 3'b111; cin = 0;
		#1 $display("a=%b, b=%b, cin=%b, y=%b, cout=%b\n", a, b, cin, y, cout);
		#10 a = 3'b000; b = 3'b111; cin = 1;
		#1 $display("a=%b, b=%b, cin=%b, y=%b, cout=%b\n", a, b, cin, y, cout);

		#10 a = 3'b101; b = 3'b010; cin = 0;
		#1 $display("a=%b, b=%b, cin=%b, y=%b, cout=%b\n", a, b, cin, y, cout);
		#10 a = 3'b101; b = 3'b010; cin = 1;
		#1 $display("a=%b, b=%b, cin=%b, y=%b, cout=%b\n", a, b, cin, y, cout);

		#10 a = 3'b010; b = 3'b111; cin = 0;
		#1 $display("a=%b, b=%b, cin=%b, y=%b, cout=%b\n", a, b, cin, y, cout);
		#10 a = 3'b010; b = 3'b111; cin = 1;
		#1 $display("a=%b, b=%b, cin=%b, y=%b, cout=%b\n", a, b, cin, y, cout);

		#10 a = 3'b101; b = 3'b111; cin = 0;
		#1 $display("a=%b, b=%b, cin=%b, y=%b, cout=%b\n", a, b, cin, y, cout);
		#10 a = 3'b101; b = 3'b111; cin = 1;
		#1 $display("a=%b, b=%b, cin=%b, y=%b, cout=%b\n", a, b, cin, y, cout);

		#10 a = 3'b111; b = 3'b111; cin = 0;
		#1 $display("a=%b, b=%b, cin=%b, y=%b, cout=%b\n", a, b, cin, y, cout);
		#10 a = 3'b111; b = 3'b111; cin = 1;
		#1 $display("a=%b, b=%b, cin=%b, y=%b, cout=%b\n", a, b, cin, y, cout);
	end

endmodule // adder_test
