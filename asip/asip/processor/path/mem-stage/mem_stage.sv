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
 *     write_data            - data to write.
 *
 * Outputs:
 *     read_data            - read data from memory.
 *
 */
 
module mem_stage #(parameter N=32)
                  (input  logic         clk, write_enable,        
                   input  logic [N-1:0] address, write_data, 
                   output logic [N-1:0] read_data);

//create memory space
						 
logic [N-1:0] memory[0:204799];


initial begin
    $readmemh("Hexa.txt", memory);
end 

assign read_data = memory[address[N-1:2]];

always_ff @(posedge clk)
    if (write_enable) memory[address[N-1:2]] <= write_data;	 

endmodule // mem_stage
