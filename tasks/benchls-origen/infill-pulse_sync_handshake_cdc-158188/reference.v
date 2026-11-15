module origen_158188 (
    input src_clk,
    input src_rst_n,
    input src_pulse,
    input dst_clk,
    input dst_rst_n,
    output reg src_sync_fail,
    output reg dst_pulse
);

    reg src_sync_req;
    reg src_sync_ack;
    reg [1:0] dst_req_state;
    reg req_state_dly1, req_state_dly2;
    reg dst_sync_ack;

    always @(posedge src_clk or negedge src_rst_n) begin
        if (!src_rst_n) begin
            src_sync_req <= 1'b0;
            src_sync_fail <= 1'b0;
        end
        else begin
            if (src_pulse) begin
                if (src_sync_ack) begin
                    src_sync_req <= 1'b0;
                    src_sync_fail <= 1'b0;
                end
                else begin
                    src_sync_req <= 1'b1;
                    src_sync_fail <= 1'b1;
                end
            end
            else begin
                src_sync_req <= 1'b0;
                src_sync_fail <= 1'b0;
            end
        end
    end

    always @(posedge dst_clk or negedge dst_rst_n) begin
        if (!dst_rst_n) begin
            dst_req_state <= 2'b00;
            req_state_dly1 <= 1'b0;
            req_state_dly2 <= 1'b0;
            dst_sync_ack <= 1'b0;
            dst_pulse <= 1'b0;
        end
        else begin
            req_state_dly1 <= dst_req_state[1];
            req_state_dly2 <= req_state_dly1;

            case (dst_req_state)
                2'b00: begin
                    if (src_sync_req) begin
                        dst_req_state <= 2'b01;
                        dst_sync_ack <= 1'b1;
                    end
                    else begin
                        dst_req_state <= 2'b00;
                        dst_sync_ack <= 1'b0;
                    end
                    dst_pulse <= 1'b0;
                end
                2'b01: begin
                    dst_req_state <= 2'b10;
                    dst_sync_ack <= 1'b1;
                    dst_pulse <= 1'b0;
                end
                2'b10: begin
                    dst_req_state <= 2'b00;
                    dst_sync_ack <= 1'b0;
                    dst_pulse <= ~dst_req_state[1] & req_state_dly2;
                end
                default: begin
                    dst_req_state <= 2'b00;
                    dst_sync_ack <= 1'b0;
                    dst_pulse <= 1'b0;
                end
            endcase
        end
    end

    always @(posedge dst_clk) begin
        if (dst_sync_ack) begin
            src_sync_ack <= 1'b1;
        end
        else begin
            src_sync_ack <= 1'b0;
        end
    end

endmodule