/**
 * Write Back Stage.
 *
 * Parameters:
 *     N             - number of bits.
 *
 * Inputs:
 * 	 wd_selector   - data to write in the register.
 *     read_data     - read data from memory.
 *     alu_result    - result from ALU.
 *
 * Outputs:
 *     selected_data - selected data.
 *
 */
module wb_stage #(parameter N=32)
				     (input  logic         wd_selector,
					   input  logic [N-1:0] read_data, alu_result,
				      output logic [N-1:0] selected_data);

	// Var to save result
	logic [N-1:0] result;
	
	always_comb begin
		if (wd_selector) begin
			result <= alu_result;
		end
		else begin
			result <= read_data;
		end
	end
	
	assign selected_data = result;

endmodule // wb_stage
