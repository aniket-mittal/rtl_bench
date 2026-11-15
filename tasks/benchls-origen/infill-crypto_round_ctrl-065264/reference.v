module origen_065264(
    input wire start,
    input wire ck,
    output reg round0,
    output reg round1,
    output reg [4:0] round,
    output reg ready,
    output reg [3:0] sels,
    output reg [4:0] selk
);

    reg [4:0] round_ps, round_ns;
    reg [2:0] cnt_ps, cnt_ns;
    reg [8:0] intsel;

    always @(posedge ck) begin
        round_ps <= round_ns;
        cnt_ps <= cnt_ns;
    end

    always @(*) begin
        if (start) begin
            round_ns = 5'b0;
            cnt_ns = 3'b0;
        end else begin
            cnt_ns = cnt_ps + 1'b1;
            if (cnt_ps == 3'b111) begin
                round_ns = round_ps + 1'b1;
            end else begin
                round_ns = round_ps;
            end
        end
    end

    always @(*) begin
        round0 = (round_ps == 5'b0);
        round1 = (round_ps == 5'b1);
        round = round_ps;
        ready = (round_ps == 5'b10000);

        case (cnt_ps)
            3'b000: intsel = 9'b000000001;
            3'b001: intsel = 9'b000000010;
            3'b010: intsel = 9'b000000100;
            3'b011: intsel = 9'b000001000;
            3'b100: intsel = 9'b000010000;
            3'b101: intsel = 9'b000100000;
            3'b110: intsel = 9'b001000000;
            3'b111: intsel = 9'b010000000;
            default: intsel = 9'b000000000;
        endcase

        sels = intsel[3:0];
        selk = intsel[8:4];
    end

endmodule