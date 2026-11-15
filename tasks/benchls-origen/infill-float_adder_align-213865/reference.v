module origen_213865(
    input clk,
    input rst,
    input [32:0] x1,
    input [32:0] y1,
    input [8:0] base_ei,
    input enable,
    output [32:0] x2,
    output [8:0] base_eo,
    output valid
);

    reg [0:0] rX2_s;
    reg [31:0] rX2_significand;
    reg [8:0] _base_e;
    reg _valid;

    wire X1_s = x1[32];
    wire [31:0] X1_significand = x1[31:0];
    wire Y1_s = y1[32];
    wire [31:0] Y1_significand = y1[31:0];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            rX2_s <= 0;
            rX2_significand <= 0;
            _base_e <= 0;
            _valid <= 0;
        end
        else if (enable) begin
            if (Y1_significand == 0) begin
                rX2_s <= X1_s;
                rX2_significand <= X1_significand;
            end
            else if (X1_s == Y1_s) begin
                {rX2_s, rX2_significand} <= {X1_s, X1_significand} + {Y1_s, Y1_significand};
            end
            else begin
                {rX2_s, rX2_significand} <= {X1_s, X1_significand} - {Y1_s, Y1_significand};
            end
            _base_e <= base_ei;
            _valid <= 1'b1;
        end
        else begin
            _valid <= 1'b0;
        end
    end

    assign x2 = {rX2_s, rX2_significand};
    assign base_eo = _base_e;
    assign valid = _valid;

endmodule