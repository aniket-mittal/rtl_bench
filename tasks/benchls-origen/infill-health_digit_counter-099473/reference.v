module origen_099473 (
    input wire Clk,
    input wire Reset,
    input wire [9:0] player_health,
    output reg [3:0] player_digit_1,
    output reg [3:0] player_digit_2
);

reg flag;
reg [3:0] digit_1, digit_2;
reg flag_in;
reg [3:0] digit_1_in, digit_2_in;

initial begin
    digit_1 = 4'b0000;
    digit_2 = 4'b0000;
    flag = 1'b0;
end

always @(posedge Clk or posedge Reset) begin
    if (Reset) begin
        digit_1 <= 4'b0000;
        digit_2 <= 4'b0000;
        flag <= 1'b0;
    end else begin
        digit_1 <= digit_1_in;
        digit_2 <= digit_2_in;
        flag <= flag_in;
    end
end

always @(*) begin
    digit_1_in = digit_1;
    digit_2_in = digit_2;
    flag_in = flag;

    if (player_health == 10'b0 && flag == 1'b1) begin
        if (digit_1 == 4'd9) begin
            digit_1_in = 4'd0;
            if (digit_2 < 4'd9) begin
                digit_2_in = digit_2 + 1'b1;
            end
        end else begin
            digit_1_in = digit_1 + 1'b1;
        end
        flag_in = 1'b0;
    end else if (player_health != 10'b0) begin
        flag_in = 1'b1;
    end

    player_digit_1 = digit_1_in;
    player_digit_2 = digit_2_in;
end

endmodule