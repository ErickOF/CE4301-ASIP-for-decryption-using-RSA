/**
 * This module change the value of B operand when substraction operation
 * is needed.
 *
 * Parameters:
 * 	 N        - number of bits.
 *
 * Inputs:
 *     b        - operand.
 *     control  - signal to indicate if the operand has to be changed.
 *
 * Outputs:
 *     new_b    - new b value.
 *
 */
module mux_not #(parameter N=32)
					 (input  logic [N-1:0] b,
					  input  logic         control,
					  output logic [N-1:0] new_b);

   // To save the result
	logic [N-1:0] result;

	always_comb begin
		result = control ? ~b : b;
	end

	// Assign output
	assign new_b = result;

endmodule // mux_not
