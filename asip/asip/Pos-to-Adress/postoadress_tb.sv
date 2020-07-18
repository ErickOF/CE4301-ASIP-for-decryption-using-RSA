module postoadress_tb (); 


	logic [9:0] pos_x, pos_y; 
   logic [31:0] Pix_Ad;
	logic CHG_IMG;

	postoadress DUT(pos_x, pos_y, CHG_IMG, Pix_Ad);

	initial begin


		pos_x = 10'b0; pos_y = 10'b0; CHG_IMG = 1'b0; #10; 
		pos_x = 10'b0; pos_y = 10'b0; CHG_IMG = 1'b1; #10;
		pos_x = 10'b1111111111; pos_y = 10'b1111111111; CHG_IMG = 1'b0; #10;		 
		pos_x = 10'b0111111111; pos_y = 10'b0000001000; CHG_IMG = 1'b1; #10;
		pos_x = 10'b0111111111; pos_y = 10'b0000001000; CHG_IMG = 1'b0; #10;
		pos_x = 10'b0000000000; pos_y = 10'b0000000000; CHG_IMG = 1'b1; #10;

	end

endmodule
