module origen_216277(
    input clk,
    input [1:0] state,
    input [1:0] game_status,
    output reg [6:0] a,
    output reg [6:0] b,
    output reg [6:0] c,
    output reg [6:0] d,
    output reg [6:0] e,
    output reg [6:0] f,
    output reg [6:0] g,
    output reg e1,
    output reg e2,
    output reg e3
);

parameter GAME_INIT = 2'b00;
parameter P1_TURN = 2'b01;
parameter P2_TURN = 2'b10;
parameter END_GAME = 2'b11;

parameter STILL_PLAYING = 2'b00;
parameter P1_WINS = 2'b01;
parameter P2_WINS = 2'b10;
parameter TIE = 2'b11;

always @(posedge clk) begin
    case (game_status)
        P1_WINS, P2_WINS, TIE: begin
            e1 <= 1'b0;
            e2 <= 1'b0;
            e3 <= 1'b0;
            case (game_status)
                P1_WINS: begin
                    a <= 7'b1000000; // Display "1"
                    b <= 7'b1111001; // Display "P"
                    c <= 7'b0100100; // Display "1"
                    d <= 7'b0000000;
                    e <= 7'b0001000;
                    f <= 7'b0000010;
                    g <= 7'b0000010;
                end
                P2_WINS: begin
                    a <= 7'b1000000; // Display "2"
                    b <= 7'b1111001; // Display "P"
                    c <= 7'b1000010; // Display "2"
                    d <= 7'b0000000;
                    e <= 7'b0001000;
                    f <= 7'b0000010;
                    g <= 7'b0000010;
                end
                TIE: begin
                    a <= 7'b0111111; // Display "0"
                    b <= 7'b0000000;
                    c <= 7'b0000000;
                    d <= 7'b0111111; // Display "0"
                    e <= 7'b0000000;
                    f <= 7'b0000000;
                    g <= 7'b0000000;
                end
            endcase
        end
        STILL_PLAYING: begin
            case (state)
                P1_TURN: begin
                    e1 <= 1'b1;
                    e2 <= 1'b0;
                    e3 <= 1'b0;
                    a <= 7'b1000000; // Display "1"
                    b <= 7'b1111001; // Display "P"
                    c <= 7'b0100100; // Display "1"
                    d <= 7'b0000000;
                    e <= 7'b0001000;
                    f <= 7'b0000010;
                    g <= 7'b0000010;
                end
                P2_TURN: begin
                    e1 <= 1'b0;
                    e2 <= 1'b1;
                    e3 <= 1'b0;
                    a <= 7'b1000000; // Display "2"
                    b <= 7'b1111001; // Display "P"
                    c <= 7'b1000010; // Display "2"
                    d <= 7'b0000000;
                    e <= 7'b0001000;
                    f <= 7'b0000010;
                    g <= 7'b0000010;
                end
                default: begin
                    e1 <= 1'b0;
                    e2 <= 1'b0;
                    e3 <= 1'b0;
                    a <= 7'b0000000;
                    b <= 7'b0000000;
                    c <= 7'b0000000;
                    d <= 7'b0000000;
                    e <= 7'b0000000;
                    f <= 7'b0000000;
                    g <= 7'b0000000;
                end
            endcase
        end
        default: begin
            e1 <= 1'b0;
            e2 <= 1'b0;
            e3 <= 1'b0;
            a <= 7'b0000000;
            b <= 7'b0000000;
            c <= 7'b0000000;
            d <= 7'b0000000;
            e <= 7'b0000000;
            f <= 7'b0000000;
            g <= 7'b0000000;
        end
    endcase
end

endmodule