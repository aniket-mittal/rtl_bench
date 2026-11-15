module origen_055689 (
    input wire clk,
    input wire rst_n,
    input wire key,
    output reg flag
);

    parameter T = 100000;
    reg [18:0] cnt;
    reg state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 19'd0;
            state <= 1'b0;
            flag <= 1'b0;
        end
        else begin
            case (state)
                1'b0: begin
                    if (!key) begin
                        if (cnt == T - 1) begin
                            state <= 1'b1;
                            cnt <= 19'd0;
                        end
                        else begin
                            cnt <= cnt + 1'b1;
                        end
                    end
                    else begin
                        cnt <= 19'd0;
                    end
                    flag <= 1'b0;
                end
                1'b1: begin
                    if (!key) begin
                        cnt <= 19'd0;
                    end
                    else begin
                        if (cnt == T - 1) begin
                            state <= 1'b0;
                            flag <= 1'b1;
                        end
                        else begin
                            cnt <= cnt + 1'b1;
                        end
                    end
                end
            endcase
        end
    end

endmodule