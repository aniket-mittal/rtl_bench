module origen_066308(
    input wire clk,
    input wire rst,
    output wire [3:0] Q
);

    wire q0Bar, q1Bar, q2Bar, q3Bar;

    DFlipFlop ff0 (
        .clk(clk),
        .rst(rst),
        .D(q0Bar),
        .Q(Q[0]),
        .Qbar(q0Bar)
    );

    DFlipFlop ff1 (
        .clk(q0Bar),
        .rst(rst),
        .D(q1Bar),
        .Q(Q[1]),
        .Qbar(q1Bar)
    );

    DFlipFlop ff2 (
        .clk(q1Bar),
        .rst(rst),
        .D(q2Bar),
        .Q(Q[2]),
        .Qbar(q2Bar)
    );

    DFlipFlop ff3 (
        .clk(q2Bar),
        .rst(rst),
        .D(q3Bar),
        .Q(Q[3]),
        .Qbar(q3Bar)
    );

endmodule

module DFlipFlop(
    input wire clk,
    input wire rst,
    input wire D,
    output reg Q,
    output wire Qbar
);

    always @(posedge clk or negedge rst) begin
        if (!rst)
            Q <= 1'b0;
        else
            Q <= D;
    end

    assign Qbar = ~Q;

endmodule