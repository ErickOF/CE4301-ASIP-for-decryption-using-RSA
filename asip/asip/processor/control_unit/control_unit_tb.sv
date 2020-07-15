module control_unit_tb (); 


	logic [2:0] OpCode; 
    logic [1:0] Funct, Branch, Ext_Sel;
	logic WR_En, Opb_Sel, Alu_Func, WD_Sel, WM_En;

	control_unit ctrl(OpCode, Funct, Branch, Ext_Sel, WR_En, Opb_Sel, Alu_Func, WD_Sel, WM_En);

	initial begin

//####################Opcode=0; Funct=!0#####################################

		/*
		Comprobar funciona la salida correspondientes
		la instruccion add 
		*/
		OpCode = 3'b000; Funct = 2'b00; #10;
		assert(Branch == 2'b11 & Ext_Sel == 2'b00 & WR_En == 1 & Opb_Sel == 0 & Alu_Func == 0 & 
        WD_Sel == 0 & WM_En == 0) 
            else
			 $error("Error al cargar la salida para la instruccion add");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion add imn
		*/
		OpCode = 3'b000; Funct = 2'b01; #10;
		assert(Branch == 2'b11 & Ext_Sel == 2'b01 & WR_En == 1 & Opb_Sel == 1 & Alu_Func == 0 & 
        WD_Sel == 0 & WM_En == 0) 
            else
			 $error("Error al cargar la salida para la instruccion add imn");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion sub 
		*/
		OpCode = 3'b000; Funct = 2'b10; #10;
		assert(Branch == 2'b11 & Ext_Sel == 2'b00 & WR_En == 1 & Opb_Sel == 0 & Alu_Func == 1 & 
        WD_Sel == 0 & WM_En == 0) 
            else
			 $error("Error al cargar la salida para la instruccion sub");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion sub imn
		*/
		OpCode = 3'b000; Funct = 2'b11; #10;
		assert(Branch == 2'b11 & Ext_Sel == 2'b01 & WR_En == 1 & Opb_Sel == 1 & Alu_Func == 1 & 
        WD_Sel == 0 & WM_En == 0) 
            else
			 $error("Error al cargar la salida para la instruccion sub imn");

		/*
		Comprobar funciona la salida default
		*/
		OpCode = 3'b000; Funct = 2'b00; #10;
		assert(Branch == 2'b11 & Ext_Sel == 2'b00 & WR_En == 1 & Opb_Sel == 0 & Alu_Func == 0 & 
        WD_Sel == 0 & WM_En == 0) 
            else
			 $error("Error al cargar la salida para la instruccion default");
			 

//###########################################################################
//####################Opcode=1; Funct=!0#####################################

		/*
		Comprobar funciona la salida correspondientes
		la instruccion CMP-Sub 
		*/
		OpCode = 3'b001; Funct = 2'b10; #10;
		assert(Branch == 2'b11 & Ext_Sel == 2'b00 & WR_En == 0 & Opb_Sel == 0 & Alu_Func == 1 & 
        WD_Sel == 0 & WM_En == 0) 
            else
			 $error("Error al cargar la salida para la instruccion add");


		/*
		Comprobar funciona la salida correspondientes
		la instruccion CMP-Sub imn
		*/
		OpCode = 3'b001; Funct = 2'b11; #10;
		assert(Branch == 2'b11 & Ext_Sel == 2'b01 & WR_En == 0 & Opb_Sel == 1 & Alu_Func == 1 & 
        WD_Sel == 0 & WM_En == 0) 
            else
			 $error("Error al cargar la salida para la instruccion add imn");

		/*
		Comprobar funciona la salida default
		*/
		OpCode = 3'b001; Funct = 2'b01; #10;
		assert(Branch == 2'b00 & Ext_Sel == 2'b00 & WR_En == 0 & Opb_Sel == 0 & Alu_Func == 0 & 
        WD_Sel == 0 & WM_En == 0) 
            else
			 $error("Error al cargar la salida para la instruccion default");
			 

//###########################################################################

//#########################Opcode != 0; Funct = X############################

		/*
		Comprobar funciona la salida correspondientes
		la instruccion LDR
		*/
		OpCode = 3'b010; Funct = 2'b00; #10;
		assert(Branch == 2'b11 & Ext_Sel == 2'b10 & WR_En == 1 & Opb_Sel == 1 & Alu_Func == 0 & 
        WD_Sel == 1 & WM_En == 0) 
            else
			 $error("Error al cargar la salida para la instruccion add imn");

		/*
		Comprobar funciona la salida correspondientes
		la instruccion STR
		*/
		OpCode = 3'b011; Funct = 2'b00; #10;
		assert(Branch == 2'b11 & Ext_Sel == 2'b10 & WR_En == 0 & Opb_Sel == 1 & Alu_Func == 0 & 
        WD_Sel == 0 & WM_En == 1) 
            else
			 $error("Error al cargar la salida para la instruccion add imn");

		/*
		Comprobar funciona la salida correspondientes
		la instruccion JEQ Label
		*/
		OpCode = 3'b100; Funct = 2'b00; #10;
		assert(Branch == 2'b00 & Ext_Sel == 2'b11 & WR_En == 0 & Opb_Sel == 0 & Alu_Func == 0 & 
        WD_Sel == 0 & WM_En == 0) 
            else
			 $error("Error al cargar la salida para la instruccion add imn");

		/*
		Comprobar funciona la salida correspondientes
		la instruccion JNE Label
		*/
		OpCode = 3'b101; Funct = 2'b00; #10;
		assert(Branch == 2'b01 & Ext_Sel == 2'b11 & WR_En == 0 & Opb_Sel == 0 & Alu_Func == 0 & 
        WD_Sel == 0 & WM_En == 0) 
            else
			 $error("Error al cargar la salida para la instruccion add imn");

		/*
		Comprobar funciona la salida correspondientes
		la instruccion add JMP Label
		*/
		OpCode = 3'b110; Funct = 2'b00; #10;
		assert(Branch == 2'b10 & Ext_Sel == 2'b11 & WR_En == 0 & Opb_Sel == 0 & Alu_Func == 0 & 
        WD_Sel == 0 & WM_En == 0) 
            else
			 $error("Error al cargar la salida para la instruccion add imn");
    
		/*
		Comprobar funciona la salida correspondientes
		la instruccion NOP
		*/
		OpCode = 3'b111; Funct = 2'b00; #10;
		assert(Branch == 2'b11 & Ext_Sel == 2'b11 & WR_En == 0 & Opb_Sel == 0 & Alu_Func == 0 & 
        WD_Sel == 0 & WM_En == 0) 
            else
			 $error("Error al cargar la salida para la instruccion add imn");

    	/*
		Comprobar funciona la salida default
		*/
		OpCode = 3'b010; Funct = 2'b00; #10;
		assert(Branch == 2'b11 & Ext_Sel == 2'b10 & WR_En == 1 & Opb_Sel == 1 & Alu_Func == 0 & 
        WD_Sel == 1 & WM_En == 0) 
            else
			 $error("Error al cargar la salida para la instruccion default");

	end

endmodule