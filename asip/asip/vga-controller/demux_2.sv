/**
 * Demultiplexer 1-2 module.
 *
 * Parameters:
 *     N       - number of bits.
 *
 * Inputs:
 *     data       - Data Input.
 *     selection  - Selection Input.
 *
 * Outputs:
 *     result1   - Selection Result.
 *     result2   - Selection Result.
 *
 */
module demux_2 #(parameter N=8) (
	input [N-1:0] data, 
	input  selection, 
	output [N-1:0] result1,result2);
	
	
	
	always @(selection or data)
	
	
	begin
        case (selection)  
            1'b0 : begin
                        result1 = data;
                        result2 = 0;
                       
                      end
            1'b1 : begin
                        result1 = 0;
                        result2 = data;
                      end
            default : begin
								result1 = 0;
                        result2 = 0;
                      end
          
        endcase
    end
	 
endmodule
