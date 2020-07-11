/**
 * Instruction Execution Stage.
 *
 * Parameters:
 *     N            - number of bits.
 *
 * Inputs:
 *     rda          - first ALU operand.
 *     rdb          - read data from source register B.
 *     extended     - extended value.
 *     alu_func     - function to be executed.
 *     opb_selector - ALU operand B to be selected.
 *
 * Outputs:
 *     alu_result   - ALU result.
 *     Z            - zero flag.
 *     C            - carry flag.
 *
 */
module ex_stage #(parameter N=32)
				     (input  logic [N-1:0] rda, rdb, extended,
						input  logic         alu_func, opb_selector,
				      output logic [N-1:0] alu_result,
						output logic         Z, C);

	// Var to save result
	logic [N-1:0] operand_b;

	opb_mux #(32) opb_mux_instance(rdb, extended, opb_selector, operand_b);
	alu     #(32) alu_instance(rda, operand_b, alu_func, alu_result, Z, C);

endmodule // ex_stage
