module origen_039500 #(
    parameter N = 16
)(
    input [N-1:0] binary,
    output reg [N-1:0] bcd
);

integer i, j;
reg [N-1:0] temp;

always @(*) begin
    bcd = 0;
    temp = binary;
    for (i = 0; i < N; i = i + 1) begin
        if (i == N-1 || bcd[3:0] > 4 || bcd[7:4] > 4 || bcd[11:8] > 4 || bcd[15:12] > 4) begin
            bcd = {bcd[N-2:0], temp[N-1]};
            temp = temp << 1;
            for (j = 0; j < 4; j = j + 1) begin
                if (bcd[3:0] > 4) bcd[3:0] = bcd[3:0] + 3;
                if (bcd[7:4] > 4) bcd[7:4] = bcd[7:4] + 3;
                if (bcd[11:8] > 4) bcd[11:8] = bcd[11:8] + 3;
                if (bcd[15:12] > 4) bcd[15:12] = bcd[15:12] + 3;
            end
        end
        else begin
            bcd = {bcd[N-2:0], temp[N-1]};
            temp = temp << 1;
        end
    end
end

endmodule

module bcd_to_ascii #(
    parameter BCD_BITS = 16,
    parameter BUF_BITS = 16
)(
    input [BCD_BITS-1:0] bcd,
    output reg [BUF_BITS-1:0] ascii
);

integer i;
reg [3:0] digit;
reg non_zero_found;

always @(*) begin
    ascii = 0;
    non_zero_found = 0;
    for (i = BCD_BITS-1; i >= 0; i = i - 4) begin
        digit = bcd[i-:4];
        if (digit != 0 || non_zero_found || i == 3) begin
            ascii = {ascii[BUF_BITS-5:0], 4'h3, digit};
            non_zero_found = 1;
        end else begin
            ascii = {ascii[BUF_BITS-5:0], 8'h5F};
        end
    end
end

endmodule

