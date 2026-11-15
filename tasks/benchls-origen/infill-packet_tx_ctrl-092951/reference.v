module origen_092951 #(
    parameter width_data = 64,
    parameter width_meta = 128
) (
    input wire clk,
    input wire reset,
    input wire [width_data-1:0] cdp2um_data,
    input wire cdp2um_data_valid,
    output reg [width_meta-1:0] metadata,
    output reg metadata_valid,
    output reg [width_data-1:0] pkt,
    output reg pkt_valid,
    output reg um2cdp_path,
    output reg um2cdp_tx_enable,
    input wire [9:0] transmit_usedw
);

    // State definitions
    localparam IDLE = 2'b00;
    localparam PKT_TRANS_S = 2'b01;

    reg [1:0] state, next_state;
    reg [2:0] tx_enable_state, next_tx_enable_state;

    // State machine
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            tx_enable_state <= 3'b000;
        end else begin
            state <= next_state;
            tx_enable_state <= next_tx_enable_state;
        end
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        next_tx_enable_state = tx_enable_state;

        case (state)
            IDLE:
                if (cdp2um_data_valid && cdp2um_data[width_data-1:width_data-3] == 3'b101)
                    next_state = PKT_TRANS_S;
            PKT_TRANS_S:
                if (cdp2um_data_valid && cdp2um_data[width_data-1:width_data-3] == 3'b110)
                    next_state = IDLE;
        endcase

        // TX enable state machine
        case (tx_enable_state)
            3'b000: if (cdp2um_data_valid) next_tx_enable_state = 3'b001;
            3'b001: next_tx_enable_state = 3'b010;
            3'b010: next_tx_enable_state = 3'b011;
            3'b011: if (!cdp2um_data_valid) next_tx_enable_state = 3'b100;
            3'b100: next_tx_enable_state = 3'b000;
            default: next_tx_enable_state = 3'b000;
        endcase
    end

    // Output logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            metadata <= {width_meta{1'b0}};
            metadata_valid <= 1'b0;
            pkt <= {width_data{1'b0}};
            pkt_valid <= 1'b0;
            um2cdp_path <= 1'b0;
            um2cdp_tx_enable <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (cdp2um_data_valid && cdp2um_data[width_data-1:width_data-3] == 3'b101) begin
                        metadata <= {{width_meta-48{1'b0}}, cdp2um_data[width_data-4:width_data-51]};
                        metadata_valid <= 1'b1;
                        pkt <= cdp2um_data;
                        pkt_valid <= 1'b1;
                    end else begin
                        metadata_valid <= 1'b0;
                        pkt_valid <= 1'b0;
                    end
                end
                PKT_TRANS_S: begin
                    metadata_valid <= 1'b0;
                    if (cdp2um_data_valid) begin
                        pkt <= cdp2um_data;
                        pkt_valid <= 1'b1;
                    end else begin
                        pkt_valid <= 1'b0;
                    end
                end
            endcase

            um2cdp_path <= (transmit_usedw < 10'd512);
            um2cdp_tx_enable <= (tx_enable_state == 3'b010);
        end
    end

endmodule