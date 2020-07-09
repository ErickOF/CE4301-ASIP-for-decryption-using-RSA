module instruction_mem(input  logic [31:0] a,
				           output logic [31:0] rd);

logic [31:0] RAM[22:0];

initial begin
    $readmemh("./instructions.txt", RAM);
end

assign rd = RAM[a[31:0]];

endmodule // instruction_mem