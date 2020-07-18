/*
 * Comparator Module
 *
 * Inputs:
 * 	 1 - first  to compare.
 *     2 - second  to compare.
 * Outputs:
 *     lower  - indicate if 1 is lower than 2.
 *     upper  - indicate if 1 is greather than 2.
 *     equal  - indicate if values are equal.
 */
module comparator #(parameter N=9)
                   (input  logic [N-1:0]  value1, value2,
                    output logic          lower, greater, equal);

	assign lower   = value1 < value2  ? 1'b1 : 1'b0;
	assign greater = value1 > value2  ? 1'b1 : 1'b0;
	assign equal   = value1 == value2 ? 1'b1 : 1'b0;

endmodule // comparator
