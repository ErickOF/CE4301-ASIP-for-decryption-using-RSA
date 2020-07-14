/**
 * Counter module.
 *
 * Parameters:
 *     N       - number of bits.
 *
 * Inputs:
 *     clk       - Clock signal.
 *     rst       - Reset signal.
 *     ena       - Enable signal.
 *
 * Outputs:
 *     cnt 		 - Count.
 *
 */
module counter #(parameter N = 8) 
	(input  logic clk,
	 input  logic rst,
	 output logic [N-1:0] cnt);
	 
	// Synchronous reset.
	always_ff @(posedge clk)
		if (rst)			
			cnt <= 0;
		else	
			cnt <= cnt + 1;
	
endmodule
