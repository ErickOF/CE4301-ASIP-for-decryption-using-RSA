/**
 * Instruction Decode Stage.
 *
 * Parameters:
 *     N            - number of bits.
 *
 * Inputs:
 * 	 clk          - clock signal.
 *     reset        - reset signal.
 *     rb_selector  - rb to be selected.
 *     we           - write enable signal.
 *     instruction  - instruction to be decoded.
 *     wd           - data to write.
 *     ext_selector - type of extension.
 *     rw           - register to write.
 *
 * Outputs:
 *     op           - operation code.
 *     func         - function.
 *     ra           - source register a.
 *     rb           - source register b.
 *     rw           - register to write.
 *     rda          - data in source register a.
 *     rdb          - data in source register b.
 *     extended     - extended value.
 *
 */
module id_stage #(parameter N=32)
				     (input  logic         clk, reset,
				      input  logic         rb_selector, we,
					   input  logic [N-1:0] instruction, wd,
					   input  logic [1:0]   ext_selector,
						input  logic [4:0]   rw_wb,
						output logic [2:0]   op,
						output logic [1:0]   func,
				      output logic [4:0]   ra, rb, rw,
						output logic [N-1:0] rda, rdb, extended);

	// Temps vars
	logic [4:0]  ra_temp, rb_temp, rw_temp, source_b;
	logic [28:0] constant;
	
	always_comb begin
		// Destiny
		rw_temp <= instruction[28:24];
		// Source register A
		ra_temp <= instruction[23:19];
		// Source register B
		rb_temp <= instruction[18:14];
		// Constant value
		constant <= instruction[28:0];
	end
	
	rb_mux         #(5) rb_mux_instance(rb_temp, rw_temp, rb_selector, source_b);
	registers      #(N) regs_instance(clk, reset, we, ra_temp, source_b, rw_wb, wd, rda, rdb);
	zero_extension #(N) zext_instance(constant, ext_selector, extended);

	// Operation code
	assign op = instruction[31:29];
	// Function
	assign func = instruction[1:0];
	// Registers
	assign ra = ra_temp;
	assign rb = rb_temp;
	assign rw = rw_temp;

endmodule // id_stage
