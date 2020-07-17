module mem_wb_pipe #(parameter N=32)
				        (input  logic         clock, reset,
						   input  logic         wr_en_mem, wd_sel_mem,
							input  logic [4:0]   rw_mem,
						   input  logic [N-1:0] alu_result_mem, rd_mem,
						   output logic         wr_en_wb, wd_sel_wb,
							output logic [4:0]   rw_wb,
						   output logic [N-1:0] alu_result_wb, rd_wb);

	// Var to save result
	logic wr_en_temp, wd_sel_temp;
	logic [4:0]   rw_temp;
	logic [N-1:0] alu_result_temp, rd_temp;
	
	always_ff @(clock, reset) begin
		if (reset) begin
			wr_en_temp = 0;
			wd_sel_temp = 0;
			rw_temp = 5'b0;
			alu_result_temp = 32'b0;
			rd_temp = 32'b0;
		end
		else begin
			if (clock == 1'b0) begin
				wr_en_temp = wr_en_mem;
				wd_sel_temp = wd_sel_mem;
				rw_temp = rw_mem;
				alu_result_temp = alu_result_mem;
				rd_temp = rd_mem;
			end
			else begin
				wr_en_wb = wr_en_temp;
				wd_sel_wb = wd_sel_temp;
				rw_wb = rw_temp;
				alu_result_wb = alu_result_temp;
				rd_wb = rd_temp;
			end
		end
	end

endmodule // mem_wb_pipe
