module vga_controller_tb ();

 

logic clk, rst, H_Sync, V_Sync, Blank_n;
logic [9:0] posx; 
logic [8:0] posy;

 

vga_controller DUT(clk, rst, H_Sync, V_Sync, Blank_n, posx, posy);

 

initial begin
    clk = 0;
end

 

always
begin
    #20000 clk = ~clk;
    #1 $display("H_Sync = %d, V_Sync = %d, Blank_n = %d, posx = %d, posy = %d", H_Sync, V_Sync, Blank_n, posx, posy);
end

 

endmodule 