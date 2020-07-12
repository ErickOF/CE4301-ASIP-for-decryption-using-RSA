/**
 * Control Unit module.
 *
 * Inputs:
 *     OpCode       - Instruction Operator Code.
 *     Function     - Instruction Function Code.
 *     Flags        - Flags input from ALU.
 *
 * Outputs:
 *     PC_Sel	 - 
 *     WR_En	 - 
 *     Ext_Sel	 - 
 *     Opb_Sel	 - 
 *     Alu_Func	 - 
 *     WD_Sel	 - 
 *     WM_En	 - 
 *
 */

module ControlUnit (
	input logic [2:0] OpCode, Flags,
	input logic [1:0] Funct,
	output logic [1:0] Ext_Sel,
	output logic PC_Sel, WR_En, Opb_Sel, Alu_Func, WD_Sel, WM_En);

/*
Controls:
controls[0] = PC_Sel;
controls[1] = WR_En;
controls[3:2] = Ext_Sel[1:0];
controls[4] = Opb_Sel;
controls[5] = Alu_Func;
controls[6] = WD_Sel;
controls[7] = WM_En;
 */
logic [7:0] controls;

always_comb begin

	/*Verificar que el opcode es cero, para así poder
	identificar cada instrucción por funct */
	if(OpCode == 0) begin

		casex(Funct)

			//Verificar si la instrucción es add
			2'd0: controls = 8'b01000000;

			//Verificar si la instrucción es and inm
			2'd1: controls = 8'b01001000;

			//Verificar si la instrucción es sub
			2'd2: controls = 8'b01000100;

			//Verificar si la instrucción es sub inm
			2'd3: controls = 8'b01001100;
			
			//Valor default
			default: controls = 8'b00000000;

		endcase

	else if(OpCode == 1)

		casex(Funct)

			//Verificar si la instrucción es CMP-sub
			2'd2: controls = 8'b00000100;

			//Verificar si la instrucción es CMP-sub inm
			2'd3: controls = 8'b00001100;
			
			//Valor default
			default: controls = 8'b00000000;

		endcase

	end 

	//Case para clasificar las instrucciones por su OpCode
	else begin

		casex(OpCode)

			//Verificar si la instrucción es LDR
			3'd2: controls = 8'b01011010;

			//Verificar si la instrucción es STR
			3'd3: controls = 8'b00011001;

			//Verificar si la instrucción es JEQ Label
			3'd4: begin
				//si Z = 1
				if(Flgs == 1) begin
					controls = 8'b10100000;
				end else begin
					controls = 8'b00100000;
				end
			end

			//Verificar si la instrucción es JNE Label
			3'd5: begin
				//si Z = 1
				if(Flgs == 1) begin
					controls = 8'b00100000;
				end else begin
					controls = 8'b10100000;
				end
			end

			//Verificar si la instrucción es JMP Label
			3'd6: controls = 8'b10100000;

			//Verificar si la instrucción es Nop
			3'd7: controls = 8'b00000000;

			//Valor default
			default: controls = 8'b00000000;

		endcase 
	end
end

assign {PC_Sel, WR_En, Ext_Sel, Opb_Sel, Alu_Func, WD_Sel, WM_En} = controls;

endmodule