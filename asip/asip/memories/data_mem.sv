/**
 * Data Memory.
 *
 * Parameters:
 *     N             - number of bits.
 *
 * Inputs:
 *     clk           - clock signal.
 * 	 write_enable  - write enable signal.
 * 	 address       - address in memory.
 *     write_data    - data to write.
 *
 * Outputs:
 *     read_data     - read data from memory.
 *
 */
 
module data_mem #(parameter N=32)
                 (input  logic         clk, write_enable,        
                  input  logic [N-1:0] address, pixel_address, write_data,
						output logic [7:0]   pixel,
                  output logic [N-1:0] read_data);

	// Signals
	logic we0, we1, we2, we3, we4, we5, we6, we7;
	// Read data
	logic [N-1:0] rd0, rd1, rd2, rd3, rd4, rd5, rd6, rd7, rd;
	// Read pixel
	logic [7:0]   rp0, rp1, rp2, rp3, rp4, rp5, rp6, rp7, rp;

	// Write enable signals
	assign we0 = (address[N-1:16]) == 16'b000 ? (1'b1 && write_enable) : 1'b0;
	assign we1 = (address[N-1:16]) == 16'b001 ? (1'b1 && write_enable) : 1'b0;
	assign we2 = (address[N-1:16]) == 16'b010 ? (1'b1 && write_enable) : 1'b0;
	assign we3 = (address[N-1:16]) == 16'b011 ? (1'b1 && write_enable) : 1'b0;
	assign we4 = (address[N-1:16]) == 16'b100 ? (1'b1 && write_enable) : 1'b0;
	assign we5 = (address[N-1:16]) == 16'b101 ? (1'b1 && write_enable) : 1'b0;
	assign we6 = (address[N-1:16]) == 16'b110 ? (1'b1 && write_enable) : 1'b0;
	assign we7 = (address[N-1:16]) == 16'b111 ? (1'b1 && write_enable) : 1'b0;

	// Memory Array
	// Encrypt Image
	dmem_cell #(16, 32, "0") dmem0(clk, we0,  address[15:0], pixel_address[15:0], write_data, rd0, rp0);
	dmem_cell #(16, 32, "1") dmem1(clk, we1,  address[15:0], pixel_address[15:0], write_data, rd1, rp1);
	dmem_cell #(16, 32, "2") dmem2(clk, we2,  address[15:0], pixel_address[15:0], write_data, rd2, rp2);
	dmem_cell #(16, 32, "3") dmem3(clk, we3,  address[15:0], pixel_address[15:0], write_data, rd3, rp3);
	// Decrypt Image
	dmem_cell #(16, 32, "4") dmem4(clk, we4,  address[15:0], pixel_address[15:0], write_data, rd4, rp4);
	dmem_cell #(16, 32, "5") dmem5(clk, we5,  address[15:0], pixel_address[15:0], write_data, rd5, rp5);
	dmem_cell #(16, 32, "6") dmem6(clk, we6,  address[15:0], pixel_address[15:0], write_data, rd6, rp6);
	dmem_cell #(16, 32, "7") dmem7(clk, we7,  address[15:0], pixel_address[15:0], write_data, rd7, rp7);

	// Select read data
	always_comb begin
		if (address[N-1:16] == 0) begin
			rd = rd0;
		end
		else if (address[N-1:16] == 1) begin
			rd = rd1;
		end
		else if (address[N-1:16] == 2) begin
			rd = rd2;
		end
		else if (address[N-1:16] == 3) begin
			rd = rd3;
		end
		else if (address[N-1:16] == 4) begin
			rd = rd4;
		end
		else if (address[N-1:16] == 5) begin
			rd = rd5;
		end
		else if (address[N-1:16] == 6) begin
			rd = rd6;
		end
		else if (address[N-1:16] == 7) begin
			rd = rd7;
		end
		else begin
			rd = 32'b0;
		end
	end
	
	
	// Select read pixel
	always_comb begin
		if (pixel_address[N-1:16] == 0) begin
			rp = rp0;
		end
		else if (pixel_address[N-1:16] == 1) begin
			rp = rp1;
		end
		else if (pixel_address[N-1:16] == 2) begin
			rp = rp2;
		end
		else if (pixel_address[N-1:16] == 3) begin
			rp = rp3;
		end
		else if (pixel_address[N-1:16] == 4) begin
			rp = rp4;
		end
		else if (pixel_address[N-1:16] == 5) begin
			rp = rp5;
		end
		else if (pixel_address[N-1:16] == 6) begin
			rp = rp6;
		end
		else if (pixel_address[N-1:16] == 7) begin
			rp = rp7;
		end
		else begin
			rp = 8'b0;
		end
	end
	
	assign read_data = rd;
	assign pixel = rp;

endmodule // data_mem
