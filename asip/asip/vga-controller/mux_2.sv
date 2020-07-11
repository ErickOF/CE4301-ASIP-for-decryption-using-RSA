/**
 * Multiplexer 2-1 module.
 *
 * Parameters:
 *     N       - number of bits.
 *
 * Inputs:
 *     a       	  - first input.
 *     b       	  - second input.
 *     selection  - Selection Input.
 *
 * Outputs:
 *     result   - Selection Result.
 *
 */
module mux_2 #(parameter N=8) (
	input [N-1:0] a, b, 
	input  selection, 
	output [N-1:0] result);
	
	logic [N-1:0] y_o;
	always_comb
	case(selection)
		1'b0:   y_o = a ;
		1'b1:   y_o = b ;
		
		default: y_o = 8'bz;
	endcase
	
	assign result = y_o;
	 
endmodule
