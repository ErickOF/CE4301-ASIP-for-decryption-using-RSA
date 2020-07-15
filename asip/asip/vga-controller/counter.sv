/**
 * Counter module.
 *
 * Parameters:
 *     N   - number of bits.
 *
 * Inputs:
 *     clk - clock signal.
 *     rst - reset signal.
 *     ena - enable signal.
 *
 * Outputs:
 *     cnt - count.
 *
 */
module counter #(parameter N=8) 
	             (input  logic         clk, rst,
	              output logic [N-1:0] cnt);

	// Synchronous reset.
	always_ff @(posedge clk) begin
		if (rst)	begin		
			cnt <= 0;
		end else begin
			cnt <= cnt + 1;
		end
	end

endmodule // counter
