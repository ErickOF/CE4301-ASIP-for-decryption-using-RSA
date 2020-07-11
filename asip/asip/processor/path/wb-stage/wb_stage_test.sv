module wb_stage_test();
	logic        wd_selector;
	logic [31:0] read_data, alu_result, selected_data;
	
	wb_stage #(32) DUT(wd_selector, read_data, alu_result, selected_data);
	
	initial begin
		#10;

		#10 wd_selector=0; read_data=32'h00AABBCC; alu_result=32'h00001122;
		$display("wd_select=%b, rd=%h, alu_result=%h, selected_data=%h\n", wd_selector, read_data, alu_result, selected_data);

		#10 wd_selector=0; read_data=32'h00111111; alu_result=32'h00112222;
		$display("wd_select=%b, rd=%h, alu_result=%h, selected_data=%h\n", wd_selector, read_data, alu_result, selected_data);

		#10 wd_selector=1; read_data=32'h00AABBCC; alu_result=32'h00001122;
		$display("wd_select=%b, rd=%h, alu_result=%h, selected_data=%h\n", wd_selector, read_data, alu_result, selected_data);

		#10 wd_selector=1; read_data=32'h00111111; alu_result=32'h00112222;
		$display("wd_select=%b, rd=%h, alu_result=%h, selected_data=%h\n", wd_selector, read_data, alu_result, selected_data);
	end

endmodule // wb_stage_test
