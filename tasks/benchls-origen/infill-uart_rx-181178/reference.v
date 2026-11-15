module origen_181178(
    input       rst_n,
    input       clk,
    input       rxd,
    output reg  valid,
    output reg [7:0] data
);

    // Internal signals
    reg [2:0] reg_rxd;
    reg [1:0] sample_count;
    reg [2:0] bit_count;
    reg [7:0] rx_data;
    reg [3:0] state;

    localparam S_IDLE  = 4'b0001;
    localparam S_START = 4'b0010;
    localparam S_DATA  = 4'b0100;
    localparam S_STOP  = 4'b1000;
    localparam S_LAST  = 4'b0000;

    // Shift register to sample incoming rxd signal
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            reg_rxd <= 3'b111;
        end else begin
            reg_rxd <= {reg_rxd[1:0], rxd};
        end
    end

    // Detect start bit (falling edge on rxd)
    wire detect_startbit = (reg_rxd[2:1] == 2'b10);

    // Sample at the middle of the bit period
    wire sample_point = (sample_count == 2'b11);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sample_count <= 2'b00;
            bit_count <= 3'b000;
            rx_data <= 8'b0;
            state <= S_IDLE;
            valid <= 1'b0;
        end else begin
            case (state)
                S_IDLE: begin
                    if (detect_startbit) begin
                        state <= S_START;
                        sample_count <= 2'b00;
                    end
                    valid <= 1'b0;
                end

                S_START: begin
                    if (sample_point) begin
                        if (reg_rxd[0] == 1'b0) begin
                            state <= S_DATA;
                            sample_count <= 2'b00;
                            bit_count <= 3'b000;
                        end else begin
                            state <= S_IDLE;
                        end
                    end else begin
                        sample_count <= sample_count + 1'b1;
                    end
                end

                S_DATA: begin
                    if (sample_point) begin
                        rx_data <= {rx_data[6:0], reg_rxd[0]};
                        bit_count <= bit_count + 1'b1;
                        if (bit_count == 3'b111) begin
                            state <= S_STOP;
                        end
                    end
                    sample_count <= sample_count + 1'b1;
                end

                S_STOP: begin
                    if (sample_point) begin
                        if (reg_rxd[0] == 1'b1) begin
                            state <= S_LAST;
                        end else begin
                            state <= S_IDLE;
                        end
                    end
                    sample_count <= sample_count + 1'b1;
                end

                S_LAST: begin
                    data <= rx_data;
                    valid <= 1'b1;
                    state <= S_IDLE;
                end
            endcase
        end
    end

endmodule