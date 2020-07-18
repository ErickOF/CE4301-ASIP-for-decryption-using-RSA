/**
 * Mux to select source RB.
 *
 * Parameters:
 *     N           - number of bits.
 *
 * Inputs:
 *     rf          - source register.
 *     rb          - b register.
 *     rb_selector - rb to be selected.
 *
 * Outputs:
 *     selected_rb - selected rb.
 *
 */
module rb_mux #(parameter N=32)
				   (input  logic [N-1:0] rb, rf,
					 input  logic         rb_selector,
				    output logic [N-1:0] selected_rb);

	// Var to save result
	logic [N-1:0] result;
	
	always_comb begin
		if (rb_selector == 1'b0) begin
			result <= rb;
		end
		else begin
		   result <= rf;
		end
	end

	assign selected_rb = result;

endmodule // rb_mux
