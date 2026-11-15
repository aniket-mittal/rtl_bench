module origen_023632(
    input wire clk,
    input wire rst,
    input wire [1:0] state,
    input wire [1:0] mode,
    input wire [1:0] keyboard,
    input wire [9:0] ballY,
    input wire player,
    output reg [9:0] posX,
    output reg [8:0] posY
);

    localparam START = 2'b00, SERVE = 2'b01, PLAY = 2'b10, DONE = 2'b11;
    localparam PP = 2'b00, PA = 2'b01, AP = 2'b10, AA = 2'b11;

    reg [19:0] counter;
    wire ai_control;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            posY <= 9'd232;
            counter <= 20'd0;
        end else begin
            case (state)
                START, DONE: posY <= 9'd232;
                SERVE, PLAY: begin
                    if (ai_control) begin
                        if (posY + 9'd20 < ballY + 10'd4)
                            posY <= (posY < 9'd424) ? posY + 9'd1 : 9'd424;
                        else if (posY + 9'd20 > ballY + 10'd4)
                            posY <= (posY > 9'd0) ? posY - 9'd1 : 9'd0;
                    end else begin
                        if (counter == 20'd833333) begin
                            counter <= 20'd0;
                            case (keyboard)
                                2'b01: posY <= (posY < 9'd424) ? posY + 9'd1 : 9'd424;
                                2'b10: posY <= (posY > 9'd0) ? posY - 9'd1 : 9'd0;
                                default: posY <= posY;
                            endcase
                        end else begin
                            counter <= counter + 20'd1;
                        end
                    end
                end
                default: posY <= posY;
            endcase
        end
    end

    always @(*) begin
        posX = player ? 10'd614 : 10'd0;
    end

    assign ai_control = (mode == AA) || (mode == PA && player) || (mode == AP && !player);

endmodule