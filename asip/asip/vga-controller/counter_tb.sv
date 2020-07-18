module counter_tb;

	logic clk, rst;
	logic [7:0] cnt;
	
	initial
		begin
			rst = 1;
			clk = 0;
			#10000 rst = 0;
		end
		
	always #5000 clk = ~clk;
	
	counter u0 (clk, rst, cnt);
		
endmodule
