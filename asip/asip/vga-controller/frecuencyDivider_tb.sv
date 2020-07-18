module frecuencyDivider_tb;


	logic clk, rst, o_clk;
	frequencyDivider uut (clk, rst, o_clk);
	initial begin
		clk = 0;
		rst = 1;
		#10000 rst = 0;
		
	end
	
	always #5000 clk = ~clk;
	
endmodule