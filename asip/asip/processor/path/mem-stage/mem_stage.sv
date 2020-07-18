/**
 * Memory Stage.
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
 
module mem_stage #(parameter N=32)
                  (input  logic         clk, write_enable,
                   input  logic [N-1:0] address, write_data,
                   output logic [N-1:0] read_data);

	// Signals
	logic we0, we1, we2, we3;
	// Read data
	logic [N-1:0] rd0, rd1, rd2, rd3, rd;

	// Write enable signals
	assign we0 = (address[N-1:16]) == 16'b00 ? (1'b1 && write_enable) : 1'b0;
	assign we1 = (address[N-1:16]) == 16'b01 ? (1'b1 && write_enable) : 1'b0;
	assign we2 = (address[N-1:16]) == 16'b10 ? (1'b1 && write_enable) : 1'b0;
	assign we3 = (address[N-1:16]) == 16'b11 ? (1'b1 && write_enable) : 1'b0;

	// Memory Array
	data_memory #(16, 32, "0") dmem0(clk, we0,  address[15:0], write_data, rd0);
	data_memory #(16, 32, "1") dmem1(clk, we1,  address[15:0], write_data, rd1);
	data_memory #(16, 32, "2") dmem2(clk, we2,  address[15:0], write_data, rd2);
	data_memory #(16, 32, "3") dmem3(clk, we3,  address[15:0], write_data, rd3);

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
		else begin
			rd = 32'b0;
		end
	end
	
	assign read_data = rd;

endmodule // mem_stage
