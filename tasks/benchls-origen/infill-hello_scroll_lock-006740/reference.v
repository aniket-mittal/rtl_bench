module origen_006740(
    input wire clk,
    input wire rst_n,
    output reg lock,
    output reg [6:0] char
);

    localparam [2:0] H = 3'd0, E = 3'd1, L0 = 3'd2, L1 = 3'd3, O = 3'd4, STOP = 3'd5;
    reg [2:0] state, next_state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) state <= H;
        else state <= next_state;
    end

    always @(*) begin
        case (state)
            H: next_state = E;
            E: next_state = L0;
            L0: next_state = L1;
            L1: next_state = O;
            O: next_state = STOP;
            STOP: next_state = STOP;
            default: next_state = H;
        endcase
    end

    always @(*) begin
        case (state)
            H: begin char = 7'b0001001; lock = 1'b0; end
            E: begin char = 7'b0000110; lock = 1'b0; end
            L0: begin char = 7'b1000111; lock = 1'b0; end
            L1: begin char = 7'b1000111; lock = 1'b0; end
            O: begin char = 7'b1000000; lock = 1'b0; end
            STOP: begin char = 7'b1111111; lock = 1'b1; end
            default: begin char = 7'b1111111; lock = 1'b0; end
        endcase
    end

endmodule

module tickerShift(
    input wire clk,
    input wire rst_n,
    input wire lock,
    input wire [6:0] in,
    output reg [6:0] out0,
    output reg [6:0] out1,
    output reg [6:0] out2,
    output reg [6:0] out3,
    output reg [6:0] out4
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out0 <= 7'b1111111;
            out1 <= 7'b1111111;
            out2 <= 7'b1111111;
            out3 <= 7'b1111111;
            out4 <= 7'b1111111;
        end else begin
            out4 <= out3;
            out3 <= out2;
            out2 <= out1;
            out1 <= out0;
            out0 <= lock ? out4 : in;
        end
    end

endmodule

module main(
    input wire [3:2] KEY,
    output wire [6:0] HEX0,
    output wire [6:0] HEX1,
    output wire [6:0] HEX2,
    output wire [6:0] HEX3,
    output wire [6:0] LEDG,
    output wire LEDR
);

    wire clk, rst_n;
    wire lock;
    wire [6:0] char;
    wire [6:0] out0, out1, out2, out3, out4;

    assign clk = ~KEY[2];
    assign rst_n = KEY[3];

    loaderFSM fsm(
        .clk(clk),
        .rst_n(rst_n),
        .lock(lock),
        .char(char)
    );

    tickerShift shifter(
        .clk(clk),
        .rst_n(rst_n),
        .lock(lock),
        .in(char),
        .out0(out0),
        .out1(out1),
        .out2(out2),
        .out3(out3),
        .out4(out4)
    );

    assign HEX0 = out0;
    assign HEX1 = out1;
    assign HEX2 = out2;
    assign HEX3 = out3;
    assign LEDG = out4;
    assign LEDR = lock;

endmodule