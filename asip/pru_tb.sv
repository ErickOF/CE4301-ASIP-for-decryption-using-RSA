module pru_tb;

  reg [8*200:0] my_string;
  reg [15:0] my_number;
  real my_time;
  
  pru pru();

  initial begin
    // Display string
    $display("Hello World!");
    my_string = "This is my string";
    $display("my_string is %0s", my_string);
    
    // Display decimal, binary, hex
    my_number = 8'h1a;
    $display("Decimal: %0d", my_number);
    $display("Decimal: %d", my_number);
    $display("Decimal: %3d", my_number);
    $display("Binary: %0b", my_number);
    $display("Binary: %b", my_number);
    $display("Binary: %3b", my_number);
    $display("Hex: %0h", my_number);
    $display("Hex: %h", my_number);
    $display("Hex: %3h", my_number);
    
    // Display hierarchical name
    $display("The current scope is %m");
    pru.print;
    
    // Display time
    my_time = 123;
    $display("Current time %0t, and dummy time %0t",
      $time, my_time);
    #11;
    $display("Current time %0t, and dummy time %0t",
      $time, my_time);
    
    // Long message display
    my_string = {"This is a very, yes, very, long and detailed ",
      "message about this simulation.\n We covered the following ",
      "today: "};
    $display("%0s %0s and %0d %0t", my_string, "string",
      my_number, $time);
  
  end

endmodule
