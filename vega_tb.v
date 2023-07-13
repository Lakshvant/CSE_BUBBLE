module instruction_vega_testbench();

reg clk, reset;
reg[7:0] new_pc;
cse_bubble cse1(clk,reset);
initial begin
  clk = 0;
  #5
  reset=0;
end

always #25 clk = ~clk;

initial begin
  $dumpfile("dump.vcd"); $dumpvars;
   $display("%d",0);
   $display("%d",1);
  $display("%d",2);
  $display("%d",3);
   $display("%d",4);
    $display("%d",5);
     $display("%d",6);
      $display("%d",7);
       $display("%d",8);
        $display("%d",9);
         $display("%d",10);
         $display("%d",11);
  #2000
  
  $finish;
end

endmodule