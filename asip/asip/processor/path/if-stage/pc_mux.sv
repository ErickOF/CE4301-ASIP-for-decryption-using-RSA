/**
 * Mux to select PC.
 *
 * Parameters:
 *     N           - number of bits.
 *
 * Inputs:
 *     pc          - current pc.
 *     jmp_pc      - pc to jump.
 *     pc_selector - pc to be selected.
 *
 * Outputs:
 *     selected_pc - selected pc.
 *
 */
module pc_mux #(parameter N=32)
				   (input  logic [N-1:0] pc, jmp_pc,
					 input  logic         pc_selector,
				    output logic [N-1:0] selected_pc);

	// Var to save result
	logic [N-1:0] result;
	
	always_comb begin
		if (pc_selector == 1'b0) begin
			result <= pc;
		end
		else begin
		   result <= jmp_pc;
		end
	end

	assign selected_pc = result;

endmodule // pc_mux
