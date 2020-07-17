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
 
module dmem_cell #(parameter N=16, BITS=32, NUMBER="0")
                  (input  logic            clk, write_enable,        
                   input  logic [N-1:0]    address, pixel_address, 
					    input  logic [BITS-1:0] write_data,
                   output logic [BITS-1:0] read_data,
						 output logic [7:0]      pixel);

	// Create memory space				 
	logic [7:0] memory[0:65535];

	initial begin
		 $readmemh({"C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/memories/mem", NUMBER, ".txt"}, memory);
	end

	assign read_data = {24'b0, memory[address[N-1:2]]};
	assign pixel = memory[pixel_address[N-1:2]];

	always_ff @(posedge clk) begin
		if (write_enable) begin
			memory[address[N-1:2]] <= write_data[7:0];
		end
	end

endmodule // dmem_cell
