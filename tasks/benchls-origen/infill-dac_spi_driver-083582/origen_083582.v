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

    [MASKED]

    always @(*) begin
        OUT_STATE = state;
    end

endmodule