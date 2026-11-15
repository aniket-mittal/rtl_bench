module origen_103502 (
    input wire clk,
    input wire [31:0] src1,
    input wire [31:0] src2,
    input wire req,
    input wire [2:0] op,
    input wire nrst,
    output reg [31:0] res,
    output reg invalid,
    output reg ack
);

// Operation codes
localparam LE = 3'b000;
localparam LT = 3'b001;
localparam EQ = 3'b010;
localparam MIN = 3'b011;
localparam MAX = 3'b100;

// NaN representation
localparam NAN = 32'h7fc00000;

// Internal signals
reg src1_is_nan, src2_is_nan;
reg src1_is_snan, src2_is_snan;
reg src1_lt_src2, src1_eq_src2;

// Detect NaN and sNaN
always @(*) begin
    src1_is_nan = (src1[30:23] == 8'hFF) && (src1[22:0] != 0);
    src2_is_nan = (src2[30:23] == 8'hFF) && (src2[22:0] != 0);
    src1_is_snan = src1_is_nan && !src1[22];
    src2_is_snan = src2_is_nan && !src2[22];
end

// Comparison logic
always @(*) begin
    if (src1_is_nan || src2_is_nan) begin
        src1_lt_src2 = 0;
        src1_eq_src2 = 0;
    end else if (src1[31] != src2[31]) begin
        src1_lt_src2 = src1[31];
        src1_eq_src2 = (src1 == 0) && (src2 == 0);
    end else begin
        src1_lt_src2 = src1[31] ? (src2 < src1) : (src1 < src2);
        src1_eq_src2 = (src1 == src2);
    end
end

// Sequential logic
always @(posedge clk or negedge nrst) begin
    if (!nrst) begin
        res <= 0;
        invalid <= 0;
        ack <= 0;
    end else if (req) begin
        case (op)
            LE: begin
                res <= {31'b0, src1_lt_src2 || src1_eq_src2};
                invalid <= src1_is_nan || src2_is_nan;
                ack <= 1;
            end
            LT: begin
                res <= {31'b0, src1_lt_src2};
                invalid <= src1_is_nan || src2_is_nan;
                ack <= 1;
            end
            EQ: begin
                res <= {31'b0, src1_eq_src2};
                invalid <= src1_is_snan || src2_is_snan;
                ack <= 1;
            end
            MIN: begin
                if (src1_is_nan && src2_is_nan)
                    res <= NAN;
                else if (src1_is_nan)
                    res <= src2;
                else if (src2_is_nan)
                    res <= src1;
                else
                    res <= src1_lt_src2 ? src1 : src2;
                invalid <= src1_is_snan || src2_is_snan;
                ack <= 1;
            end
            MAX: begin
                if (src1_is_nan && src2_is_nan)
                    res <= NAN;
                else if (src1_is_nan)
                    res <= src2;
                else if (src2_is_nan)
                    res <= src1;
                else
                    res <= src1_lt_src2 ? src2 : src1;
                invalid <= src1_is_snan || src2_is_snan;
                ack <= 1;
            end
            default: begin
                res <= 0;
                invalid <= 0;
                ack <= 0;
            end
        endcase
    end else begin
        ack <= 0;
    end
end

endmodule