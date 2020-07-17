module path #(parameter N=32)
				 (input  logic         clock, reset,
				  input  logic [1:0]   branch, ext_selector,
				  input  logic         rb_selector, wr_en_id, opb_sel_id,
				  input  logic         alu_func_id, wd_sel_id, wm_en_id,
				  input  logic [N-1:0] instruction,
				  output logic [2:0]   opcode,
				  output logic [1:0]   func,
				  output logic [4:0]   ra_id, rb_id, rw_id, ra_ex, rb_ex, rw_ex, rw_mem, rw_wb,
				  output logic [N-1:0] pc);

	// Var to save result
	logic [N-1:0] instruction_id;
	logic [N-1:0] rda_id, rda_ex;
	logic [N-1:0] rdb_id, rdb_ex, rdb_mem;
	logic [N-1:0] extended_id, extended_ex;
	logic [N-1:0] wd_wb, rd_mem, rd_wb;
	logic pc_selector;
	logic alu_func_ex;
	logic wr_en_ex, wr_en_mem;
	logic opb_sel_ex;
	logic wr_en_wb;
	logic wd_sel_ex, wd_sel_mem;
	logic wm_en_ex, wm_en_mem;
	logic alu_result_ex, alu_result_mem, alu_result_wb;
	logic Z;
	logic wd_sel_wb;

	// Jump logic
	always_comb begin
		case(branch)
			// Jump Equal
			2'b00: pc_selector = (Z == 1'b1) ? 1'b1 : 1'b0;
			// Jump Not Equal
			2'b01: pc_selector = (Z == 1'b0) ? 1'b1 : 1'b0;
			// Inconditional Jump
			2'b10: pc_selector = 1'b1;
			// No jump
			2'b11: pc_selector = 1'b0;
		endcase
	end

	// STAGES
	// Instruction fetch stage
	if_stage    #(N) ifs (clock, reset, extended_id, pc_selector, pc);
	// IF/ID Pipe
	if_id_pipe  #(N) ifidp (clock, reset, instruction, instruction_id);
	// Istruction decode stage
	id_stage    #(N) ids (clock, reset, rb_selector, wr_en_wb, instruction_id, wd_wb,
	                      ext_selector, rw_wb, opcode, func, ra_id, rb_id, rw_id,
								 rda_id, rdb_id, extended_id);
	// ID/EX Pipe
	id_ex_pipe  #(N) idexp (clock, reset, rda_id, rdb_id, extended_id, ra_id,
	                       rb_id, rw_id, wr_en_id, opb_sel_id, alu_func_id,
								  wd_sel_id, wm_en_id, rda_ex, rdb_ex, extended_ex,
                          ra_ex, rb_ex, rw_ex, wr_en_ex, opb_sel_ex,
								  alu_func_ex, wd_sel_ex, wm_en_ex);
	// Execution stage
	ex_stage    #(N) exs (rda_ex, rdb_ex, extended_ex, alu_func_ex, opb_sel_ex,
	                     alu_result_ex, Z);
	// EX/MEM Pipe
	ex_mem_pipe #(N) exmemp (clock, reset, wr_en_ex, wd_sel_ex, wm_en_ex,
							       rw_ex, alu_result_ex, rdb_ex, wr_en_mem, wd_sel_mem,
									 wm_en_mem, rw_mem, alu_result_mem, rdb_mem);
	// Memory stage
	mem_stage   #(N) mems (clock, wm_en_mem, alu_result_mem, rdb_mem, rd_mem);
	// MEM/WB Pipe
	mem_wb_pipe #(N) memwbp (clock, reset, wr_en_mem, wd_sel_mem, rw_mem,
                            alu_result_mem, rd_mem, wr_en_wb, wd_sel_wb,
									 rw_wb, alu_result_wb, rd_wb);
	// Write back stage
	wb_stage    #(N) wbs (wd_sel_wb, rd_wb, alu_result_wb, wd_wb);

endmodule // path
