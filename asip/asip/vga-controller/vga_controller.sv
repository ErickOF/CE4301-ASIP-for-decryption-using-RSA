/**
 * VGA Controller module.
 *
 * Parameters:
 *     N       - number of bits.
 *
 * Inputs:
 *     clk       - Operation Clock Signal.
 *     rst       - Reset Signal.
 *
 * Outputs:
 *     H_Sync
 *     V_Sync 
 *     Blank_n
 *     posx
 *     posy
 */
module vga_controller (input  logic       clk, rst,
                       output logic       h_sync, v_sync, blank_n,
							  output logic [9:0] posx, posy);

	// Constanst
	const logic [9:0] H_SYNC_A = 10'd95;
	const logic [9:0] H_BACK_PORCH_B = 10'd48; // 47.5
	const logic [9:0] H_DISPLAY_C = 10'd635;
	const logic [9:0] H_FRONT_PORCH_D = 10'd15;
	const logic [9:0] H_SYNC = H_SYNC_A;
	const logic [9:0] H_SCR = H_SYNC_A + H_BACK_PORCH_B;
	const logic [9:0] H_TOTAL = H_SYNC_A + H_BACK_PORCH_B + H_DISPLAY_C + H_FRONT_PORCH_D;

	const logic [9:0] V_SYNC_A = 10'd2;
	const logic [9:0] V_UP = 10'd33;
	const logic [9:0] V_DISPLAY = 10'd480;
	const logic [9:0] V_DOWN = 10'd10;
	const logic [9:0] V_SYNC = V_SYNC_A + 10'd1;
	const logic [9:0] V_SCR = V_UP + V_SYNC_A;
	const logic [9:0] V_TOTAL = V_SYNC_A + V_UP + V_DISPLAY + V_DOWN + 10'd1;

	// Vars
	logic rsth, rstv, rsth2, rstv2;
	logic h_sync_temp, v_sync_temp;
	logic [9:0] hcount;
	logic [9:0] vcount;

	always_comb begin
		rsth2 = rsth | rst;
		rstv2 = rstv | rst;
	end

	// Counters
	counter #(788) h_counter(clk, rsth2, hcount);
	counter #(525) v_counter(rsth, rstv2, vcount);

	comparator #(10) hmin_comparator(.value1(hcount), .value2(H_SCR), .lower(), .greater(h_sync_temp), .equal());
	comparator #(10) hmax_comparator(.value1(hcount), .value2(H_TOTAL), .lower(), .greater(), .equal(rsth)); 

	comparator #(10) vmin_comparator(.value1(vcount), .value2(V_SCR), .lower(), .greater(v_sync_temp), .equal());
	comparator #(10) vmax_comparator(.value1(vcount), .value2(V_TOTAL), .lower(), .greater(), .equal(rstv));

	assign h_sync  = h_sync_temp;
	assign v_sync  = v_sync_temp;
	assign blank_n = h_sync_temp & v_sync_temp;
	assign posx    = hcount > H_SCR ? (hcount - H_SCR) : 10'b0;
	assign posy    = vcount > V_SCR ? (vcount - V_SCR) : 10'b0;

endmodule // vga_controller
