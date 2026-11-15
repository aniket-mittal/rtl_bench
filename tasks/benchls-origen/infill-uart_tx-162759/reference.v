module origen_162759(
    input [7:0] data_in,
    input tx_clk,
    input reset,
    input start,
    output reg data_out,
    output tx_ready
);

    reg [10:0] shift;
    reg [3:0] state;
    reg available;

    initial begin
        shift <= 11'b11111111111;
        state <= 4'd0;
        available <= 1'b1;
    end

    always @(posedge tx_clk or posedge reset) begin
        if (reset) begin
            shift <= 11'b11111111111;
            state <= 4'd0;
            available <= 1'b1;
        end
        else begin
            case (state)
                4'd0: begin
                    if (start && available) begin
                        shift <= {1'b1, data_in, 2'b11};
                        state <= 4'd1;
                        available <= 1'b0;
                    end
                end
                4'd1: begin
                    shift <= {1'b0, shift[10:1]};
                    state <= 4'd2;
                end
                4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8, 4'd9, 4'd10, 4'd11: begin
                    shift <= {1'b0, shift[10:1]};
                    state <= state + 4'd1;
                end
                4'd12: begin
                    available <= 1'b1;
                    state <= 4'd0;
                end
            endcase
            data_out <= shift[0];
        end
    end

    assign tx_ready = available;

endmodule