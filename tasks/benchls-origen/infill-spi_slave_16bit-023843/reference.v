module origen_023843 (
    input wire clk,
    input wire rst_n,
    input wire [15:0] tx_data,
    input wire wrt,
    input wire SCLK,
    input wire SS_n,
    input wire MOSI,
    output wire MISO,
    output reg [15:0] cmd_rcvd,
    output reg cmd_rdy,
    output reg rsp_rdy
);

    // State definition
    localparam IDLE = 1'b0;
    localparam TX   = 1'b1;

    reg state, next_state;
    reg [15:0] shft_reg, buffer;
    reg [4:0] bit_cnt;

    // Synchronizers
    reg [2:0] SCLK_ff, SS_n_ff, MOSI_ff;

    // Edge detection
    wire SCLK_negedge = SCLK_ff[2] & ~SCLK_ff[1];

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            SCLK_ff <= 3'b111;
            SS_n_ff <= 3'b111;
            MOSI_ff <= 3'b000;
        end else begin
            SCLK_ff <= {SCLK_ff[1:0], SCLK};
            SS_n_ff <= {SS_n_ff[1:0], SS_n};
            MOSI_ff <= {MOSI_ff[1:0], MOSI};
        end
    end

    // FSM state transition
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = (SS_n_ff[1] == 1'b0) ? TX : IDLE;
            TX:   next_state = (SS_n_ff[1] == 1'b1) ? IDLE : TX;
            default: next_state = IDLE;
        endcase
    end

    // Shift register and bit counter
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            shft_reg <= 16'h0000;
            bit_cnt <= 5'b00000;
        end else if (state == IDLE && next_state == TX) begin
            shft_reg <= buffer;
            bit_cnt <= 5'b00000;
        end else if (state == TX && SCLK_negedge && ~SS_n_ff[1]) begin
            shft_reg <= {shft_reg[14:0], MOSI_ff[1]};
            bit_cnt <= bit_cnt + 1'b1;
        end
    end

    // Buffer and rsp_rdy handling
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            buffer <= 16'h0000;
            rsp_rdy <= 1'b0;
        end else if (wrt) begin
            buffer <= tx_data;
            rsp_rdy <= 1'b1;
        end else if (state == IDLE && next_state == TX) begin
            rsp_rdy <= 1'b0;
        end
    end

    // cmd_rcvd and cmd_rdy handling
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            cmd_rcvd <= 16'h0000;
            cmd_rdy <= 1'b0;
        end else if (state == TX && next_state == IDLE) begin
            cmd_rcvd <= shft_reg;
            cmd_rdy <= 1'b1;
        end else if (state == IDLE) begin
            cmd_rdy <= 1'b0;
        end
    end

    // MISO output
    assign MISO = shft_reg[15];

endmodule