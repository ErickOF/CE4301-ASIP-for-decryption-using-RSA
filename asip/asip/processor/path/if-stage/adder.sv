/**
 * Adder module.
 *
 * Parameters:
 *     N       - number of bits.
 *
 * Inputs:
 *     a       - first operand.
 *     b       - seconde operand.
 *
 * Outputs:
 *     result  - result.
 *
 */
module adder #(parameter N=32)
				(input  logic [N-1:0] a, b,
				 output logic [N-1:0] result);

	// Vars to save results
	logic [N-1:0] result_sum;
	
	always_comb begin
		result_sum <= a + b;
	end

	// Adder result
	assign result = result_sum;

endmodule // adder
