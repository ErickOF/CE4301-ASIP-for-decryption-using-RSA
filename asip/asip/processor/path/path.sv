module path #(parameter N=32)
				 (input  logic         clock, reset,
				  input  logic [1:0]   branch, ext_selector,
				  input  logic         rb_selector, we_id, wr_en,
				  input  logic [N-1:0] instruction,
				  output logic [2:0]   opcode,
				  output logic [1:0]   func,
				  output logic [4:0]   ra_ex, rb_ex, rf_ex,
				  output logic [N-1:0] pc);

	// Var to save result
	logic [N-1:0] instr_id;
	logic [N-1:0] jmp_pc;
	logic pc_selector, we_wb;
	logic [N-1:0] rda_id, rdb_id, extended_id, wd_wb;
	logic [4:0]   rw_wb, ra_id, rb_id, rf_id;
	
	if_stage   #(N) ifs (clock, reset, jmp_pc, pc_selector, pc);
	if_id_pipe #(N) ifidp (clock, reset, instruction, instruction_id);
	id_stage   #(N) ids (clock, reset, rb_selector, we_wb, instruction_id, wd_wb,
	                     ext_selector, rw_rb, opcode, func, ra_id, rb_id, rw_id,
								rda_id, rdb_id, extended_id);


endmodule // path
