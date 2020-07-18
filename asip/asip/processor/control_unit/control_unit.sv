/**
 * Control Unit module.
 *
 * Inputs:
 *     opcode   - operation code.
 *     func     - ALU function to be executed.
 *
 * Outputs:
 *     branch	 - indicates which type of branch must be executed.
 *     ext_sel	 - select zero extension type to be executed.
 *     wr_en	 - signal to write in the registers file.
 *     opb_sel	 - signal to select the second operad of the ALU.
 *     alu_func - operation to be executed by the ALU.
 *     wd_sel	 - signal to select the data to be written in registers file.
 *     wm_en	 - signal to write in memory.
 */

module control_unit (input  logic [2:0] opcode,
                     input  logic [1:0] funct,
							output logic [1:0] branch, ext_sel,
							output logic       wr_en, opb_sel, alu_func, wd_sel, wm_en);

	/*
	Controls:
	controls[8:7] = branch;
	controls[6:5] = ext_sel;
	controls[4]   = wr_en;
	controls[3]   = opb_sel;
	controls[2]   = alu_func;
	controls[1]   = wd_sel;
	controls[0]   = wm_en;
	*/
	logic [8:0] controls;

	always_comb begin
		// Check if the opcode is for a arithmetic operation
		if(opcode == 3'b000) begin
			case(funct)
				// Check if the instruction is an add
				// branch=11; ext_sel=11; we_en=1; opb_sel=0; alu_func=0;
				// wd_sel=0; wm_en=0
				2'b00: controls = 9'b111110000;

				// Check if the instruction is an add imm
				// branch=11; ext_sel=00; we_en=1; opb_sel=1; alu_func=0;
				// wd_sel=0; wm_en=0
				2'b01: controls = 9'b110011000;

				// Check if the instruction is a substraction
				// branch=11; ext_sel=11; we_en=1; opb_sel=0; alu_func=1;
				// wd_sel=0; wm_en=0
				2'b10: controls = 9'b111110100;

				// Check if the instruction is a substraction imm
				// branch=11; ext_sel=00; we_en=1; opb_sel=1; alu_func=1;
				// wd_sel=0; wm_en=0
				2'b11: controls = 9'b110011100;

				// Default value
				default: controls = 9'b111110000;
			endcase
		end

		// Check if the instruction is a CMP
		else if(opcode == 3'b001) begin
			case(funct)
				// Check if the instruction is a CMP between two registers
				// branch=11; ext_sel=11; we_en=0; opb_sel=0; alu_func=1;
				// wd_sel=0; wm_en=0
				2'd2: controls = 9'b111100100;

				// Check if the instruction is a CMP between a register and a
				// constants
				// branch=11; ext_sel=00; we_en=0; opb_sel=1; alu_func=1;
				// wd_sel=0; wm_en=0
				2'd3: controls = 9'b110001100;

				// Default value
				default: controls = 9'b000000000;
			endcase
		end

		// Other instructions (they don't use func)
		else begin
			case(opcode)
				// Check if the instruction is a LDR
				// branch=11; ext_sel=01; we_en=1; opb_sel=1; alu_func=0;
				// wd_sel=1; wm_en=0
				3'b010: controls = 9'b110111010;

				// Check if the instruction is a STR
				// branch=11; ext_sel=01; we_en=0; opb_sel=1; alu_func=0;
				// wd_sel=0; wm_en=1
				3'b011: controls = 9'b110101001;

				// Check if the instruction is a JEQ Label
				// branch=00; ext_sel=10; we_en=0; opb_sel=0; alu_func=0;
				// wd_sel=0; wm_en=0
				3'b100: controls = 9'b001000000;

				// Check if the instruction is a JNE Label
				// branch=01; ext_sel=10; we_en=0; opb_sel=0; alu_func=0;
				// wd_sel=0; wm_en=0
				3'b101: controls = 9'b011000000;

				// Check if the instruction is a JMP Label
				// branch=10; ext_sel=10; we_en=0; opb_sel=0; alu_func=0;
				// wd_sel=0; wm_en=0
				3'b110: controls = 9'b101000000;

				// Check if the instruction is a Nop
				// branch=11; ext_sel=10; we_en=0; opb_sel=0; alu_func=0;
				// wd_sel=0; wm_en=0
				3'b111: controls = 9'b111000000;

				// Default value
				default: controls = 9'b000000000;
			endcase 
		end
	end

	// Assign signals
	assign {branch, ext_sel, wr_en, opb_sel, alu_func, wd_sel, wm_en} = controls;

endmodule // control_unit
