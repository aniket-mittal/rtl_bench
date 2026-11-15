module origen_216366(
    input [31:0] dividend,
    input [31:0] divisor,
    input start,
    input clock,
    input reset,
    output [31:0] q,
    output [31:0] r,
    output busy
);

reg first;
reg busy2;
reg r_sign;
reg flag;
reg [1:0] flag_s;
reg [4:0] count;
reg [31:0] reg_q, reg_r, reg_b;
reg [31:0] tmp_q, tmp_r;

wire sub_add = (r_sign) ? 1'b1 : 1'b0;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        first <= 1'b1;
        busy2 <= 1'b0;
        r_sign <= 1'b0;
        flag <= 1'b0;
        flag_s <= 2'b00;
        count <= 5'b0;
        reg_q <= 32'b0;
        reg_r <= 32'b0;
        reg_b <= 32'b0;
        tmp_q <= 32'b0;
        tmp_r <= 32'b0;
    end else begin
        if (start) begin
            first <= 1'b1;
            busy2 <= 1'b1;
            r_sign <= (dividend[31] ^ divisor[31]);
            flag <= 1'b0;
            flag_s <= {dividend[31], divisor[31]};
            count <= 5'b0;
            reg_q <= 32'b0;
            reg_r <= dividend;
            reg_b <= divisor;
        end else begin
            if (busy2) begin
                if (first) begin
                    first <= 1'b0;
                    if (reg_r[31]) begin
                        reg_r <= ~reg_r + 1;
                        r_sign <= 1'b1;
                    end
                    if (reg_b[31]) begin
                        reg_b <= ~reg_b + 1;
                    end
                end
                if (count == 5'd31) begin
                    busy2 <= 1'b0;
                    flag <= 1'b1;
                    case (flag_s)
                        2'b00: begin
                            tmp_q <= reg_q;
                            tmp_r <= reg_r;
                        end
                        2'b01: begin
                            tmp_q <= ~reg_q + 1;
                            tmp_r <= ~reg_r + 1;
                        end
                        2'b10: begin
                            tmp_q <= ~reg_q + 1;
                            tmp_r <= reg_r;
                        end
                        2'b11: begin
                            tmp_q <= reg_q;
                            tmp_r <= ~reg_r + 1;
                        end
                    endcase
                end else begin
                    reg_q <= {reg_q[30:0], sub_add};
                    reg_r <= {reg_r[30:0], sub_add};
                    reg_b <= {reg_b[30:0], 1'b0};
                    count <= count + 1;
                end
            end
        end
    end
end

assign q = tmp_q;
assign r = tmp_r;
assign busy = busy2;

endmodule