/**
 * Instruction Fetch Stage.
 *
 * Parameters:
 *     N           - number of bits.
 *
 * Inputs:
 * 	 clk         - clock signal.
 *     reset       - reset signal.
 *     jmp_pc      - pc to jump.
 *     pc_selector - function to be executed.
 *
 * Outputs:
 *     pc          - current pc.
 *
 */
module if_stage #(parameter N=32)
				     (input  logic         clk, reset,
					   input  logic [N-1:0] jmp_pc,
					   input  logic         pc_selector,
				      output logic [N-1:0] pc);

	// Var to save result
	logic [N-1:0] result;
	logic [N-1:0] pc_plus4;
	logic [N-1:0] pc_reg;
	
	pc_ff  #(32) pc_ff_instance(clk, reset, pc_plus4, pc_reg);
	pc_mux #(32) pc_mux_instance(pc_reg, jmp_pc, pc_selector, pc);
	adder  #(32) adder_instance(pc, 32'b100, pc_plus4);

endmodule // if_stage
