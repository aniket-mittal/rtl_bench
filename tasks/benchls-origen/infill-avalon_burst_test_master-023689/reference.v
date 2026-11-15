module origen_023689 (
    input wire emif_usr_clk,
    input wire rst,
    input wire bt1,
    input wire bt2,
    input wire amm_ready,
    output reg amm_rd,
    output reg amm_wr,
    output reg [24:0] amm_addr,
    output reg [6:0] amm_burstcnt
);

    parameter burstlength = 6;
    reg [19:0] cnt;

    always @(negedge emif_usr_clk or posedge rst) begin
        if (rst) begin
            cnt <= 20'd0;
            amm_rd <= 1'b0;
            amm_wr <= 1'b0;
            amm_addr <= 25'h000000;
            amm_burstcnt <= 7'b0;
        end else begin
            if (bt1 || bt2) begin
                if (cnt < 20'd1001) begin
                    cnt <= cnt + 1'b1;
                end
            end else begin
                cnt <= 20'd0;
            end

            if (bt1) begin // Write mode
                case (cnt)
                    20'd0: begin
                        amm_wr <= 1'b1;
                        amm_addr <= 25'd155196;
                        amm_burstcnt <= burstlength;
                    end
                    20'd6: begin
                        amm_wr <= 1'b0;
                        amm_addr <= 25'bz;
                        amm_burstcnt <= 7'bz;
                    end
                    20'd7: begin
                        amm_wr <= 1'b1;
                        amm_addr <= 25'd155196 + burstlength;
                        amm_burstcnt <= burstlength;
                    end
                    20'd13: begin
                        amm_wr <= 1'b0;
                        amm_addr <= 25'bz;
                        amm_burstcnt <= 7'bz;
                    end
                    default: begin
                        amm_wr <= 1'b0;
                        amm_addr <= 25'bz;
                        amm_burstcnt <= 7'bz;
                    end
                endcase
            end else if (bt2) begin // Read mode
                case (cnt)
                    20'd0: begin
                        amm_rd <= 1'b1;
                        amm_addr <= 25'd155196;
                        amm_burstcnt <= burstlength;
                    end
                    20'd3: begin
                        amm_rd <= 1'b0;
                        amm_addr <= 25'bz;
                        amm_burstcnt <= 7'bz;
                    end
                    20'd4: begin
                        amm_rd <= 1'b1;
                        amm_addr <= 25'd155196 + burstlength;
                        amm_burstcnt <= burstlength;
                    end
                    20'd7: begin
                        amm_rd <= 1'b0;
                        amm_addr <= 25'bz;
                        amm_burstcnt <= 7'bz;
                    end
                    default: begin
                        amm_rd <= 1'b0;
                        amm_addr <= 25'bz;
                        amm_burstcnt <= 7'bz;
                    end
                endcase
            end else begin
                amm_rd <= 1'b0;
                amm_wr <= 1'b0;
                amm_addr <= 25'bz;
                amm_burstcnt <= 7'bz;
            end
        end
    end

endmodule