/**
 * This module is the ALU.
 *
 * Parameters:
 *     N       - number of bits.
 *
 * Inputs:
 *     a       - first operand.
 *     b       - seconde operand.
 *     aluFunc - function to be executed.
 *
 * Outputs:
 *     result  - alu result.
 *     Z       - zero flag. Indicates if the result was zero.
 *     C       - Carry flag. Indicates if the result has a carry out.
 *
 */
module alu #(parameter N=32)
				(input  logic [N-1:0] a, b,
				 input  logic         aluFunc,
				 output logic [N-1:0] result,
				 output logic         Z, C);

	// Vars to save results
	logic 		  cout;
	logic [N-1:0] result_sum;
	logic [N-1:0] result_mux_not;

	// Verify if b operand has to be changed
	mux_not #(N) mux_not_module   (b, aluFunc, result_mux_not);
	// Add operands
	adder   #(N) fulladder_module (a, result_mux_not, aluFunc, result_sum, cout);

	// Assign flags
	assign C = cout;
	assign Z = &(~result_sum);
	// Alu result
	assign result = result_sum;

endmodule // alu
