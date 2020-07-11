/**
 * Mux to select ALU operand B.
 *
 * Parameters:
 *     N            - number of bits.
 *
 * Inputs:
 *     rdb          - read data from source register B.
 *     extended     - extended value.
 *     opb_selector - ALU operand B to be selected.
 *
 * Outputs:
 *     selected_opb - selected operand B.
 *
 */
module opb_mux #(parameter N=32)
				   (input  logic [N-1:0] rdb, extended,
					 input  logic         opb_selector,
				    output logic [N-1:0] selected_opb);

	// Var to save result
	logic [N-1:0] result;
	
	always_comb begin
		if (opb_selector == 1'b0) begin
			result <= rdb;
		end
		else begin
		   result <= extended;
		end
	end

	assign selected_opb = result;

endmodule // opb_mux
