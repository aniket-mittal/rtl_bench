module origen_095966 (
    output reg SCK,
    output reg CS,
    output reg MOSI,
    input MISO,
    input spi_nrst,
    input spi_clk,
    output reg spi_rdy,
    input spi_req,
    output reg spi_ack,
    input [15:0] SPI_OUT,
    output reg [15:0] SPI_IN
);

    // State encoding
    localparam S_INIT = 3'd0;
    localparam S_RESET = 3'd1;
    localparam S_IDLE = 3'd2;
    localparam S_OUT = 3'd3;
    localparam S_DONE = 3'd4;

    reg [2:0] state, next_state;
    reg [4:0] spi_out_cnt;
    reg [15:0] SPI_OUT_int, SPI_IN_int;
    reg SCK_int;

    // State machine
    always @(posedge spi_clk or negedge spi_nrst) begin
        if (!spi_nrst)
            state <= S_INIT;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            S_INIT: next_state = S_RESET;
            S_RESET: next_state = (spi_out_cnt == 0) ? S_IDLE : S_RESET;
            S_IDLE: next_state = spi_req ? S_OUT : S_IDLE;
            S_OUT: next_state = (spi_out_cnt == 0) ? S_DONE : S_OUT;
            S_DONE: next_state = spi_req ? S_DONE : S_IDLE;
            default: next_state = S_INIT;
        endcase
    end

    // Output logic
    always @(posedge spi_clk or negedge spi_nrst) begin
        if (!spi_nrst) begin
            CS <= 1'b1;
            MOSI <= 1'b0;
            spi_rdy <= 1'b0;
            spi_ack <= 1'b0;
            SPI_IN <= 16'h0000;
            SPI_OUT_int <= 16'h0000;
            SPI_IN_int <= 16'h0000;
            spi_out_cnt <= 5'd0;
            SCK_int <= 1'b0;
        end else begin
            case (state)
                S_INIT: begin
                    CS <= 1'b1;
                    MOSI <= 1'b0;
                    spi_rdy <= 1'b0;
                    spi_ack <= 1'b0;
                    SPI_IN <= 16'h0000;
                    SPI_OUT_int <= 16'h0000;
                    SPI_IN_int <= 16'h0000;
                    spi_out_cnt <= 5'd0;
                    SCK_int <= 1'b0;
                end
                S_RESET: begin
                    CS <= 1'b1;
                    MOSI <= 1'b0;
                    spi_rdy <= 1'b0;
                    spi_ack <= 1'b0;
                    spi_out_cnt <= spi_out_cnt - 1'b1;
                end
                S_IDLE: begin
                    CS <= 1'b1;
                    MOSI <= 1'b0;
                    spi_rdy <= 1'b1;
                    spi_ack <= 1'b0;
                    if (spi_req) begin
                        SPI_OUT_int <= SPI_OUT;
                        spi_out_cnt <= 5'd16;
                    end
                end
                S_OUT: begin
                    CS <= 1'b0;
                    spi_rdy <= 1'b0;
                    if (SCK_int) begin
                        MOSI <= SPI_OUT_int[15];
                        SPI_OUT_int <= {SPI_OUT_int[14:0], 1'b0};
                        spi_out_cnt <= spi_out_cnt - 1'b1;
                    end else begin
                        SPI_IN_int <= {SPI_IN_int[14:0], MISO};
                    end
                    SCK_int <= ~SCK_int;
                end
                S_DONE: begin
                    CS <= 1'b1;
                    MOSI <= 1'b0;
                    spi_rdy <= 1'b0;
                    spi_ack <= 1'b1;
                    SPI_IN <= SPI_IN_int;
                end
            endcase
        end
    end

    // SPI clock output
    always @(*) begin
        SCK = ~SCK_int;
    end

endmodule