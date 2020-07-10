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
 *
 * Outputs:
 *     op           - operation code.
 *     func         - function.
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
						output logic [2:0]   op,
						output logic [1:0]   func,
				      output logic [N-1:0] rda, rdb, extended);

	// Temps vars
	logic [4:0]  ra, rb, rf, source_b;
	logic [28:0] constant;
	
	// Destiny
	assign rf = instruction[28:24];
	// Source register A
	assign ra = instruction[23:19];
	// Source register B
	assign rb = instruction[18:14];
	// Constant value
	assign constant = instruction[28:0];
	
	rb_mux         #(5)  rb_mux_instance(rb, rf, rb_selector, source_b);
	registers      #(N) regs_instance(clk, reset, we, ra, source_b, rf, wd, rda, rdb);
	zero_extension #(N) zext_instance(constant, ext_selector, extended);

	// Operation code
	assign op = instruction[31:29];
	assign func = instruction[1:0];

endmodule // id_stage
