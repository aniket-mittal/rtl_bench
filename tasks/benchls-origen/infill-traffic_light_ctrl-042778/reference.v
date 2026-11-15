module origen_042778 (
    input wire clk,
    input wire rst,
    input wire pass,
    output reg R,
    output reg G,
    output reg Y
);

    reg [15:0] count;
    reg [3:0] state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 4'b0000;
            count <= 16'd0;
            G <= 1'b1;
            Y <= 1'b0;
            R <= 1'b0;
        end else begin
            case (state)
                4'b0000: begin
                    G <= 1'b1;
                    Y <= 1'b0;
                    R <= 1'b0;
                    if (count == 16'd1023) begin
                        state <= 4'b0001;
                        count <= 16'd0;
                    end else begin
                        count <= count + 1'b1;
                    end
                end
                4'b0001: begin
                    G <= 1'b0;
                    Y <= 1'b0;
                    R <= 1'b0;
                    if (count == 16'd127) begin
                        state <= 4'b0010;
                        count <= 16'd0;
                    end else begin
                        count <= count + 1'b1;
                    end
                end
                4'b0010: begin
                    G <= 1'b1;
                    Y <= 1'b0;
                    R <= 1'b0;
                    if (count == 16'd127) begin
                        state <= 4'b0011;
                        count <= 16'd0;
                    end else begin
                        count <= count + 1'b1;
                    end
                end
                4'b0011: begin
                    G <= 1'b0;
                    Y <= 1'b0;
                    R <= 1'b0;
                    if (count == 16'd127) begin
                        state <= 4'b0100;
                        count <= 16'd0;
                    end else begin
                        count <= count + 1'b1;
                    end
                end
                4'b0100: begin
                    G <= 1'b1;
                    Y <= 1'b0;
                    R <= 1'b0;
                    if (count == 16'd127) begin
                        state <= 4'b0101;
                        count <= 16'd0;
                    end else begin
                        count <= count + 1'b1;
                    end
                end
                4'b0101: begin
                    G <= 1'b0;
                    Y <= 1'b1;
                    R <= 1'b0;
                    if (count == 16'd511) begin
                        state <= 4'b0110;
                        count <= 16'd0;
                    end else begin
                        count <= count + 1'b1;
                    end
                end
                4'b0110: begin
                    G <= 1'b0;
                    Y <= 1'b0;
                    R <= 1'b1;
                    if (count == 16'd1023) begin
                        state <= 4'b0000;
                        count <= 16'd0;
                    end else begin
                        count <= count + 1'b1;
                    end
                end
                default: begin
                    state <= 4'b0000;
                    count <= 16'd0;
                end
            endcase

            if (pass && state != 4'b0000) begin
                state <= 4'b0000;
                count <= 16'd0;
                G <= 1'b1;
                Y <= 1'b0;
                R <= 1'b0;
            end
        end
    end

endmodule