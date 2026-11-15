module origen_021155 (
    input wire clk,
    input wire reset,
    input wire buy,
    input wire [1:0] product,
    input wire [7:0] credit,
    output reg apple,
    output reg banana,
    output reg carrot,
    output reg date,
    output reg error
);

    always @(posedge clk) begin
        if (buy) begin
            case (product)
                2'b00: begin // Apple
                    if (credit >= 8'd75) begin
                        apple <= 1'b1;
                        banana <= 1'b0;
                        carrot <= 1'b0;
                        date <= 1'b0;
                        error <= 1'b0;
                    end else begin
                        apple <= 1'b0;
                        banana <= 1'b0;
                        carrot <= 1'b0;
                        date <= 1'b0;
                        error <= 1'b1;
                    end
                end
                2'b01: begin // Banana
                    if (credit >= 8'd20) begin
                        apple <= 1'b0;
                        banana <= 1'b1;
                        carrot <= 1'b0;
                        date <= 1'b0;
                        error <= 1'b0;
                    end else begin
                        apple <= 1'b0;
                        banana <= 1'b0;
                        carrot <= 1'b0;
                        date <= 1'b0;
                        error <= 1'b1;
                    end
                end
                2'b10: begin // Carrot
                    if (credit >= 8'd30) begin
                        apple <= 1'b0;
                        banana <= 1'b0;
                        carrot <= 1'b1;
                        date <= 1'b0;
                        error <= 1'b0;
                    end else begin
                        apple <= 1'b0;
                        banana <= 1'b0;
                        carrot <= 1'b0;
                        date <= 1'b0;
                        error <= 1'b1;
                    end
                end
                2'b11: begin // Date
                    if (credit >= 8'd40) begin
                        apple <= 1'b0;
                        banana <= 1'b0;
                        carrot <= 1'b0;
                        date <= 1'b1;
                        error <= 1'b0;
                    end else begin
                        apple <= 1'b0;
                        banana <= 1'b0;
                        carrot <= 1'b0;
                        date <= 1'b0;
                        error <= 1'b1;
                    end
                end
            endcase
        end else begin
            apple <= 1'b0;
            banana <= 1'b0;
            carrot <= 1'b0;
            date <= 1'b0;
            error <= 1'b0;
        end
    end

    initial begin
        apple = 1'b0;
        banana = 1'b0;
        carrot = 1'b0;
        date = 1'b0;
        error = 1'b0;
    end

endmodule