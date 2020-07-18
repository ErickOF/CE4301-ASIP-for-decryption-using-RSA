module postoaddress_tb ();
	logic [9:0] pos_x, pos_y; 
   logic [31:0] Pix_Ad;
	logic CHG_IMG;

	postoaddress DUT(pos_x, pos_y, CHG_IMG, Pix_Ad);

	initial begin
		pos_x = 10'b0;  pos_y = 10'b0;    CHG_IMG = 1'b0; #10; 
		pos_x = 10'b0;  pos_y = 10'b0;    CHG_IMG = 1'b1; #10;
		pos_x = 10'd639; pos_y = 10'd319; CHG_IMG = 1'b0; #10;		 
		pos_x = 10'd319; pos_y = 10'd319; CHG_IMG = 1'b1; #10;
		pos_x = 10'd319; pos_y = 10'd8;   CHG_IMG = 1'b0; #10;
		pos_x = 10'd200; pos_y = 10'd110; CHG_IMG = 1'b1; #10;
	end

endmodule // postoaddress_tb
