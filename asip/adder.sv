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

logic [N-1:0] resultAdd;

always_comb begin
	resultAdd <= a + b;
end

assign y = resultAdd;

endmodule // adder
