module origen_011243(
    input wire clk,
    input wire [9:0] carX, carY,
    input wire [1:0] carOrient,
    input wire [3:0] carIndex,
    output wire collision
);

    reg [9:0] carArrX [0:7];
    reg [9:0] carArrY [0:7];
    reg [1:0] carArrOrient [0:7];
    reg collision_reg;

    integer i, j;

    initial begin
        for (i = 0; i < 8; i = i + 1) begin
            carArrX[i] = 10'd0;
            carArrY[i] = 10'd0;
            carArrOrient[i] = 2'd0;
        end
        collision_reg = 1'b0;
    end

    always @(posedge clk) begin
        carArrX[carIndex] <= carX;
        carArrY[carIndex] <= carY;
        carArrOrient[carIndex] <= carOrient;

        collision_reg <= 1'b0;

        for (i = 0; i < 7; i = i + 1) begin
            for (j = i + 1; j < 8; j = j + 1) begin
                if (carArrOrient[i] != carArrOrient[j]) begin
                    if ((carArrX[i] < carArrX[j] + 60) && (carArrX[i] + 60 > carArrX[j]) &&
                        (carArrY[i] < carArrY[j] + 60) && (carArrY[i] + 60 > carArrY[j])) begin
                        collision_reg <= 1'b1;
                    end
                end else if (carArrOrient[i] == 2'b01) begin
                    if ((carArrX[i] < carArrX[j] + 30) && (carArrX[i] + 30 > carArrX[j]) &&
                        (carArrY[i] < carArrY[j] + 60) && (carArrY[i] + 60 > carArrY[j])) begin
                        collision_reg <= 1'b1;
                    end
                end else begin
                    if ((carArrX[i] < carArrX[j] + 60) && (carArrX[i] + 60 > carArrX[j]) &&
                        (carArrY[i] < carArrY[j] + 30) && (carArrY[i] + 30 > carArrY[j])) begin
                        collision_reg <= 1'b1;
                    end
                end
            end
        end
    end

    assign collision = collision_reg;

endmodule