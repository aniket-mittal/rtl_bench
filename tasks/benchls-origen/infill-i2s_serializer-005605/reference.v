module origen_005605 (
    input wire clk_100m,
    input wire rst_n,
    input wire bclk,
    input wire lrclk,
    input wire [23:0] ldata,
    input wire [23:0] rdata,
    input wire en,
    output reg sdata_o
);

    // State definition
    localparam INIT = 3'd0;
    localparam WAIT_LEFT = 3'd1;
    localparam WRITE_LEFT = 3'd2;
    localparam WAIT_RIGHT = 3'd3;
    localparam WRITE_RIGHT = 3'd4;

    reg [2:0] state, next_state;
    reg [4:0] cnt;
    reg [23:0] ldata_r, rdata_r;
    reg bclk_r, lrclk_r;
    wire bclk_posedge, lrclk_pedge, lrclk_nedge;

    // Edge detection
    assign bclk_posedge = bclk & ~bclk_r;
    assign lrclk_pedge = lrclk & ~lrclk_r;
    assign lrclk_nedge = ~lrclk & lrclk_r;

    // State machine and counter logic
    always @(posedge clk_100m or negedge rst_n) begin
        if (~rst_n) begin
            state <= INIT;
            cnt <= 5'd0;
            ldata_r <= 24'd0;
            rdata_r <= 24'd0;
            bclk_r <= 1'b0;
            lrclk_r <= 1'b0;
        end else begin
            state <= next_state;
            bclk_r <= bclk;
            lrclk_r <= lrclk;

            case (state)
                INIT: begin
                    cnt <= 5'd0;
                    ldata_r <= ldata;
                    rdata_r <= rdata;
                end
                WRITE_LEFT, WRITE_RIGHT: begin
                    if (bclk_posedge) begin
                        cnt <= cnt + 1'b1;
                        if (state == WRITE_LEFT)
                            ldata_r <= {ldata_r[22:0], 1'b0};
                        else
                            rdata_r <= {rdata_r[22:0], 1'b0};
                    end
                end
                default: begin
                    cnt <= 5'd0;
                    ldata_r <= ldata;
                    rdata_r <= rdata;
                end
            endcase
        end
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            INIT:
                if (en) next_state = WAIT_LEFT;
            WAIT_LEFT:
                if (~en) next_state = INIT;
                else if (lrclk_nedge) next_state = WRITE_LEFT;
            WRITE_LEFT:
                if (~en) next_state = INIT;
                else if (cnt == 5'd23 && bclk_posedge) next_state = WAIT_RIGHT;
            WAIT_RIGHT:
                if (~en) next_state = INIT;
                else if (lrclk_pedge) next_state = WRITE_RIGHT;
            WRITE_RIGHT:
                if (~en) next_state = INIT;
                else if (cnt == 5'd23 && bclk_posedge) next_state = WAIT_LEFT;
            default:
                next_state = INIT;
        endcase
    end

    // Output logic
    always @(posedge clk_100m or negedge rst_n) begin
        if (~rst_n) begin
            sdata_o <= 1'b0;
        end else if (bclk_posedge) begin
            case (state)
                WRITE_LEFT: sdata_o <= ldata_r[23];
                WRITE_RIGHT: sdata_o <= rdata_r[23];
                default: sdata_o <= 1'b0;
            endcase
        end
    end

endmodule