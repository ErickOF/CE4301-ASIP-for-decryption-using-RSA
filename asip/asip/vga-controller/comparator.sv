/**
 * Comparator module.
 *
 * Parameters:
 *     N       - number of bits.
 *
 * Inputs:
 *     a       - first operand - Horizontal Count / Vertical Count.
 *     b       - second operand - HMax / VMax.
 *     c       - third operand - HSyn / VSyn.
 *     d       - fourth operand - HSYN + HBP / VSYN + VBP.
 *     e       - fifth operand - HSYN + HBP + HACTIVE / VSYN + VBP + VACTIVE.
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
	output logic lt, gte, gte2, gte3);

	always_comb begin
		lt  = (a < e);
		gte = (a >= b);
		gte2 = (a >= c);
		gte3 = (a >= d);

	end
endmodule
	