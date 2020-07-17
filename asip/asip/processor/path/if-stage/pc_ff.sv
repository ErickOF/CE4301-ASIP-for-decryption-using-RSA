/*
 * This module represents the PC register.
 *
 * Parameters:
 *     N           - number of bits.
 *
 * Params
 * 	clk        - clock.
 *    reset      - reset signal.
 *    current_pc - current PC dir.
 *
 * Outputs
 *    next_pc    - next PC.
 */
module pc_ff #(parameter N=32)
              (input  logic clk, reset,
               input  logic [N-1:0] current_pc,
               output logic [N-1:0] next_pc);

always_ff @(posedge clk, posedge reset)
	if (reset) begin
		next_pc <= 0;
	end
	else begin
		next_pc <= current_pc;
	end

endmodule // pc_ff
