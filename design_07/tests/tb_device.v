module tb_design;
  reg clk, r;
  reg [1:0] PE;
  reg [3:0] D;
  wire [3:0] Q;
  
  initial begin
    {clk, PE, D} = 0;
    r = 1'b1;
    $dumpfile("./vcd/device.vcd");
    $dumpvars(0, tb_design);
    #1000 $finish;
  end

  always #5 clk = ~clk;
  always #11 D = D + 1'b1;
  always #174 PE = PE + 1'b1;
  
  initial begin
    #7    r = 1'b0;
    #5    r = 1'b1;
    #351  r = 1'b0;
    #5    r = 1'b1;
  end
  device dut(
    .clk(clk),
    .r(r),
    .PE(PE),
    .D(D),
    .Q(Q)
  );
endmodule