module origen_013585(
    input clk,
    output [3:0] qo
);

    wire q3, q2, q1, q0;
    wire j3, k3, j2, k2, j1, k1, j0, k0;

    assign qo = {q3, q2, q1, q0};

    // Combinational logic
    inv u1(.a(q3), .y(nq3));
    inv u2(.a(q2), .y(nq2));
    inv u3(.a(q1), .y(nq1));

    and u4(j1, q0, nq3);
    and u5(j2, q1, q0);
    and u6(j3, q2, q1, q0);

    // JK flip-flop connections
    assign j0 = 1'b1;
    assign k0 = 1'b1;
    assign k1 = q0;
    assign k2 = j2;
    assign k3 = q0;

    // JK flip-flops
    jk1 u11(.j(j0), .k(k0), .clk(clk), .q(q0));
    jk1 u12(.j(j1), .k(k1), .clk(clk), .q(q1));
    jk1 u13(.j(j2), .k(k2), .clk(clk), .q(q2));
    jk1 u14(.j(j3), .k(k3), .clk(clk), .q(q3));

endmodule

module jk1(
    input j,
    input k,
    input clk,
    output reg q
);
    initial q = 1'b1;

    always @(posedge clk) begin
        case ({j, k})
            2'b00: q <= q;
            2'b01: q <= 1'b0;
            2'b10: q <= 1'b1;
            2'b11: q <= ~q;
        endcase
    end
endmodule

module inv(
    input a,
    output y
);
    assign y = ~a;
endmodule