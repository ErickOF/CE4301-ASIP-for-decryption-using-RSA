/**
 * This module sum two values
 *
 * Params:
 *     a - first operand
 *     b - second operand
 *
 * Outputs:
 *     y - result to sum a and b
**/
module adder #(parameter N=32)
              (input  logic [N-1:0] a, b,
               output logic [N-1:0] y);

logic [N-1:0] result_add;

always_comb begin
	result_add <= a + b;
end

assign y = result_add;

endmodule // adder
