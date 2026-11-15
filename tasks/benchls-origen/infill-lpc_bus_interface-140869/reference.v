module origen_140869 (
    input [3:0] lpc_ad,
    input lpc_clock,
    input lpc_frame,
    input lpc_reset,
    input reset,
    output reg [3:0] out_cyctype_dir,
    output reg [31:0] out_addr,
    output reg [7:0] out_data,
    output reg out_sync_timeout,
    output reg out_clock_enable
);

    // State definitions
    localparam IDLE = 3'd0;
    localparam START = 3'd1;
    localparam CYCTYPE_DIR = 3'd2;
    localparam ADDR = 3'd3;
    localparam DATA = 3'd4;
    localparam SYNC = 3'd5;
    localparam TAR = 3'd6;
    localparam DMA = 3'd7;
    localparam RESERVED = 3'd8;

    reg [2:0] state, next_state;
    reg [5:0] counter;

    always @(posedge lpc_clock or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            counter <= 6'd0;
        end else begin
            state <= next_state;
            if (state == ADDR || state == DATA)
                counter <= counter + 1;
            else
                counter <= 6'd0;
        end
    end

    always @(*) begin
        next_state = state;
        out_cyctype_dir = 4'b0000;
        out_addr = 32'd0;
        out_data = 8'd0;
        out_sync_timeout = 1'b0;
        out_clock_enable = 1'b0;

        case (state)
            IDLE: begin
                if (!lpc_frame)
                    next_state = START;
            end

            START: begin
                if (lpc_frame)
                    next_state = IDLE;
                else
                    next_state = CYCTYPE_DIR;
            end

            CYCTYPE_DIR: begin
                out_cyctype_dir = lpc_ad;
                if (lpc_ad == 4'b0000 || lpc_ad == 4'b0001)
                    next_state = ADDR;
                else if (lpc_ad == 4'b0010)
                    next_state = DMA;
                else if (lpc_ad == 4'b0011)
                    next_state = RESERVED;
                else
                    next_state = IDLE;
            end

            ADDR: begin
                out_addr[counter*4 +: 4] = lpc_ad;
                if (counter == 6'd7)
                    next_state = DATA;
            end

            DATA: begin
                out_data[counter*4 +: 4] = lpc_ad;
                if (counter == 6'd1)
                    next_state = SYNC;
            end

            SYNC: begin
                if (lpc_ad == 4'b0000)
                    next_state = TAR;
                else if (lpc_ad == 4'b1111)
                    out_sync_timeout = 1'b1;
            end

            TAR: begin
                out_clock_enable = 1'b1;
                next_state = IDLE;
            end

            DMA: begin
                if (lpc_ad == 4'b0000)
                    next_state = TAR;
                else if (lpc_ad == 4'b1111)
                    out_sync_timeout = 1'b1;
            end

            RESERVED: begin
                if (lpc_ad == 4'b0000)
                    next_state = TAR;
                else if (lpc_ad == 4'b1111)
                    out_sync_timeout = 1'b1;
            end

            default: next_state = IDLE;
        endcase
    end

endmodule