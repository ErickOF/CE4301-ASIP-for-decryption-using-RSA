/*
 * Instruction Memory.
 * 
 * Parameters:
 *     N  - number of bits.
 *
 * Inputs:
 *     a  - addres to read.
 *
 * Outputs
 *     rd - read data.
 */
module instruction_mem #(parameter N=32)
                        (input  logic [N-1:0] a,
				             output logic [N-1:0] rd);

	logic [N-1:0] rom[38:0];

	initial begin
		 $readmemh("C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/memories/instructions.txt", rom);
	end
	

	assign rd = rom[a[N-1:2]];

endmodule // instruction_mem