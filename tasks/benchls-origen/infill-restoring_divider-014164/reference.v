module origen_014164(
    input div_clk,
    input resetn,
    input div,
    input div_signed,
    input [31:0] x,
    input [31:0] y,
    output reg [31:0] s,
    output reg [31:0] r,
    output reg complete
);

reg [63:0] A;
reg [32:0] B;
reg [5:0] cnt;
reg x_sign, y_sign;

wire [31:0] x_abs = div_signed & x[31] ? -x : x;
wire [31:0] y_abs = div_signed & y[31] ? -y : y;

always @(posedge div_clk or negedge resetn) begin
    if (!resetn) begin
        A <= 64'd0;
        B <= 33'd0;
        cnt <= 6'd0;
        s <= 32'd0;
        r <= 32'd0;
        complete <= 1'b0;
        x_sign <= 1'b0;
        y_sign <= 1'b0;
    end else if (div && cnt == 6'd0) begin
        A <= {32'd0, x_abs};
        B <= {1'b0, y_abs};
        cnt <= 6'd32;
        complete <= 1'b0;
        x_sign <= div_signed & x[31];
        y_sign <= div_signed & y[31];
    end else if (cnt > 6'd0) begin
        if (A[63:31] >= B) begin
            A <= {(A[63:31] - B), A[30:0], 1'b1};
        end else begin
            A <= {A[62:0], 1'b0};
        end
        cnt <= cnt - 1'b1;
        if (cnt == 6'd1) begin
            complete <= 1'b1;
            s <= (x_sign ^ y_sign) ? -A[31:0] : A[31:0];
            r <= x_sign ? -A[63:32] : A[63:32];
        end
    end
end

endmodule