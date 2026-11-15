// T Flip-Flop
module origen_045815(
    input clk,
    input t,
    input rst,
    output reg q
);
    [MASKED]
endmodule

// D Flip-Flop
module d_ff(
    input clk,
    input d,
    input rst,
    output reg q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

// 4-bit Counter
module counter_4bit(
    input clk,
    input en,
    input rst,
    output [3:0] q
);
    wire [3:0] t;
    assign t[0] = en;
    assign t[1] = en & q[0];
    assign t[2] = en & q[0] & q[1];
    assign t[3] = en & q[0] & q[1] & q[2];

    tff tff0(.clk(clk), .t(t[0]), .rst(rst), .q(q[0]));
    tff tff1(.clk(clk), .t(t[1]), .rst(rst), .q(q[1]));
    tff tff2(.clk(clk), .t(t[2]), .rst(rst), .q(q[2]));
    tff tff3(.clk(clk), .t(t[3]), .rst(rst), .q(q[3]));
endmodule

// Control Logic
module ControlLogic(
    input clk,
    input s,
    input z,
    input x,
    output reg t0,
    output reg t1,
    output reg t2
);
    wire t0_next, t1_next, t2_next;

    assign t0_next = (s | (t2 & ~z)) & ~t1;
    assign t1_next = (t0 & x) | (t1 & ~z);
    assign t2_next = (t1 & z) | (t2 & ~z);

    d_ff dff0(.clk(clk), .d(t0_next), .rst(1'b0), .q(t0));
    d_ff dff1(.clk(clk), .d(t1_next), .rst(1'b0), .q(t1));
    d_ff dff2(.clk(clk), .d(t2_next), .rst(1'b0), .q(t2));
endmodule

// Integrated Module
module intg(
    input clk,
    input s,
    input x,
    output [3:0] q,
    output g
);
    wire t0, t1, t2;
    wire z;

    assign z = &q;
    assign g = z & t2;

    counter_4bit counter(
        .clk(clk),
        .en(t1 | t2),
        .rst(s | (t2 & z)),
        .q(q)
    );

    ControlLogic control(
        .clk(clk),
        .s(s),
        .z(z),
        .x(x),
        .t0(t0),
        .t1(t1),
        .t2(t2)
    );
endmodule

// Testbench
module tb_g;
    reg clk, s, x;
    wire [3:0] q;
    wire g;

    intg dut(
        .clk(clk),
        .s(s),
        .x(x),
        .q(q),
        .g(g)
    );

    initial begin
        clk = 0;
        s = 1;
        x = 0;
        #10 s = 0;
        #10 x = 1;
        #100 x = 0;
        #100 ;
    end

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t s=%b x=%b q=%b g=%b", $time, s, x, q, g);
    end
endmodule