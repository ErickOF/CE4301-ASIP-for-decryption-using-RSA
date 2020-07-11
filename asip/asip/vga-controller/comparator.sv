/**
 * Comparator module.
 *
 * Parameters:
 *     N       - number of bits.
 *
 * Inputs:
 *     a       - first operand.
 *     b       - second operand.
 *
 * Outputs:
 *     eq  		- Equal to.
 *     neq 		- Not Equal to.
 *     lt  		- Less than.
 *     lte  	- Less than or equal to.
 *     gt  		- Grather than.
 *     gte  	- Grather than or equal to. 
 *
 */

module comparator #(parameter N = 8) (
	input  logic [N-1:0] a, b,
	output logic eq, neq, lt, lte, gt, gte);

	always_comb begin
		eq  = (a == b);
		neq = (a != b);
		lt  = (a < b);
		lte = (a <= b);
		gt  = (a > b);
		gte = (a >= b);
	end
endmodule
	