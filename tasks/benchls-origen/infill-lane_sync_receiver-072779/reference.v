module origen_072779 (
    input wire reset,
    input wire clk,
    input wire lp_in,
    input wire [7:0] din,
    output reg lane_valid,
    output reg [7:0] lane_dat,
    output reg lane_flag
);

    // State definitions
    localparam [1:0] IDLE = 2'b00,
                     SYNC = 2'b01,
                     END  = 2'b10;

    // Sync pattern and delay parameters
    localparam [7:0] SYNC_PATTERN = 8'h1D;
    localparam [3:0] CHANNEL_DLY1 = 4'd8;
    localparam [3:0] CHANNEL_DLY2 = 4'd7;

    reg [1:0] state, next_state;
    reg [15:0] din_expand;
    reg [3:0] channel_dly1;
    reg sync_dect_find;
    reg [7:0] lane_dat_rev;

    // State machine
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: if (!lp_in) next_state = SYNC;
            SYNC: if (sync_dect_find) next_state = END;
                  else if (lp_in) next_state = IDLE;
            END:  if (lp_in) next_state = IDLE;
        endcase
    end

    // Data expansion and sync detection
    always @(posedge clk) begin
        din_expand <= {din_expand[7:0], din};
        sync_dect_find <= 0;
        if (state == SYNC) begin
            if (din_expand[7:0] == SYNC_PATTERN) begin
                sync_dect_find <= 1;
                channel_dly1 <= CHANNEL_DLY1;
            end else if (din_expand[8:1] == SYNC_PATTERN) begin
                sync_dect_find <= 1;
                channel_dly1 <= CHANNEL_DLY2;
            end else if (din_expand[9:2] == SYNC_PATTERN) begin
                sync_dect_find <= 1;
                channel_dly1 <= 4'd6;
            end else if (din_expand[10:3] == SYNC_PATTERN) begin
                sync_dect_find <= 1;
                channel_dly1 <= 4'd5;
            end else if (din_expand[11:4] == SYNC_PATTERN) begin
                sync_dect_find <= 1;
                channel_dly1 <= 4'd4;
            end else if (din_expand[12:5] == SYNC_PATTERN) begin
                sync_dect_find <= 1;
                channel_dly1 <= 4'd3;
            end else if (din_expand[13:6] == SYNC_PATTERN) begin
                sync_dect_find <= 1;
                channel_dly1 <= 4'd2;
            end else if (din_expand[14:7] == SYNC_PATTERN) begin
                sync_dect_find <= 1;
                channel_dly1 <= 4'd1;
            end
        end
    end

    // Output generation
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            lane_valid <= 0;
            lane_dat <= 8'h00;
            lane_flag <= 0;
        end else begin
            lane_valid <= (state == END);
            lane_flag <= sync_dect_find;
            case (channel_dly1)
                4'd8: lane_dat_rev <= din_expand[7:0];
                4'd7: lane_dat_rev <= din_expand[8:1];
                4'd6: lane_dat_rev <= din_expand[9:2];
                4'd5: lane_dat_rev <= din_expand[10:3];
                4'd4: lane_dat_rev <= din_expand[11:4];
                4'd3: lane_dat_rev <= din_expand[12:5];
                4'd2: lane_dat_rev <= din_expand[13:6];
                4'd1: lane_dat_rev <= din_expand[14:7];
                default: lane_dat_rev <= din_expand[7:0];
            endcase
            lane_dat <= {lane_dat_rev[0], lane_dat_rev[1], lane_dat_rev[2], lane_dat_rev[3],
                         lane_dat_rev[4], lane_dat_rev[5], lane_dat_rev[6], lane_dat_rev[7]};
        end
    end

endmodule