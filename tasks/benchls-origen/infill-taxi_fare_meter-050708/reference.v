module origen_050708(
    input clk,
    input reset,
    input normal,
    input premium,
    output reg meter,
    output reg [3:0] one_meter,
    output reg [3:0] ten_meter,
    output reg [3:0] baek_meter
);

    reg [3:0] count;
    reg clk_out;
    reg [1:0] status;

    // Clock divider
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 4'd0;
            clk_out <= 1'b0;
        end else begin
            if (count == 4'd9) begin
                count <= 4'd0;
                clk_out <= ~clk_out;
            end else begin
                count <= count + 1'b1;
            end
        end
    end

    // Status control
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            status <= 2'b00;
        end else begin
            if (normal) status <= 2'b01;
            else if (premium) status <= 2'b10;
        end
    end

    // Meter calculation
    always @(posedge clk_out or posedge reset) begin
        if (reset) begin
            one_meter <= 4'd0;
            ten_meter <= 4'd0;
            baek_meter <= 4'd0;
            meter <= 1'b1;
        end else begin
            case (status)
                2'b00: begin // Idle
                    one_meter <= 4'd0;
                    ten_meter <= 4'd0;
                    baek_meter <= 4'd0;
                    meter <= 1'b1;
                end
                2'b01: begin // Normal mode
                    if (one_meter == 4'd0 && ten_meter == 4'd0 && baek_meter == 4'd0) begin
                        one_meter <= 4'd0;
                        ten_meter <= 4'd4;
                        baek_meter <= 4'd1;
                        meter <= 1'b0;
                    end else begin
                        if (one_meter == 4'd0) begin
                            one_meter <= 4'd9;
                            if (ten_meter == 4'd0) begin
                                ten_meter <= 4'd5;
                                baek_meter <= baek_meter - 1'b1;
                            end else begin
                                ten_meter <= ten_meter - 1'b1;
                            end
                        end else begin
                            one_meter <= one_meter - 1'b1;
                        end
                        meter <= (one_meter == 4'd1 && ten_meter == 4'd0 && baek_meter == 4'd0);
                    end
                end
                2'b10: begin // Premium mode
                    if (one_meter == 4'd0 && ten_meter == 4'd0 && baek_meter == 4'd0) begin
                        one_meter <= 4'd0;
                        ten_meter <= 4'd2;
                        baek_meter <= 4'd1;
                        meter <= 1'b0;
                    end else begin
                        if (one_meter == 4'd0) begin
                            one_meter <= 4'd9;
                            if (ten_meter == 4'd0) begin
                                ten_meter <= 4'd5;
                                baek_meter <= baek_meter - 1'b1;
                            end else begin
                                ten_meter <= ten_meter - 1'b1;
                            end
                        end else begin
                            one_meter <= one_meter - 1'b1;
                        end
                        meter <= (one_meter == 4'd1 && ten_meter == 4'd0 && baek_meter == 4'd0);
                    end
                end
            endcase
        end
    end

endmodule