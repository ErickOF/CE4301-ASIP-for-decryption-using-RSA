/**
 * Counter module.
 *
 * Parameters:
 *     MAX    - max value to count.
 *
 * Inputs:
 *     clk    - clock signal.
 *     reset  - reset signal.
 *     enable - enable signal.
 *
 * Outputs:
 *     value  - value.
 *
 */
module counter #(parameter MAX=320)
                (input  logic clk, reset,
                 output logic [int'($clog2(MAX)):0] value);

	always_ff @(posedge clk, posedge reset) begin
		if (reset) begin
			value <= 10'b0;
		end
		else begin
			value <= value + 10'b1;
		end
	end

endmodule // counter

