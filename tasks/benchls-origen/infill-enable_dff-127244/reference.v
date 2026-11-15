module origen_127244 (
    input wire clk,
    input wire d,
    input wire en,
    input wire rst,
    output wire q,
    output wire qn
);

    wire mux_out;

    mux2 mux_inst (
        .i0(q),
        .i1(d),
        .s(en),
        .o(mux_out)
    );

    dff dff_inst (
        .d(mux_out),
        .clk(clk),
        .rst(rst),
        .en(1'b1),
        .q(q),
        .qn(qn)
    );

endmodule

module mux2 (
    input wire i0,
    input wire i1,
    input wire s,
    output wire o
);

    assign o = s ? i1 : i0;

endmodule

module dff (
    input wire d,
    input wire clk,
    input wire rst,
    input wire en,
    output reg q,
    output wire qn
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else if (en)
            q <= d;
    end

    assign qn = ~q;

endmodule