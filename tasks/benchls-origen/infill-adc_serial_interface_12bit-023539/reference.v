module origen_023539 (
    input wire CLOCK_50,
    input wire ADC_DOUT,
    input wire reset,
    output reg [11:0] d_out,
    output reg ADC_CS_N,
    output reg ADC_SCLK,
    output reg ADC_DIN
);

    // State definitions
    localparam QUIET0 = 3'b000;
    localparam QUIET1 = 3'b001;
    localparam QUIET2 = 3'b010;
    localparam CYCLE0 = 3'b011;
    localparam CYCLE1 = 3'b100;
    localparam CYCLE2 = 3'b101;
    localparam CYCLE3 = 3'b110;

    reg [2:0] state;
    reg [2:0] addr;
    reg [3:0] count;
    reg [14:0] buffer;
    reg clk_en;
    reg [1:0] clk_div;

    // Clock divider for 12.5MHz clock enable
    always @(posedge CLOCK_50 or posedge reset) begin
        if (reset) begin
            clk_div <= 2'b00;
            clk_en <= 1'b0;
        end else begin
            clk_div <= clk_div + 1'b1;
            clk_en <= (clk_div == 2'b11);
        end
    end

    // Main state machine
    always @(posedge CLOCK_50 or posedge reset) begin
        if (reset) begin
            state <= QUIET0;
            addr <= 3'b000;
            count <= 4'b0000;
            buffer <= 15'b0;
            d_out <= 12'b0;
            ADC_CS_N <= 1'b1;
            ADC_SCLK <= 1'b0;
            ADC_DIN <= 1'b0;
        end else if (clk_en) begin
            case (state)
                QUIET0: state <= QUIET1;
                QUIET1: state <= QUIET2;
                QUIET2: state <= CYCLE0;
                CYCLE0: begin
                    if (count == 4'b1111) begin
                        state <= QUIET0;
                        addr <= addr + 1'b1;
                        d_out <= buffer[14:3];
                    end else begin
                        state <= CYCLE1;
                    end
                    ADC_CS_N <= 1'b0;
                end
                CYCLE1: begin
                    state <= CYCLE2;
                    ADC_SCLK <= 1'b1;
                end
                CYCLE2: begin
                    state <= CYCLE3;
                    buffer <= {buffer[13:0], ADC_DOUT};
                    ADC_SCLK <= 1'b0;
                end
                CYCLE3: begin
                    state <= CYCLE0;
                    count <= count + 1'b1;
                end
            endcase
        end
    end

    // Control signal generation
    always @(*) begin
        case (count)
            4'b0000: ADC_DIN = 1'b1;
            4'b0001: ADC_DIN = 1'b1;
            4'b0010: ADC_DIN = addr[2];
            4'b0011: ADC_DIN = addr[1];
            default: ADC_DIN = addr[0];
        endcase
    end

endmodule