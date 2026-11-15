module origen_143491 (
    input wire clk_x4,
    input wire rst_x,
    input wire i_rx,
    input wire [7:0] i_data,
    input wire i_valid,
    output reg o_tx,
    output reg [7:0] o_data,
    output reg o_tx_error,
    output reg o_rx_error
);

    // Parameters
    localparam IDLE = 2'b00;
    localparam START = 2'b01;
    localparam DATA = 2'b10;
    localparam STOP = 2'b11;

    // Internal registers
    reg [1:0] rx_state, tx_state;
    reg [3:0] rx_bit_count, tx_bit_count;
    reg [7:0] rx_shift_reg, tx_shift_reg;
    reg [1:0] rx_sample_count, tx_sample_count;

    // RX logic
    always @(posedge clk_x4 or negedge rst_x) begin
        if (!rst_x) begin
            rx_state <= IDLE;
            rx_bit_count <= 0;
            rx_sample_count <= 0;
            rx_shift_reg <= 8'b0;
            o_data <= 8'b0;
            o_rx_error <= 1'b0;
        end else begin
            case (rx_state)
                IDLE: begin
                    if (!i_rx) begin
                        rx_state <= START;
                        rx_sample_count <= 0;
                    end
                end
                START: begin
                    if (rx_sample_count == 2'b11) begin
                        rx_state <= DATA;
                        rx_bit_count <= 0;
                        rx_sample_count <= 0;
                    end else begin
                        rx_sample_count <= rx_sample_count + 1;
                    end
                end
                DATA: begin
                    if (rx_sample_count == 2'b11) begin
                        rx_shift_reg <= {i_rx, rx_shift_reg[7:1]};
                        rx_bit_count <= rx_bit_count + 1;
                        rx_sample_count <= 0;
                        if (rx_bit_count == 4'b0111) begin
                            rx_state <= STOP;
                        end
                    end else begin
                        rx_sample_count <= rx_sample_count + 1;
                    end
                end
                STOP: begin
                    if (rx_sample_count == 2'b11) begin
                        if (i_rx) begin
                            o_data <= rx_shift_reg;
                            o_rx_error <= 1'b0;
                        end else begin
                            o_rx_error <= 1'b1;
                        end
                        rx_state <= IDLE;
                    end else begin
                        rx_sample_count <= rx_sample_count + 1;
                    end
                end
            endcase
        end
    end

    // TX logic
    always @(posedge clk_x4 or negedge rst_x) begin
        if (!rst_x) begin
            tx_state <= IDLE;
            tx_bit_count <= 0;
            tx_sample_count <= 0;
            tx_shift_reg <= 8'b0;
            o_tx <= 1'b1;
            o_tx_error <= 1'b0;
        end else begin
            case (tx_state)
                IDLE: begin
                    if (i_valid) begin
                        tx_state <= START;
                        tx_shift_reg <= i_data;
                        tx_sample_count <= 0;
                        o_tx <= 1'b0;
                    end
                end
                START: begin
                    if (tx_sample_count == 2'b11) begin
                        tx_state <= DATA;
                        tx_bit_count <= 0;
                        tx_sample_count <= 0;
                        o_tx <= tx_shift_reg[0];
                    end else begin
                        tx_sample_count <= tx_sample_count + 1;
                    end
                end
                DATA: begin
                    if (tx_sample_count == 2'b11) begin
                        tx_shift_reg <= {1'b0, tx_shift_reg[7:1]};
                        tx_bit_count <= tx_bit_count + 1;
                        tx_sample_count <= 0;
                        if (tx_bit_count == 4'b0111) begin
                            tx_state <= STOP;
                            o_tx <= 1'b1;
                        end else begin
                            o_tx <= tx_shift_reg[0];
                        end
                    end else begin
                        tx_sample_count <= tx_sample_count + 1;
                    end
                end
                STOP: begin
                    if (tx_sample_count == 2'b11) begin
                        tx_state <= IDLE;
                        o_tx_error <= 1'b0;
                    end else begin
                        tx_sample_count <= tx_sample_count + 1;
                    end
                end
            endcase
        end
    end

endmodule