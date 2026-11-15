module origen_121802 (
    input wire clk,
    input wire rst_n,
    input wire SS_n,
    input wire SCLK,
    input wire MOSI,
    input wire edg,
    input wire len8_16,
    input wire [15:0] mask,
    input wire [15:0] match,
    output reg SPItrig
);

    // State definition
    localparam IDLE = 1'b0;
    localparam RX   = 1'b1;

    // Registers for synchronization
    reg [2:0] SS_n_sync, SCLK_sync, MOSI_sync;
    
    // Edge detection
    reg SCLK_prev;
    wire SCLK_rise, SCLK_fall;
    
    // Shift register and counters
    reg [15:0] shft_reg;
    reg [4:0] bit_cnt;
    reg state, next_state;
    reg done;

    // Synchronization
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            SS_n_sync <= 3'b111;
            SCLK_sync <= 3'b000;
            MOSI_sync <= 3'b000;
        end else begin
            SS_n_sync <= {SS_n_sync[1:0], SS_n};
            SCLK_sync <= {SCLK_sync[1:0], SCLK};
            MOSI_sync <= {MOSI_sync[1:0], MOSI};
        end
    end

    // Edge detection
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            SCLK_prev <= 1'b0;
        else
            SCLK_prev <= SCLK_sync[2];
    end

    assign SCLK_rise = SCLK_sync[2] & ~SCLK_prev;
    assign SCLK_fall = ~SCLK_sync[2] & SCLK_prev;

    // State machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            IDLE: next_state = (SS_n_sync[2] == 1'b0) ? RX : IDLE;
            RX:   next_state = (SS_n_sync[2] == 1'b1) ? IDLE : RX;
            default: next_state = IDLE;
        endcase
    end

    // Data reception
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shft_reg <= 16'h0000;
            bit_cnt <= 5'b00000;
            done <= 1'b0;
        end else if (state == RX) begin
            if ((edg && SCLK_rise) || (!edg && SCLK_fall)) begin
                shft_reg <= {shft_reg[14:0], MOSI_sync[2]};
                bit_cnt <= bit_cnt + 1'b1;
                done <= (len8_16 && bit_cnt == 5'b01111) || (!len8_16 && bit_cnt == 5'b00111);
            end
        end else begin
            bit_cnt <= 5'b00000;
            done <= 1'b0;
        end
    end

    // Trigger generation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            SPItrig <= 1'b0;
        else if (done)
            SPItrig <= len8_16 ? ((shft_reg & mask) == (match & mask)) :
                                 ((shft_reg[7:0] & mask[7:0]) == (match[7:0] & mask[7:0]));
        else
            SPItrig <= 1'b0;
    end

endmodule