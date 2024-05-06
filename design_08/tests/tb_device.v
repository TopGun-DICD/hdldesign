module tb_design;
    reg         clk,r,EC;
    wire [3:0]  Q;

    device dut(.clk(clk), .r(r), .EC(EC), .Q(Q));

    initial begin
        {clk, r, EC} = 0;
        r = 1'b1;
        $dumpfile("./vcd/device.vcd");
        $dumpvars(0, tb_design);
        #250
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
        #195 EC = ~EC;
endmodule