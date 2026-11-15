module origen_001105 #(
    parameter USR_RST_LEAST_CYCLE = 16
) (
    input wire trn_clk,
    input wire usr_rst_clk,
    input wire trn_reset_n,
    input wire RST_USR,
    output reg RST_USR_done,
    output reg usr_rst
);

    // State encoding
    localparam INIT = 2'b00;
    localparam COUNT = 2'b01;
    localparam CLR = 2'b10;

    reg [1:0] state, next_state;
    reg [4:0] reset_counter;
    reg RST_USR_sync1, RST_USR_sync2;
    reg trn_reset_n_sync1, trn_reset_n_sync2;
    reg RST_USR_done_usr_clk;
    reg RST_USR_done_sync1, RST_USR_done_sync2;

    // Double-flop synchronizers
    always @(posedge usr_rst_clk) begin
        RST_USR_sync1 <= RST_USR;
        RST_USR_sync2 <= RST_USR_sync1;
        trn_reset_n_sync1 <= trn_reset_n;
        trn_reset_n_sync2 <= trn_reset_n_sync1;
    end

    // FSM state register
    always @(posedge usr_rst_clk or negedge trn_reset_n_sync2) begin
        if (!trn_reset_n_sync2) begin
            state <= INIT;
            usr_rst <= 1'b1;
            RST_USR_done_usr_clk <= 1'b0;
        end else begin
            state <= next_state;
        end
    end

    // FSM next state logic and output
    always @(*) begin
        next_state = state;
        case (state)
            INIT: begin
                if (RST_USR_sync2) next_state = COUNT;
            end
            COUNT: begin
                if (reset_counter == USR_RST_LEAST_CYCLE - 1) next_state = CLR;
            end
            CLR: begin
                if (!RST_USR_sync2) next_state = INIT;
            end
            default: next_state = INIT;
        endcase
    end

    // Counter and output logic
    always @(posedge usr_rst_clk or negedge trn_reset_n_sync2) begin
        if (!trn_reset_n_sync2) begin
            reset_counter <= 5'b0;
            usr_rst <= 1'b1;
            RST_USR_done_usr_clk <= 1'b0;
        end else begin
            case (state)
                INIT: begin
                    reset_counter <= 5'b0;
                    usr_rst <= 1'b0;
                    RST_USR_done_usr_clk <= 1'b0;
                end
                COUNT: begin
                    reset_counter <= reset_counter + 1'b1;
                    usr_rst <= 1'b1;
                end
                CLR: begin
                    usr_rst <= 1'b0;
                    RST_USR_done_usr_clk <= 1'b1;
                end
            endcase
        end
    end

    // Synchronize RST_USR_done to trn_clk domain
    always @(posedge trn_clk or negedge trn_reset_n) begin
        if (!trn_reset_n) begin
            RST_USR_done_sync1 <= 1'b0;
            RST_USR_done_sync2 <= 1'b0;
            RST_USR_done <= 1'b0;
        end else begin
            RST_USR_done_sync1 <= RST_USR_done_usr_clk;
            RST_USR_done_sync2 <= RST_USR_done_sync1;
            RST_USR_done <= RST_USR_done_sync2;
        end
    end

endmodule