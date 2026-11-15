module autovcoder_125162 (
    input clk,
    input rst,
    input req0,
    input req1,
    input req2,
    input req3,
    output reg grant0,
    output reg grant1,
    output reg grant2,
    output reg grant3,
    output reg transfer
);
    reg [1:0] current_channel;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            grant0 <= 0;
            grant1 <= 0;
            grant2 <= 0;
            grant3 <= 0;
            transfer <= 0;
            current_channel <= 0;
        end else begin
            transfer <= 0; // Reset transfer signal
            if (req0 || req1 || req2 || req3) begin
                // Round-robin grant
                case (current_channel)
                    2'b00: begin
                        if (req0) begin
                            grant0 <= 1;
                            transfer <= 1;
                        end else if (req1) begin
                            grant1 <= 1;
                            transfer <= 1;
                        end else if (req2) begin
                            grant2 <= 1;
                            transfer <= 1;
                        end else if (req3) begin
                            grant3 <= 1;
                            transfer <= 1;
                        end
                    end
                    2'b01: begin
                        if (req1) begin
                            grant1 <= 1;
                            transfer <= 1;
                        end else if (req2) begin
                            grant2 <= 1;
                            transfer <= 1;
                        end else if (req3) begin
                            grant3 <= 1;
                            transfer <= 1;
                        end else if (req0) begin
                            grant0 <= 1;
                            transfer <= 1;
                        end
                    end
                    2'b10: begin
                        if (req2) begin
                            grant2 <= 1;
                            transfer <= 1;
                        end else if (req3) begin
                            grant3 <= 1;
                            transfer <= 1;
                        end else if (req0) begin
                            grant0 <= 1;
                            transfer <= 1;
                        end else if (req1) begin
                            grant1 <= 1;
                            transfer <= 1;
                        end
                    end
                    2'b11: begin
                        if (req3) begin
                            grant3 <= 1;
                            transfer <= 1;
                        end else if (req0) begin
                            grant0 <= 1;
                            transfer <= 1;
                        end else if (req1) begin
                            grant1 <= 1;
                            transfer <= 1;
                        end else if (req2) begin
                            grant2 <= 1;
                            transfer <= 1;
                        end
                    end
                endcase
            end

            // Reset grants for the next cycle
            grant0 <= 0;
            grant1 <= 0;
            grant2 <= 0;
            grant3 <= 0;

            // Move to the next channel
            if (transfer) begin
                current_channel <= (current_channel + 1) % 4;
            end
        end
    end
endmodule