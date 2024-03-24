module tb_design;
    reg             clk,
                    r;
    reg     [1:0]   PE;
    reg     [3:0]   D;
    wire    [3:0]   Q;

    device dut(.*);

    initial begin
        {clk, PE, D} = 0;
        r = 1'b1;
        $dumpfile("./vcd/device.vcd");
        $dumpvars(0, tb_design);
        #1000
        $finish;
    end

    always 
        #5 clk = ~clk;

    initial begin
        #7      r = 1'b0;
        #5      r = 1'b1;
        #351    r = 1'b0;
        #5      r = 1'b1;
    end

    always
        #11 D = D + 1;

    always 
        #174 PE = PE + 1;
endmodule