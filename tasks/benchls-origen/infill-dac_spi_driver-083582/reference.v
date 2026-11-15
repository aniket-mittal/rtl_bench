module origen_083582 (
    input wire IN_CLOCK,
    input wire IN_RESET,
    input wire [11:0] IN_BITS,
    input wire IN_SAMPLE_READY,
    output reg OUT_SPI_SCK,
    output reg OUT_SPI_MOSI,
    output reg OUT_DAC_CS,
    output reg OUT_DAC_CLR,
    output reg [4:0] OUT_STATE,
    output reg [31:0] OUT_WRITE_BIT
);

    // States
    localparam IDLE = 5'd0;
    localparam PREPARE_DATA = 5'd1;
    localparam START_TRANSMISSION = 5'd2;
    localparam CLOCK_PULSE = 5'd3;
    localparam END_TRANSMISSION = 5'd4;
    localparam FINISH = 5'd5;

    // Constants
    localparam BASE_BITS = 20'b00110000000000000000;
    
    reg [4:0] state;
    reg [5:0] bit_counter;
    reg is_sample_finished;
    reg spi_clock_phase;

    always @(posedge IN_CLOCK or posedge IN_RESET) begin
        if (IN_RESET) begin
            state <= IDLE;
            OUT_SPI_SCK <= 1'b0;
            OUT_SPI_MOSI <= 1'b0;
            OUT_DAC_CS <= 1'b1;
            OUT_DAC_CLR <= 1'b1;
            OUT_WRITE_BIT <= 32'b0;
            bit_counter <= 6'd0;
            is_sample_finished <= 1'b1;
            spi_clock_phase <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (IN_SAMPLE_READY && is_sample_finished) begin
                        state <= PREPARE_DATA;
                        is_sample_finished <= 1'b0;
                    end
                end

                PREPARE_DATA: begin
                    OUT_WRITE_BIT <= {BASE_BITS, IN_BITS};
                    state <= START_TRANSMISSION;
                end

                START_TRANSMISSION: begin
                    OUT_DAC_CS <= 1'b0;
                    OUT_SPI_MOSI <= OUT_WRITE_BIT[31];
                    state <= CLOCK_PULSE;
                    bit_counter <= 6'd31;
                end

                CLOCK_PULSE: begin
                    if (spi_clock_phase) begin
                        OUT_SPI_SCK <= 1'b1;
                        spi_clock_phase <= 1'b0;
                        if (bit_counter == 6'd0) begin
                            state <= END_TRANSMISSION;
                        end else begin
                            bit_counter <= bit_counter - 1'b1;
                            OUT_SPI_MOSI <= OUT_WRITE_BIT[bit_counter - 1];
                        end
                    end else begin
                        OUT_SPI_SCK <= 1'b0;
                        spi_clock_phase <= 1'b1;
                    end
                end

                END_TRANSMISSION: begin
                    OUT_SPI_SCK <= 1'b0;
                    state <= FINISH;
                end

                FINISH: begin
                    OUT_DAC_CS <= 1'b1;
                    is_sample_finished <= 1'b1;
                    state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end

    always @(*) begin
        OUT_STATE = state;
    end

endmodule