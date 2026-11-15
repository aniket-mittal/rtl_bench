module origen_089241 (
    input wire clock,
    input wire reset,
    input wire DIVS,
    input wire [31:0] dividend,
    input wire [31:0] divisor,
    input wire start,
    output reg [31:0] q,
    output reg [31:0] r,
    output reg pause,
    output reg busy
);

    reg [4:0] count;
    reg [31:0] dividend_abs, divisor_abs;
    reg [63:0] sub_add;
    reg dividend_sign, divisor_sign;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            q <= 32'b0;
            r <= 32'b0;
            busy <= 1'b0;
            pause <= 1'b0;
            count <= 5'b0;
        end else if (start && !busy) begin
            busy <= 1'b1;
            pause <= 1'b0;
            count <= 5'b0;
            dividend_sign <= DIVS & dividend[31];
            divisor_sign <= DIVS & divisor[31];
            dividend_abs <= dividend_sign ? -dividend : dividend;
            divisor_abs <= divisor_sign ? -divisor : divisor;
            sub_add <= {32'b0, dividend_abs};
        end else if (busy) begin
            if (count < 5'b11111) begin
                sub_add <= sub_add[63] ? {sub_add[62:0], 1'b0} : 
                           {sub_add[62:0] - divisor_abs, 1'b0};
                q <= {q[30:0], ~sub_add[63]};
                count <= count + 1'b1;
            end else begin
                busy <= 1'b0;
                pause <= 1'b1;
                r <= sub_add[63] ? sub_add[63:32] + divisor_abs : sub_add[63:32];
                if (DIVS) begin
                    q <= (dividend_sign ^ divisor_sign) ? -q : q;
                    r <= dividend_sign ? -r : r;
                end
            end
        end
    end

endmodule