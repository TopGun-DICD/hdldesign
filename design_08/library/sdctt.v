module sdctt(clk, d, s, Q, nQ);
    input       clk, d, s;
    output reg  Q, nQ;

    always@(negedge clk, posedge s)
        if(s == 1'b1) begin
            q <= 1'b1;
            nq <= 1'b0;
        end
        else begin
            q <= d;
            nq <= ~d;
        end
endmodule