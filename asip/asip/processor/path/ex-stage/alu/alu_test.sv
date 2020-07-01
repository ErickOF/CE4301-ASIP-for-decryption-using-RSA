module alu_test();
	logic [1:0] ALUControl;
	logic [3:0] a, b, result;
	logic			Z, C;

	alu #(4) DUT(a, b, ALUControl[0], result, Z, C);

	initial begin
		// ADD
		#10 a = 4'b0000; b = 4'b0000; ALUControl = 2'b00;
		#1 $display("a=%b, b=%b, ALUControl=%b, result=%b, Z=%b, C=%b\n", a, b, ALUControl, result, Z, C);
		#10 a = 4'b0000; b = 4'b1111; ALUControl = 2'b00;
		#1 $display("a=%b, b=%b, ALUControl=%b, result=%b, Z=%b, C=%b\n", a, b, ALUControl, result, Z, C);
		#10 a = 4'b1111; b = 4'b0000; ALUControl = 2'b00;
		#1 $display("a=%b, b=%b, ALUControl=%b, result=%b, Z=%b, C=%b\n", a, b, ALUControl, result, Z, C);
		#10 a = 4'b1111; b = 4'b1111; ALUControl = 2'b00;
		#1 $display("a=%b, b=%b, ALUControl=%b, result=%b, Z=%b, C=%b\n", a, b, ALUControl, result, Z, C);
		#10 a = 4'b0110; b = 4'b0001; ALUControl = 2'b00;
		#1 $display("a=%b, b=%b, ALUControl=%b, result=%b, Z=%b, C=%b\n", a, b, ALUControl, result, Z, C);
		#10 a = 4'b0001; b = 4'b0111; ALUControl = 2'b00;
		#1 $display("a=%b, b=%b, ALUControl=%b, result=%b, Z=%b, C=%b\n", a, b, ALUControl, result, Z, C);

		// SUB
		#10 a = 4'b0000; b = 4'b0000; ALUControl = 2'b01;
		#1 $display("a=%b, b=%b, ALUControl=%b, result=%b, Z=%b, C=%b\n", a, b, ALUControl, result, Z, C);
		#10 a = 4'b0000; b = 4'b1111; ALUControl = 2'b01;
		#1 $display("a=%b, b=%b, ALUControl=%b, result=%b, Z=%b, C=%b\n", a, b, ALUControl, result, Z, C);
		#10 a = 4'b1111; b = 4'b0000; ALUControl = 2'b01;
		#1 $display("a=%b, b=%b, ALUControl=%b, result=%b, Z=%b, C=%b\n", a, b, ALUControl, result, Z, C);
		#10 a = 4'b1111; b = 4'b1111; ALUControl = 2'b01;
		#1 $display("a=%b, b=%b, ALUControl=%b, result=%b, Z=%b, C=%b\n", a, b, ALUControl, result, Z, C);
		#10 a = 4'b0110; b = 4'b0001; ALUControl = 2'b01;
		#1 $display("a=%b, b=%b, ALUControl=%b, result=%b, Z=%b, C=%b\n", a, b, ALUControl, result, Z, C);
		#10 a = 4'b0001; b = 4'b0111; ALUControl = 2'b01;
		#1 $display("a=%b, b=%b, ALUControl=%b, result=%b, Z=%b, C=%b\n", a, b, ALUControl, result, Z, C);
	end

endmodule // alu_test
