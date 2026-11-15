module origen_099002 (
    input wire clk,
    input wire enable,
    input wire signed [23:0] Din,
    output reg signed [23:0] Dout
);

reg signed [23:0] Q1, Q2, Q3, Q4, Q5, Q6, Q7;

[MASKED]

endmodule

module testbench;

reg clk;
reg enable;
reg signed [23:0] Din;
wire signed [23:0] Dout;

filter uut (
    .clk(clk),
    .enable(enable),
    .Din(Din),
    .Dout(Dout)
);

initial begin
    clk = 0;
    forever #50 clk = ~clk;
end

integer i;
initial begin
    enable = 1;
    for (i = -20; i <= 19; i = i + 1) begin
        Din = i;
        #100;
    end
    enable = 0;
    #800;
    ;
end

initial begin
    $monitor("Time=%0t, Enable=%b, Din=%d, Dout=%d", $time, enable, Din, Dout);
end

endmodule