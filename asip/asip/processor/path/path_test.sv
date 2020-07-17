module path_test();
	logic         clock, reset;
	logic [1:0]   branch, ext_sel, forward_ra, forward_rb;
	logic         rb_sel, wr_en, opb_sel;
	logic         alu_func, wd_sel, wm_en;
	logic [31:0]  instruction, pc;
	logic [2:0]   opcode;
	logic [1:0]   func;
	logic [4:0]   ra_id, rb_id, rw_id, ra_ex, rb_ex, rw_ex, rw_mem, rw_wb;
	
	path #(32) DUT(clock, reset, branch, ext_sel, rb_sel, wr_en, opb_sel,
	               alu_func, wd_sel, wm_en, instruction,
					   // Outputs
					   opcode, func, ra_id, rb_id, rw_id, ra_ex, rb_ex, rw_ex,
					   rw_mem, rw_wb, pc);

	initial begin
		#10000 reset=0; clock=0;
		#10000 reset=1; clock=1; forward_ra=2'b00; forward_rb=2'b00;
		
		// IF: ADD R0, R1, R2
		#10000 reset=0; clock=1; instruction=32'h00088000; branch=2'b11; ext_sel=2'b11; rb_sel=0; wr_en=0; opb_sel=0; alu_func=0; wd_sel=0; wm_en=0;		
		#10000 clock=0;

		// IF: ADD R1, R2, 10
		// ID: ADD R0, R1, R2
		#10000 clock=1; instruction=32'h01100029; branch=2'b11; ext_sel=2'b11; rb_sel=0; wr_en=1; opb_sel=0; alu_func=0; wd_sel=0; wm_en=0;
		#10000 clock=0;
		
		// IF: SUB R2, R3, R4
		// ID: ADD R1, R2, 10
		// EX: ADD R1, R2, 10
		#10000 clock=1; instruction=32'h02190002; branch=2'b11; ext_sel=2'b00; rb_sel=0; wr_en=1; opb_sel=1; alu_func=0; wd_sel=0; wm_en=0;
		#10000 clock=0;
		
		// IF: SUB R3, R4, 10
		// ID: SUB R2, R3, R4
		// EX: ADD R1, R2, 10
		// ME: ADD R0, R1, R2
		#10000 clock=1; instruction=32'h0320002B; branch=2'b11; ext_sel=2'b00; rb_sel=0; wr_en=1; opb_sel=0; alu_func=1; wd_sel=0; wm_en=0;
		#10000 clock=0;
		
		// IF: LDR R5, 32 (R6)
		// ID: SUB R3, R4, 10
		// EX: SUB R2, R3, R4
		// ME: ADD R1, R2, 10
		// WB: ADD R0, R1, R2
		#10000 clock=1; instruction=32'h45300020; branch=2'b11; ext_sel=2'b00; rb_sel=0; wr_en=1; opb_sel=1; alu_func=1; wd_sel=0; wm_en=0;
		#10000 clock=0;
		
		// ID: LDR R5, 32 (R6)
		// EX: SUB R3, R4, 10
		// ME: SUB R2, R3, R4
		// WB: ADD R1, R2, 10
		#10000 clock=1; branch=2'b11; ext_sel=2'b01; rb_sel=0; wr_en=1; opb_sel=1; alu_func=0; wd_sel=1; wm_en=0;
		#10000 clock=0;
		
		// EX: LDR R5, 32 (R6)
		// ME: SUB R3, R4, 10
		// WB: SUB R2, R3, R4
		#10000 clock=1;
		#10000 clock=0;
		
		// ME: LDR R5, 32 (R6)
		// WB: SUB R3, R4, 10
		#10000 clock=1;
		#10000 clock=0;
		
		// WB: LDR R5, 32 (R6)
		#10000 clock=1;
		#10000 clock=0;
	end
endmodule // path_test
