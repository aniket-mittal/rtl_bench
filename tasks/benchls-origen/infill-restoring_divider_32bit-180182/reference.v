module origen_180182(
    input [31:0] dividend,
    input [31:0] divisor,
    input start,
    input clock,
    input reset,
    output reg [31:0] q,
    output reg [31:0] r,
    output reg busy
);

reg [31:0] reg_q, reg_r, reg_b;
reg r_sign;
reg [31:0] sub_add;
reg [4:0] count;

wire [31:0] dividend_temp, divisor_temp;

assign dividend_temp = (dividend[31]) ? -dividend : dividend;
assign divisor_temp = (divisor[31]) ? -divisor : divisor;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        reg_q <= 0;
        reg_r <= 0;
        reg_b <= 0;
        r_sign <= 0;
        count <= 0;
        busy <= 0;
    end
    else if (start) begin
        reg_r <= 0;
        r_sign <= 0;
        reg_q <= dividend_temp;
        reg_b <= divisor_temp;
        busy <= 1;
        count <= 0;
    end
    else if (busy) begin
        sub_add <= (r_sign) ? reg_r + reg_b : reg_r - reg_b;
        reg_r <= sub_add;
        r_sign <= sub_add[31];
        reg_q <= {reg_q[30:0], ~sub_add[31]};
        count <= count + 1;
        busy <= (count == 31) ? 0 : 1;
    end
end

always @* begin
    q = (dividend[31] ^ divisor[31]) ? -reg_q : reg_q;
    r = (dividend[31]) ? -reg_r : reg_r;
end

endmodule