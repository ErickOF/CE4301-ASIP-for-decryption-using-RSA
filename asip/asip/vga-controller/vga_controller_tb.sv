module vga_controller_tb ();

	logic clk, rst, h_sync, v_sync, blank_n;
	logic [9:0] posx; 
	logic [8:0] posy;

	vga_controller DUT(clk, rst, h_sync, v_sync, blank_n, posx, posy);

	initial begin
	    #10 rst = 1;
		 rst = 0;
		 clk = 0;
	end

	always begin
		 #20000 clk = ~clk;
		 #1 $display("h_sync=%b, v_sync=%b, blank_n=%b, posx=%d, posy=%d", h_sync, v_sync, blank_n, posx, posy);
	end

endmodule // vga_controller_tb
