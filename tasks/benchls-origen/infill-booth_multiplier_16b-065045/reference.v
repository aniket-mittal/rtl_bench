module origen_065045 #(
    parameter WIDTH = 16
)(
    input wire clk,
    input wire reset,
    input wire start,
    input wire [WIDTH-1:0] multiplicand,
    input wire [WIDTH-1:0] multiplier,
    output reg [2*WIDTH-1:0] prod,
    output reg ready
);

    reg [WIDTH+1:0] pp;
    reg [$clog2(WIDTH/2):0] bit_cnt;
    reg [2*WIDTH:0] product;
    reg [WIDTH-1:0] x1, x2, x3;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            bit_cnt <= 0;
            product <= 0;
            ready <= 1'b1;
        end else if (ready && start) begin
            bit_cnt <= WIDTH/2;
            product <= {{WIDTH{1'b0}}, multiplier, 1'b0};
            x1 <= multiplicand;
            x2 <= multiplicand << 1;
            x3 <= (multiplicand << 1) + multiplicand;
            ready <= 1'b0;
        end else if (!ready) begin
            case (product[2:0])
                3'b001, 3'b010: pp = {x1[WIDTH-1], x1, 1'b0};
                3'b011: pp = {x2[WIDTH-1], x2, 1'b0};
                3'b100: pp = {~x2[WIDTH-1], ~x2, 1'b0} + 1;
                3'b101, 3'b110: pp = {~x1[WIDTH-1], ~x1, 1'b0} + 1;
                3'b111: pp = 0;
                default: pp = 0;
            endcase

            product <= {pp[WIDTH+1], pp + product[2*WIDTH:WIDTH-1], product[WIDTH-2:0]};
            bit_cnt <= bit_cnt - 1;

            if (bit_cnt == 1) begin
                ready <= 1'b1;
            end
        end
    end

    always @(posedge clk) begin
        if (ready && !start) begin
            prod <= product[2*WIDTH:1];
        end
    end

endmodule