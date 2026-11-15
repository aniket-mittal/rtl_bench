module origen_177601
#(
    parameter red = 2'b00,
    parameter yellow = 2'b01,
    parameter green = 2'b10,
    parameter s0 = 3'b000,
    parameter s1 = 3'b001,
    parameter s2 = 3'b010,
    parameter s3 = 3'b011,
    parameter s4 = 3'b100,
    parameter Y_RDELAY = 2,
    parameter R_GDELAY = 2
)
(
    input x,
    input rst,
    input clk,
    output reg [1:0] highway,
    output reg [1:0] cross_road
);

    reg [2:0] pstate, nstate;

    always @(posedge clk or posedge rst) begin
        if (rst)
            pstate <= s0;
        else
            pstate <= nstate;
    end

    always @(*) begin
        case (pstate)
            s0: begin
                highway = green;
                cross_road = red;
            end
            s1: begin
                highway = yellow;
                cross_road = red;
            end
            s2: begin
                highway = red;
                cross_road = red;
            end
            s3: begin
                highway = red;
                cross_road = green;
            end
            s4: begin
                highway = red;
                cross_road = yellow;
            end
            default: begin
                highway = red;
                cross_road = red;
            end
        endcase
    end

    [MASKED]

endmodule