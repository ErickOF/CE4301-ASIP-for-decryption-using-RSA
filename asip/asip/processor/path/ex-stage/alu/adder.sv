/**
 * This module sum two values.
 *
 * Parameters:
 * 	 N - number of bits.
 *
 * Inputs:
 *     a    - first operand.
 *     b    - second operand.
 *     cin  - carry input.
 *
 * Outputs:
 *     sum  - result to sum a and b.
 *     cout - carry out.
 *
 */
module adder #(parameter N=32)
              (input  logic [N-1:0] a, b,
				   input  logic         cin,
               output logic [N-1:0] sum,
					output logic         cout);

	// To save the result
	logic [N-1:0] result;
	// To save carry out
	logic cout_temp;

	always_comb begin
		{cout_temp, result} <= a + b + cin;
	end

	// Assign result to the output
	assign sum = result;
	// Assign the carry out
	assign cout = cout_temp;

endmodule // adder
