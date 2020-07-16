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
 
module data_memory #(parameter N=16, BITS=32)
                    (input  logic            clk, write_enable,        
                     input  logic [N-1:0]    address, 
							input  logic [BITS-1:0] write_data,
                     output logic [BITS-1:0] read_data);

	// Create memory space
							 
	logic [7:0] memory[0:65535];


	initial begin
		 $readmemh("C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/processor/path/mem-stage/Hexa.txt", memory);
	end

	assign read_data = {24'b0, memory[address[N-1:2]]};

	always_ff @(posedge clk) begin
		if (write_enable) begin
			memory[address[N-1:2]] <= write_data[7:0];
		end
	end

endmodule // data_memory
