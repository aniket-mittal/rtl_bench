module origen_210131 (
    input clk,
    input rst,
    input en,
    input [7:0] central,
    input [3:0] radius,
    output reg busy,
    output reg valid,
    output reg [7:0] candidate
);

reg [7:0] tmpX, tmpY, sX, sY;
reg [7:0] k, h;
reg [7:0] sum, nextSum;
reg [7:0] rSquare, dis;
reg [7:0] i, j, nexti, nextj, nextk;
reg [7:0] nexth;
reg done, nextDone;
reg enable;
reg [7:0] tmpR;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        busy <= 0;
        valid <= 0;
        candidate <= 0;
        sum <= 0;
        i <= 0;
        j <= 0;
        k <= 0;
        h <= 0;
        done <= 0;
        enable <= 0;
        tmpR <= 0;
    end
    else begin
        busy <= enable;
        valid <= done;
        candidate <= sum;
        i <= nexti;
        j <= nextj;
        k <= nextk;
        h <= nexth;
        done <= nextDone;
        enable <= en;
        tmpR <= radius;
        if (enable) begin
            sX <= central;
            sY <= central;
            rSquare <= radius * radius;
            sum <= 0;
            nexti <= 0;
            nextj <= 0;
            nextk <= 0;
            nexth <= 0;
            nextDone <= 0;
            nextSum <= 0;
        end
        else begin
            if (!done) begin
                if (j < 255) begin
                    if (i < 255) begin
                        tmpX <= i;
                        tmpY <= j;
                        dis <= (tmpX - sX) * (tmpX - sX) + (tmpY - sY) * (tmpY - sY);
                        if (dis <= rSquare) begin
                            nextSum <= sum + 1;
                        end
                        else begin
                            nextSum <= sum;
                        end
                        nexti <= i + 1;
                        nextj <= j;
                        nextk <= k;
                        nexth <= h + 1;
                        if (h == 255) begin
                            nextDone <= 1;
                        end
                        else begin
                            nextDone <= 0;
                        end
                    end
                    else begin
                        nexti <= 0;
                        nextj <= j + 1;
                        nextk <= k + 1;
                        nexth <= 0;
                        if (k == 255) begin
                            nextDone <= 1;
                        end
                        else begin
                            nextDone <= 0;
                        end
                    end
                end
                else begin
                    nexti <= 0;
                    nextj <= 0;
                    nextk <= 0;
                    nexth <= 0;
                    nextDone <= 1;
                end
            end
            else begin
                nexti <= 0;
                nextj <= 0;
                nextk <= 0;
                nexth <= 0;
                nextDone <= 0;
                nextSum <= 0;
            end
        end
    end
end

endmodule