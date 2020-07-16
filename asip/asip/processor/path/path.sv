module path #(parameter N=32)
				 (input  logic         clock, reset,
				  input  logic [1:0]   branch, ext_selector,
				  input  logic         rb_selector, we, wr_en,
				  input  logic [N-1:0]   instruction,
				  output logic [2:0]   opcode,
				  output logic [1:0]   funct,
				  output logic [N-1:0] pc);

	// Var to save result
	logic [N-1:0] pc;
	logic [N-1:0] instr_id;
	logic [N-1:0] jmp_pc;
	logic pc_selector;
	
	if_stage   #(N) ifs (clock, reset, jmp_pc, pc_selector, pc);
	instruction_mem #(N) (pc, instr_if);
	if_id_pipe #(N) ifidp (clock, reset, instruction, instruction_id);
	//id_stage   #(N) ids (clock, reset)


endmodule // path