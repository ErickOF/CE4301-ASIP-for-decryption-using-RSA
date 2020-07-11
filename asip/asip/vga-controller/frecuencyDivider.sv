/**
 * Frecuency Divider module.
 *
 * Inputs:
 *     clk       - Clock signal.
 *     rst       - Reset signal.
 *     ena       - Enable signal.
 *
 * Outputs:
 *     o_clock	 - Clock output signal.
 *
 */
module frequencyDivider (
	input logic clk, rst,
	output logic o_clk);
	
	logic intern_clk;
	
	assign o_clk = intern_clk;
	
	always_ff @(posedge clk)
		if (rst) 
			intern_clk <= 0;
		else 
			intern_clk <= ~intern_clk;
	
endmodule
