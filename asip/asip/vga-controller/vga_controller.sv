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
 *
 */
module vga_controller #(parameter 		HACTIVE = 10'd640,
									   HFP 	  = 10'd16,
										HSYN    = 10'd96,
										HBP     = 10'd48,
										HSS     = HSYN + HBP,
										HSE     = HSYN + HBP + HACTIVE,
										HMAX    = HSYN + HBP + HACTIVE + HFP,
										
										VACTIVE = 10'd480,
										VFP     = 10'd10,
										VSYN    = 10'd2,
										VBP     = 10'd33,
										VSS     = VSYN + VBP,
										VSE     = VSYN + VBP + VACTIVE,
										VMAX    = VSYN + VBP + VACTIVE + VFP)
	                    (input  logic clk, rst,
	                     output logic H_Sync, V_Sync, Blank_n,
	                     output logic [9:0] posx, 
	                     output logic [8:0] posy); 	
	
	logic hRstF, vRstF, hDS, hDE, vDS, vDE = 0;
	
	logic [9:0] hCnt;
	logic [8:0]	vCnt;
	
	//	Pixel Counter
	counter#(10) h_counter(clk, (rst | hRstF), hCnt);
	counter#(9)  v_counter(hRstF, (rst | vRstF), vCnt);
	
	comparator#(10) h_comparator(.a(hCnt), .b(HMAX), .c(HSYN), .d(HSS), .e(HSE),
	                             .gte(hRstF), .gte2(H_Sync), .gte3(hDS), .lt(hDE));
	comparator#(9)  v_comparator(.a(vCnt), .b(VMAX), .c(VSYN), .d(HSS), .e(VSE),
	                             .gte(vRstF), .gte2(V_Sync), .gte3(vDS), .lt(vDE));
	
	// Assign Blank_n = H_Sync & V_Sync;
	assign Blank_n = hDS & hDE & vDS & vDE;
	
   assign posx = hCnt;
   assign posy = vCnt;
	
endmodule
