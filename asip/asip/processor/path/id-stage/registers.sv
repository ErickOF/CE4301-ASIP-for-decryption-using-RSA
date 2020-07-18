/**
 * Registers.
 *
 * Parameters:
 *     N     - number of bits.
 *
 * Inputs:
 *     ra    - source register a.
 *     rb    - source register b.
 *     we    - write enable signal.
 *     rw    - register to write.
 *     wd    - data to write.
 *     clk   - clock
 *     reset - reset signal.
 *
 * Outputs:
 *     rda   - data in source register a.
 *     rdb   - data in source register b.
 *
 */
module registers #(parameter N=32)
                  (input  logic         clk, reset,
                   input  logic         we,
                   input  logic [4:0]   ra, rb, rw,
                   input  logic [N-1:0] wd,
                   output logic [N-1:0] rda, rdb);

	// Register files
	logic [31:0] rf[N-1:0];


	// Write in negative edges
	always_ff @(clk) begin
		if (~clk && we) begin
			// Write in register
         rf[rw] <= wd;
		end
		// Reset registers
		if (reset) begin
			rf <= '{32{32'b0}};
		end
	end

	// Read registers
	assign rda = rf[ra];
	assign rdb = rf[rb];

endmodule // registers
