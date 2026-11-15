module origen_066663 (
    input wire clk_100,
    input wire reset_,
    input wire partial_mode_selected,
    input wire flaga_d,
    input wire flagb_d,
    output reg slwr_partial_,
    output reg pktend_partial_,
    output reg [31:0] data_out_partial
);

    // State encoding
    localparam [2:0] 
        partial_idle = 3'b000,
        partial_wait_flagb = 3'b001,
        partial_write = 3'b010,
        partial_write_wr_delay = 3'b011,
        partial_wait = 3'b100;

    reg [2:0] state, next_state;
    reg [3:0] strob_cnt;
    reg [3:0] short_pkt_cnt;
    reg [31:0] data_gen_partial;
    reg strob;

    // State machine
    always @(posedge clk_100 or negedge reset_) begin
        if (!reset_)
            state <= partial_idle;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            partial_idle:
                if (partial_mode_selected && flaga_d)
                    next_state = partial_wait_flagb;
            partial_wait_flagb:
                if (flagb_d)
                    next_state = partial_write;
            partial_write:
                if (!flagb_d || short_pkt_cnt == 4'hF)
                    next_state = partial_write_wr_delay;
            partial_write_wr_delay:
                next_state = partial_wait;
            partial_wait:
                if (strob_cnt == 4'h7)
                    next_state = partial_idle;
        endcase
    end

    // Output and counter logic
    always @(posedge clk_100 or negedge reset_) begin
        if (!reset_) begin
            slwr_partial_ <= 1'b1;
            pktend_partial_ <= 1'b1;
            data_out_partial <= 32'h0;
            strob_cnt <= 4'h0;
            short_pkt_cnt <= 4'h0;
            data_gen_partial <= 32'h0;
            strob <= 1'b0;
        end else begin
            case (state)
                partial_idle: begin
                    slwr_partial_ <= 1'b1;
                    pktend_partial_ <= 1'b1;
                    strob_cnt <= 4'h0;
                    short_pkt_cnt <= 4'h0;
                    strob <= 1'b0;
                end
                partial_wait_flagb: begin
                    slwr_partial_ <= 1'b1;
                    pktend_partial_ <= 1'b1;
                end
                partial_write: begin
                    if (flagb_d) begin
                        slwr_partial_ <= 1'b0;
                        data_out_partial <= data_gen_partial;
                        data_gen_partial <= data_gen_partial + 1;
                        short_pkt_cnt <= short_pkt_cnt + 1;
                    end else begin
                        slwr_partial_ <= 1'b1;
                    end
                    if (short_pkt_cnt == 4'hF) begin
                        pktend_partial_ <= 1'b0;
                    end
                end
                partial_write_wr_delay: begin
                    slwr_partial_ <= 1'b1;
                    pktend_partial_ <= 1'b1;
                end
                partial_wait: begin
                    slwr_partial_ <= 1'b1;
                    pktend_partial_ <= 1'b1;
                    strob_cnt <= strob_cnt + 1;
                    if (strob_cnt == 4'h7) begin
                        strob <= 1'b1;
                    end
                end
            endcase
        end
    end

endmodule