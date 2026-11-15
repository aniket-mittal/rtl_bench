module origen_213380(
    input pb1, pb2, foursec, nolives, collision, paddlegone,
    input [5:0] PS,
    output reg [5:0] NS,
    output reg movecarpet, moveball, movepaddle, resettimer,
    output reg decrementlives, loadlives, paddlehide,
    output reg timecount, resetpositions
);

localparam startgame = 6'b000001;
localparam idle = 6'b000010;
localparam play = 6'b000100;
localparam flash = 6'b001000;
localparam paddlefall = 6'b010000;
localparam nopaddles = 6'b100000;

always @(*) begin
    case (PS)
        startgame: begin
            if (pb2 == 1'b0 || (nopaddles == 1'b1 && pb1 == 1'b1)) begin
                NS = idle;
            end else begin
                NS = startgame;
            end
            movecarpet = 1'b0;
            moveball = 1'b0;
            movepaddle = 1'b0;
            resettimer = foursec;
            decrementlives = 1'b0;
            loadlives = 1'b1;
            paddlehide = 1'b0;
            timecount = 1'b0;
            resetpositions = 1'b1;
        end
        idle: begin
            if (pb2 == 1'b0 || (flash == 1'b1 && foursec == 1'b1 && nolives == 1'b0) || (paddlefall == 1'b1 && foursec == 1'b1 && nolives == 1'b0)) begin
                NS = idle;
            end else begin
                NS = play;
            end
            movecarpet = 1'b0;
            moveball = 1'b0;
            movepaddle = 1'b0;
            resettimer = 1'b0;
            decrementlives = 1'b0;
            loadlives = 1'b0;
            paddlehide = 1'b0;
            timecount = 1'b0;
            resetpositions = 1'b0;
        end
        play: begin
            NS = play;
            movecarpet = 1'b1;
            moveball = 1'b1;
            movepaddle = 1'b1;
            resettimer = (collision == 1'b1 || paddlegone == 1'b1);
            decrementlives = 1'b0;
            loadlives = 1'b0;
            paddlehide = 1'b0;
            timecount = 1'b1;
            resetpositions = 1'b0;
        end
        flash: begin
            if (foursec == 1'b1 && nolives == 1'b0) begin
                NS = idle;
            end else begin
                NS = flash;
            end
            movecarpet = 1'b1;
            moveball = 1'b1;
            movepaddle = 1'b1;
            resettimer = 1'b0;
            decrementlives = 1'b0;
            loadlives = 1'b0;
            paddlehide = 1'b0;
            timecount = 1'b1;
            resetpositions = 1'b0;
        end
        paddlefall: begin
            if (foursec == 1'b1 && nolives == 1'b0) begin
                NS = idle;
            end else begin
                NS = paddlefall;
            end
            movecarpet = 1'b1;
            moveball = 1'b1;
            movepaddle = 1'b1;
            resettimer = 1'b0;
            decrementlives = 1'b1;
            loadlives = 1'b0;
            paddlehide = 1'b1;
            timecount = 1'b1;
            resetpositions = 1'b0;
        end
        nopaddles: begin
            if (pb1 == 1'b1) begin
                NS = startgame;
            end else begin
                NS = nopaddles;
            end
            movecarpet = 1'b1;
            moveball = 1'b1;
            movepaddle = 1'b1;
            resettimer = 1'b0;
            decrementlives = 1'b0;
            loadlives = 1'b0;
            paddlehide = 1'b1;
            timecount = 1'b1;
            resetpositions = 1'b1;
        end
    endcase
end

endmodule