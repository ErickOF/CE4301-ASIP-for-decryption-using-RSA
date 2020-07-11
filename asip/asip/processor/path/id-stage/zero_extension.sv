/**
 * Zero extension.
 *
 * Parameters:
 *     N            - number of bits.
 *
 * Inputs:
 *     value        - value to apply zero extension.
 *     ext_selector - type of extension.
 *
 * Outputs:
 *     extended     - extended value.
 *
 */
module zero_extension #(parameter N=32)
                       (input  logic [28:0]  value,
                        input  logic [1:0]   ext_selector,
						      output logic [N-1:0] entended);

	logic [N-1:0] result;

	always_comb begin
		case(ext_selector)
			// Operand type: Extending constant value
			2'b00: result <= {20'b0, value[13:2]};
			// L/S: Extending contants value
			2'b01: result <= {13'b0, value[18:0]};
			// Jump: Extending jump address
			2'b10: result <= { 3'b0, value};
			// Default value
			default: result <= 32'b0;
		endcase
	end

	assign entended = result;

endmodule // zero_extension
