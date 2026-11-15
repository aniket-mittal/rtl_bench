module origen_069201(
    input [2:0] b,
    input [2:0] c,
    output reg [2:0] a
);
    reg [2:0] x, y;
    reg [31:0] t, m1;
    wire [3:0] pick;

    B b_inst(.x(x), .y(y));

    always @(*) begin
        if (b == 3'b000) begin
            x = c << 1;
            t = 32'h00009900;
            if (t[10:9] == 2'b11)
                m1 = t >> 2;
            else if (t[10:9] == 2'b10)
                m1 = t >> 1;
            else
                m1 = t;
        end else begin
            a = y & b;
        end
    end

    assign pick = t[11:8];
endmodule

module B(
    input [2:0] x,
    output reg [2:0] y
);
    wire [2:0] m;

    C c_inst(.x(x), .m(m));

    always @(*) begin
        if (x == 3'b100)
            y = x + 1;
        else
            y = 3'b000;
    end
endmodule

module C(
    input [2:0] x,
    output reg [2:0] m
);
    always @(*) begin
        if (x == 3'b100)
            m = x + 1;
        else
            m = 3'b000;
    end
endmodule