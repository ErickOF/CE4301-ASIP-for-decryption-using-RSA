module id_ex_pipe #(parameter N=32)
				       (input  logic         clock, reset,
						  input  logic [N-1:0] rda_id, rdb_id, extended_id,
						  input  logic [4:0]   ra_id, rb_id, rw_id,
						  input  logic         wr_en_id, opb_selector_id, alu_func_id,
						  input  logic         wd_selector_id, wm_id,
						  output logic [N-1:0] rda_ex, rdb_ex, extended_ex,
						  output logic [4:0]   ra_ex, rb_ex, rw_ex,
						  output logic         wr_en_ex, opb_selector_ex, alu_func_ex,
						  output logic         wd_selector_ex, wm_ex);

	// Var to save result
	logic wr_en_temp, opb_selector_temp, alu_func_temp, wd_selector_temp;
	logic wm_temp;
	logic [4:0] ra_temp, rb_temp, rw_temp;
	logic [N-1:0] rda_temp, rdb_temp, extended_temp;

	always_ff @(clock) begin
		if (reset) begin
			wr_en_temp = 0;
		   opb_selector_temp = 0;
			alu_func_temp = 0;
			wd_selector_temp = 0;
			wm_temp = 0;
			ra_temp = 5'b0;
			rb_temp = 5'b0;
			rw_temp = 5'b0;
			rda_temp = 32'b0;
			rdb_temp = 32'b0;
			extended_temp = 32'b0;
		end
		else begin
			if (clock == 1'b0) begin
				wr_en_temp = wr_en_id;
				opb_selector_temp = opb_selector_id;
				alu_func_temp = alu_func_id;
				wd_selector_temp = wd_selector_id;
				wm_temp = wm_id;
				ra_temp = ra_id;
				rb_temp = rb_id;
				rw_temp = rw_id;
				rda_temp = rda_id;
				rdb_temp = rdb_id;
				extended_temp = extended_id;
			end
			else begin
				wr_en_ex = wr_en_temp;
				opb_selector_ex = opb_selector_temp;
				alu_func_ex = alu_func_temp;
				wd_selector_ex = wd_selector_temp;
				wm_ex = wm_temp;
				ra_ex = ra_temp;
				rb_ex = rb_temp;
				rw_ex = rw_temp;
				rda_ex = rda_temp;
				rdb_ex = rdb_temp;
				extended_ex = extended_temp;
			end
		end
	end

endmodule // id_ex_pipe
