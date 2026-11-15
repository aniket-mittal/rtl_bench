module origen_016183 (
    input wire clk,
    input wire rst,
    input wire rx,
    input wire state_clear,
    input wire rx_clk_en,
    output reg ready,
    output reg errdata,
    output reg enderror,
    output reg [7:0] rx_data
);

    // State encoding
    localparam BEGIN = 2'b00;
    localparam TRANSDATA = 2'b01;
    localparam PARITY = 2'b10;
    localparam END = 2'b11;

    reg [1:0] state, next_state;
    reg [3:0] clk_count;
    reg [3:0] bit_count;
    reg [7:0] shift_reg;
    reg parity_result;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            state <= BEGIN;
            clk_count <= 4'd0;
            bit_count <= 4'd0;
            shift_reg <= 8'd0;
            parity_result <= 1'b0;
            ready <= 1'b0;
            errdata <= 1'b0;
            enderror <= 1'b0;
            rx_data <= 8'd0;
        end else if (rx_clk_en) begin
            state <= next_state;
            
            if (state_clear) begin
                ready <= 1'b0;
                errdata <= 1'b0;
                enderror <= 1'b0;
            end

            case (state)
                BEGIN: begin
                    if (rx == 1'b0 && clk_count == 4'd8) begin
                        clk_count <= 4'd0;
                        bit_count <= 4'd0;
                        parity_result <= 1'b0;
                    end else begin
                        clk_count <= (clk_count == 4'd15) ? 4'd0 : clk_count + 1'b1;
                    end
                end

                TRANSDATA: begin
                    if (clk_count == 4'd8) begin
                        shift_reg <= {rx, shift_reg[7:1]};
                        parity_result <= parity_result ^ rx;
                        bit_count <= bit_count + 1'b1;
                    end
                    clk_count <= (clk_count == 4'd15) ? 4'd0 : clk_count + 1'b1;
                end

                PARITY: begin
                    if (clk_count == 4'd8) begin
                        errdata <= (parity_result == rx) ? 1'b1 : 1'b0;
                    end
                    clk_count <= (clk_count == 4'd15) ? 4'd0 : clk_count + 1'b1;
                end

                END: begin
                    if (clk_count == 4'd8) begin
                        enderror <= (rx == 1'b0) ? 1'b1 : 1'b0;
                        ready <= 1'b1;
                        rx_data <= shift_reg;
                    end
                    clk_count <= (clk_count == 4'd15) ? 4'd0 : clk_count + 1'b1;
                end
            endcase
        end
    end

    always @(*) begin
        case (state)
            BEGIN:
                next_state = (rx == 1'b0 && clk_count == 4'd8) ? TRANSDATA : BEGIN;
            TRANSDATA:
                next_state = (bit_count == 4'd8 && clk_count == 4'd15) ? PARITY : TRANSDATA;
            PARITY:
                next_state = (clk_count == 4'd15) ? END : PARITY;
            END:
                next_state = (clk_count == 4'd15) ? BEGIN : END;
            default:
                next_state = BEGIN;
        endcase
    end

endmodule