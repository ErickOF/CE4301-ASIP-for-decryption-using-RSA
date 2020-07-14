/**
 * Comparator module.
 *
 * Parameters:
 *     N       - number of bits.
 *
 * Inputs:
 *     a       - first operand.
 *     b       - second operand.
 *     c       - third operand.
 *     d       - fourth operand.
 *     e       - fifth operand.
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
	input  logic [N-1:0] a, b, c, d, e,
	output logic eq, neq, lt, lte, gt, gte, gte2, gte3);

	always_comb begin
		eq  = (a == b);
		neq = (a != b);
		lt  = (a < e);
		lte = (a <= b);
		gt  = (a > b);
		gte = (a >= b);
		gte2 = (a >= c);
		gte3 = (a >= d);

	end
endmodule
	