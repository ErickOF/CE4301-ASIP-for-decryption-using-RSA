/**
 * Control Unit module.
 *
 * Inputs:
 *     OpCode       - Instruction Operator Code.
 *     Function     - Instruction Function Code.
 *
 * Outputs:
 *     Branch	 -  
 *     Ext_Sel	 - 
 *     WR_En	 -
 *     Opb_Sel	 - 
 *     Alu_Func	 - 
 *     WD_Sel	 - 
 *     WM_En	 - 
 *
 */

module control_unit (
	input logic [2:0] OpCode,
	input logic [1:0] Funct,
	output logic [1:0] Branch, Ext_Sel,
	output logic WR_En, Opb_Sel, Alu_Func, WD_Sel, WM_En);

/*
Controls:
controls[1:0] = Branch;
controls[3:2] = Ext_Sel[1:0];
controls[4] = WR_En;
controls[5] =Opb_Sel;
controls[6] = Alu_Func;
controls[7] = WD_Sel;
controls[8] = WM_En;
 */
logic [8:0] controls;

always_comb begin

	/*Verificar que el opcode es cero, para así poder
	identificar cada instrucción por funct */
	if(OpCode == 0) begin

		casex(Funct)

			//Verificar si la instrucción es add
			2'd0: controls = 9'b110010000;

			//Verificar si la instrucción es add inm
			2'd1: controls = 9'b110111000;

			//Verificar si la instrucción es sub
			2'd2: controls = 9'b110010100;

			//Verificar si la instrucción es sub inm
			2'd3: controls = 9'b110111100;
			
			//Valor default
			default: controls = 9'b110010000;

		endcase
	end	

	else if(OpCode == 1) begin

		casex(Funct)

			//Verificar si la instrucción es CMP-sub
			2'd2: controls = 9'b110000100;

			//Verificar si la instrucción es CMP-sub inm
			2'd3: controls = 9'b110101100;
			
			//Valor default
			default: controls = 9'b000000000;

		endcase

	end 

	//Case para clasificar las instrucciones por su OpCode
	else begin

		casex(OpCode)

			//Verificar si la instrucción es LDR
			3'd2: controls = 9'b111011010;

			//Verificar si la instrucción es STR
			3'd3: controls = 9'b111001001;

			//Verificar si la instrucción es JEQ Label
			3'd4: controls = 9'b001100000;

			//Verificar si la instrucción es JNE Label
			3'd5: controls = 9'b011100000;

			//Verificar si la instrucción es JMP Label
			3'd6: controls = 9'b101100000;

			//Verificar si la instrucción es Nop
			3'd7: controls = 9'b111100000;

			//Valor default
			default: controls = 9'b000000000;

		endcase 
	end
end

assign {Branch, Ext_Sel, WR_En, Opb_Sel, Alu_Func, WD_Sel, WM_En} = controls;

endmodule