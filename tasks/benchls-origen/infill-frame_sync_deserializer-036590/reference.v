module origen_036590 (
    input wire clk,
    input wire rst_n,
    input wire [3:0] din,
    input wire din_vld,
    output reg [7:0] dout,
    output reg dout_vld
);

    reg [11:0] din_tmp;
    reg [1:0] cnt0, cnt1;
    reg flag_add;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            din_tmp <= 12'b0;
            cnt0 <= 2'b0;
            cnt1 <= 2'b0;
            flag_add <= 1'b0;
            dout <= 8'b0;
            dout_vld <= 1'b0;
        end else begin
            dout_vld <= 1'b0;

            if (din_vld) begin
                din_tmp <= {din_tmp[7:0], din};
                dout <= {dout[3:0], din};

                if (!flag_add) begin
                    if ({din_tmp, din} == 16'h55D5) begin
                        flag_add <= 1'b1;
                        cnt0 <= 2'b0;
                        cnt1 <= 2'b0;
                    end
                end else begin
                    if (cnt0 == 2'b01) begin
                        dout_vld <= 1'b1;
                        cnt0 <= 2'b0;
                        if (cnt1 == 2'b01) begin
                            flag_add <= 1'b0;
                        end else begin
                            cnt1 <= cnt1 + 1'b1;
                        end
                    end else begin
                        cnt0 <= cnt0 + 1'b1;
                    end
                end
            end
        end
    end

endmodule