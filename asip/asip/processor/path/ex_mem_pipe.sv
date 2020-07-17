module ex_mem_pipe #(parameter N=32)
				        (input  logic         clock, reset,
						   input  logic         wr_en_ex, wd_sel_ex, wm_en_ex,
							input  logic [4:0]   rw_ex,
						   input  logic [N-1:0] alu_result_ex, rdb_ex,
						   output logic         wr_en_mem, wd_sel_mem, wm_en_mem,
							output logic [4:0]   rw_mem,
						   output logic [N-1:0] alu_result_mem, rdb_mem);

	// Var to save result
	logic wr_en_temp, wd_sel_temp, wm_en_temp;
	logic [4:0]   rw_temp;
	logic [N-1:0] alu_result_temp, rdb_temp;
	
	always_ff @(clock, reset) begin
		if (reset) begin
			wr_en_temp = 0;
			wd_sel_temp = 0;
			wm_en_temp = 0;
			rw_temp = 5'b0;
			alu_result_temp = 32'b0;
			rdb_temp = 32'b0;
		end
		else begin
			if (clock) begin
				wr_en_temp = wr_en_ex;
				wd_sel_temp = wd_sel_ex;
				wm_en_temp = wm_en_ex;
				rw_temp = rw_ex;
				alu_result_temp = alu_result_ex;
				rdb_temp = rdb_ex;
			end
			else begin
				wr_en_mem = wr_en_temp;
				wd_sel_mem = wd_sel_temp;
				wm_en_mem = wm_en_temp;
				rw_mem = rw_temp;
				alu_result_mem = alu_result_temp;
				rdb_mem = rdb_temp;
			end
		end
	end

endmodule // ex_mem_pipe
