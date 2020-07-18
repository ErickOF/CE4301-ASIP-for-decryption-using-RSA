module if_id_pipe #(parameter N=32)
				       (input  logic         clock, reset,
						  input  logic [N-1:0] instr_if,
						  output logic [N-1:0] instr_id);

	// Var to save result
	logic [N-1:0] instr_temp;
	
	always_ff @(clock, reset) begin
		if (reset == 1'b1) begin
			instr_temp = 0;
		end
		else begin
			if (clock == 1'b0) begin
				instr_temp <= instr_if;
			end
			else begin
				instr_id <= instr_temp;
			end
		end
	end

endmodule // if_id_pipe
