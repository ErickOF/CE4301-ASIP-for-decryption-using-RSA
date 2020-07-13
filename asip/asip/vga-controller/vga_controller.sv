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
module vgaController #(parameter 		HACTIVE = 10'd640,
										HFP 	= 10'd16,
										HSYN    = 10'd96,
										HBP     = 10'd48,
										HSS     = HSYN + HBP,
										HSE     = HSYN + HBP + HACTIVE,
										HMAX    = HSYN + HBP + HACTIVE + HFP,
										
										VACTIVE = 10'd480,
										VFP     = 10'd11,
										VSYN    = 10'd2,
										VBP     = 10'd31,
										VSS     = VSYN + VBP,
										VSE     = VSYN + VBP + VACTIVE,
										VMAX    = VSYN + VBP + VACTIVE + VFP)
	(input logic clk, rst,
	output logic H_Sync, V_Sync, Blank_n,
	output logic [9:0] posx, posy); 	
	
	logic hRstF, vRstF, hDS, hDE, vDS, vDE = 0;
	
	logic [9:0] hCnt, vCnt;
	
	//	Pixel Counter
	counter#(10) HorizontalCounter(clk, (rst | hRstF), 1, hCnt);
	counter#(10) VerticalCounter(clk, (rst | hRstF & vRstF), hRstF, vCnt);
	
	//	Max Line Comparator
	comparator#(10) hMaxComparator(.a(hCnt), .b(HMAX - 1), .gte(hRstF));
	comparator#(10) vMaxComparator(.a(vCnt), .b(VMAX - 1), .gte(vRstF));
	
	//	Sync Signals (Low Active)
	comparator#(10) hSSComparator(.a(hCnt), .b(HSYN), .gte(H_Sync));
	comparator#(10) vSEComparator(.a(vCnt), .b(VSYN), .gte(V_Sync));
	
	//	Blank Comparator
	comparator#(10) hDisplayStartComparator(.a(hCnt), .b(HSS), .gte(hDS));
	comparator#(10) hDisplayEndComparator(.a(hCnt), .b(HSE), .lt(hDE));
	
	comparator#(10) vDisplayStartComparator(.a(vCnt), .b(VSS), .gte(vDS));
	comparator#(10) vDisplayEndComparator(.a(vCnt), .b(VSE), .lt(vDE));
	
	assign Blank_n = H_Sync & V_Sync;
	
   assign posx = hCnt;
   assign posy = vCnt;
	
endmodule