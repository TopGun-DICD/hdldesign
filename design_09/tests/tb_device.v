module tb_design;
    reg             clk,
                    r,
                    s,
                    D;
    wire    [3:0]   Q;

    device dut(.*);

    initial begin
        {clk, r, s, D} = 4'b0000;
        $dumpfile("./vcd/device.vcd");
        $dumpvars(0, tb_design);
        #250
        $finish;
    end

    always 
        #5 clk = ~clk;

    initial begin
        #7      r = 1'b1;
        #5      r = 1'b0;
        #196    r = 1'b1;
        #5      r = 1'b0;
    end

    initial begin
        #28     s = 1'b1;
        #5      s = 1'b0;
    end

    always
        #55 D = ~D;

endmodule