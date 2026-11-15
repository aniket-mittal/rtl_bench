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

[MASKED]

endmodule