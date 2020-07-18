module postoadress (
				input logic [9:0] pos_x, pos_y,
				input logic CHG_IMG,
				output logic[31:0] Pix_Ad);
				
logic[9:0] Imag_rows_encrypt = 10'd640;
logic[9:0] Imag_rows_unencrypt = 10'd320;
logic[31:0] Pix_Ad_Aux;


always_comb

	if (CHG_IMG == 1) begin
	
		Pix_Ad_Aux = Imag_rows_unencrypt*pos_y+pos_x;
		Pix_Ad = {14'b0, 1'b1, Pix_Ad_Aux[16:0]};
		
	end
	
	else begin
	
		Pix_Ad_Aux = Imag_rows_encrypt*pos_y+pos_x;
		Pix_Ad = {14'b0, 1'b0, Pix_Ad_Aux[16:0]};
		
	end
	
endmodule	