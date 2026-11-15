module origen_068789(
    input wire clk,
    input wire clr,
    output wire [3:0] Q
);

    wire [1:0] count;
    wire clr_n;

    assign clr_n = ~clr;

    upcount u1 (
        .clk(clk),
        .clr_n(clr_n),
        .Q(count)
    );

    dec2to4 d1 (
        .en(1'b1),
        .A(count),
        .Y(Q)
    );

endmodule

module upcount(
    input wire clk,
    input wire clr_n,
    output reg [1:0] Q
);

    always @(posedge clk or negedge clr_n) begin
        if (~clr_n)
            Q <= 2'b00;
        else
            Q <= Q + 1'b1;
    end

endmodule

module dec2to4(
    input wire en,
    input wire [1:0] A,
    output reg [3:0] Y
);

    always @(*) begin
        if (en) begin
            case (A)
                2'b00: Y = 4'b1000;
                2'b01: Y = 4'b0100;
                2'b10: Y = 4'b0010;
                2'b11: Y = 4'b0001;
            endcase
        end else begin
            Y = 4'b0000;
        end
    end

endmodule