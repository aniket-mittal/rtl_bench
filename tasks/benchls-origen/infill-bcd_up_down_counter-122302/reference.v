module origen_122302 (
    input wire up_down_n,
    input wire cntr_en,
    input wire clk,
    input wire reset_n,
    input wire carry_in,
    input wire sub_in,
    output reg carry_out,
    output reg sub_out,
    output reg [3:0] bcd
);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            bcd <= 4'b0000;
            carry_out <= 1'b0;
            sub_out <= 1'b0;
        end else if (cntr_en) begin
            if (up_down_n) begin // Up-counting mode
                if (carry_in) begin
                    if (bcd == 4'd9) begin
                        bcd <= 4'd0;
                        carry_out <= 1'b1;
                    end else begin
                        bcd <= bcd + 1'b1;
                        carry_out <= 1'b0;
                    end
                end else begin
                    carry_out <= 1'b0;
                end
                sub_out <= 1'b0;
            end else begin // Down-counting mode
                if (sub_in) begin
                    if (bcd == 4'd0) begin
                        bcd <= 4'd9;
                        sub_out <= 1'b1;
                    end else begin
                        bcd <= bcd - 1'b1;
                        sub_out <= 1'b0;
                    end
                end else begin
                    sub_out <= 1'b0;
                end
                carry_out <= 1'b0;
            end
        end else begin
            carry_out <= 1'b0;
            sub_out <= 1'b0;
        end
    end

endmodule