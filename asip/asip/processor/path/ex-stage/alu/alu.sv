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
	
	always_comb begin
		if (aluFunc == 1'b0) begin
			{cout, result_sum} <= a + b;
		end
		else begin
		   {cout, result_sum} <= a - b;
		end
	end

	// Assign flags
	assign C = cout;
	assign Z = &(~result_sum);
	// Alu result
	assign result = result_sum;

endmodule // alu
