module asip #(parameter N=32)
				 (input  logic clk, clk_vga, reset, chg_img,
				  output logic v_sync, h_sync, blank_n,
				  output logic [23:0] RGB);

	// Vars to store results
	logic [9:0] posx, posy;
	logic [N-1:0] pixel_address, address, write_data, read_data, instruction, pc;
	logic write_enable;
	logic [7:0] pixel;
	
	vga_controller vga (clk_vga, reset, h_sync, v_sync, blank_n, posx, posy);
	
	postoaddress pos2address (posx, posy, chg_img, pixel_address);
	
	data_mem #(N) dmem (clk, write_enable, address, pixel_address, write_data,
	                    pixel, read_data);
	instruction_mem #(N) imem (pc, instruction);
	
	processor #(N) cpu(clk, reset, instruction, read_data, pc, address,
	                   write_data, write_enable);
	
	assign RGB = {pixel, pixel, pixel};
endmodule // asip
