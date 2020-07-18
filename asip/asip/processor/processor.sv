module processor #(parameter N=32)
						(input  logic         clock, reset,
						 input  logic [N-1:0] instruction, rd_mem,
						 output logic [N-1:0] pc, alu_result_mem, rdb_mem,
						 output logic         wm_en_mem);

	// Var to store results
	logic [2:0] opcode;
	logic [1:0] func, branch, ext_sel, forward_ra, forward_rb;
	logic       rb_sel, wr_en, opb_sel, alu_func, wd_sel, wm_en;
	logic [4:0]   ra_id, rb_id, rw_id, ra_ex, rb_ex, rw_ex, rw_mem, rw_wb;
	
	control_unit cu (opcode, func, branch, ext_sel, rb_sel, wr_en,
	                      opb_sel, alu_func, wd_sel, wm_en);

	path #(N) processor_path (clock, reset, forward_ra, forward_rb, branch,
	                          ext_sel, rb_sel, wr_en, opb_sel, alu_func,
									  wd_sel, wm_en, instruction, rd_mem, opcode,
									  func, ra_id, rb_id, rw_id, ra_ex, rb_ex, rw_ex,
									  rw_mem, rw_wb, pc, alu_result_mem, rdb_mem,
									  wm_en_mem);

	hazard_unit hu(ra_ex, rb_ex, rw_mem, rw_wb, forward_ra, forward_rb);
endmodule // processor
