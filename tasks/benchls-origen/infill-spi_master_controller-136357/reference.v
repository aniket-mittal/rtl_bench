module origen_136357 (
    input wire clk,
    input wire rst,
    input wire [6:0] mpu_address,
    input wire [7:0] mpu_wr_data,
    input wire mpu_rd_wr_sel,
    input wire start,
    input wire [7:0] SPI_DI_g,
    output reg busy,
    output reg SPI_SS_g,
    output reg SPI_CK_g,
    output reg [7:0] SPI_DO_g,
    output reg [7:0] mpu_rd_data
);

    // Parameters
    localparam IDLE = 3'b000;
    localparam START = 3'b001;
    localparam TRANSMIT = 3'b010;
    localparam RECEIVE = 3'b011;
    localparam FINISH = 3'b100;

    // Internal signals
    reg [2:0] state, next_state;
    reg [7:0] tx_data, rx_data;
    reg [4:0] bit_counter;
    reg [6:0] clk_counter;
    reg spi_clk;

    // State machine
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = start ? START : IDLE;
            START: next_state = TRANSMIT;
            TRANSMIT: next_state = (bit_counter == 5'd15) ? RECEIVE : TRANSMIT;
            RECEIVE: next_state = (bit_counter == 5'd23) ? FINISH : RECEIVE;
            FINISH: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // SPI clock generation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            clk_counter <= 7'd0;
            spi_clk <= 1'b0;
        end else if (state != IDLE) begin
            if (clk_counter == 7'd49) begin
                clk_counter <= 7'd0;
                spi_clk <= ~spi_clk;
            end else begin
                clk_counter <= clk_counter + 1'b1;
            end
        end else begin
            clk_counter <= 7'd0;
            spi_clk <= 1'b0;
        end
    end

    // Bit counter
    always @(posedge spi_clk or posedge rst) begin
        if (rst) begin
            bit_counter <= 5'd0;
        end else if (state == TRANSMIT || state == RECEIVE) begin
            bit_counter <= bit_counter + 1'b1;
        end else begin
            bit_counter <= 5'd0;
        end
    end

    // Data transmission and reception
    always @(posedge spi_clk or posedge rst) begin
        if (rst) begin
            tx_data <= 8'd0;
            rx_data <= 8'd0;
            SPI_DO_g <= 8'd0;
        end else begin
            case (state)
                START: begin
                    tx_data <= {mpu_rd_wr_sel, mpu_address};
                    SPI_DO_g <= {mpu_rd_wr_sel, mpu_address};
                end
                TRANSMIT: begin
                    if (bit_counter == 5'd8) begin
                        tx_data <= mpu_wr_data;
                        SPI_DO_g <= mpu_wr_data;
                    end else begin
                        tx_data <= {tx_data[6:0], 1'b0};
                        SPI_DO_g <= {tx_data[6:0], 1'b0};
                    end
                end
                RECEIVE: begin
                    rx_data <= {rx_data[6:0], SPI_DI_g[7]};
                end
                FINISH: begin
                    mpu_rd_data <= rx_data;
                end
            endcase
        end
    end

    // Control signals
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            busy <= 1'b0;
            SPI_SS_g <= 1'b1;
            SPI_CK_g <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    busy <= 1'b0;
                    SPI_SS_g <= 1'b1;
                    SPI_CK_g <= 1'b0;
                end
                START: begin
                    busy <= 1'b1;
                    SPI_SS_g <= 1'b0;
                    SPI_CK_g <= 1'b0;
                end
                TRANSMIT, RECEIVE: begin
                    busy <= 1'b1;
                    SPI_SS_g <= 1'b0;
                    SPI_CK_g <= spi_clk;
                end
                FINISH: begin
                    busy <= 1'b1;
                    SPI_SS_g <= 1'b1;
                    SPI_CK_g <= 1'b0;
                end
            endcase
        end
    end

endmodule