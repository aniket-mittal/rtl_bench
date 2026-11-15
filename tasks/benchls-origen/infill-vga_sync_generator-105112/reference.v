module origen_105112 (
    input wire clk_50,
    input wire n_reset,
    output reg h_sync,
    output reg v_sync,
    output reg bright,
    output reg [9:0] h_count,
    output reg [8:0] v_count
);

    // Clock generation
    reg clk_25;
    always @(posedge clk_50 or negedge n_reset) begin
        if (!n_reset)
            clk_25 <= 1'b0;
        else
            clk_25 <= ~clk_25;
    end

    // State definitions
    localparam [1:0] PW = 2'b00, BP = 2'b01, DISP = 2'b10, FP = 2'b11;

    // Horizontal timing parameters
    localparam H_PW = 96, H_BP = 48, H_DISP = 640, H_FP = 16;

    // Vertical timing parameters
    localparam V_PW = 2, V_BP = 29, V_DISP = 480, V_FP = 10;

    // State and counter registers
    reg [1:0] h_state, v_state;
    reg [6:0] h_timer;
    reg [4:0] v_timer;

    // Horizontal timing state machine
    always @(posedge clk_25 or negedge n_reset) begin
        if (!n_reset) begin
            h_state <= PW;
            h_timer <= 7'd0;
            h_sync <= 1'b0;
            h_count <= 10'd0;
        end else begin
            case (h_state)
                PW: begin
                    h_sync <= 1'b0;
                    if (h_timer == H_PW - 1) begin
                        h_state <= BP;
                        h_timer <= 7'd0;
                    end else
                        h_timer <= h_timer + 1;
                end
                BP: begin
                    h_sync <= 1'b1;
                    if (h_timer == H_BP - 1) begin
                        h_state <= DISP;
                        h_timer <= 7'd0;
                        h_count <= 10'd0;
                    end else
                        h_timer <= h_timer + 1;
                end
                DISP: begin
                    h_sync <= 1'b1;
                    if (h_count == H_DISP - 1) begin
                        h_state <= FP;
                        h_timer <= 7'd0;
                    end else begin
                        h_count <= h_count + 1;
                        h_timer <= h_timer + 1;
                    end
                end
                FP: begin
                    h_sync <= 1'b1;
                    if (h_timer == H_FP - 1) begin
                        h_state <= PW;
                        h_timer <= 7'd0;
                    end else
                        h_timer <= h_timer + 1;
                end
            endcase
        end
    end

    // Vertical timing state machine
    always @(posedge h_sync or negedge n_reset) begin
        if (!n_reset) begin
            v_state <= PW;
            v_timer <= 5'd0;
            v_sync <= 1'b0;
            v_count <= 9'd0;
        end else begin
            case (v_state)
                PW: begin
                    v_sync <= 1'b0;
                    if (v_timer == V_PW - 1) begin
                        v_state <= BP;
                        v_timer <= 5'd0;
                    end else
                        v_timer <= v_timer + 1;
                end
                BP: begin
                    v_sync <= 1'b1;
                    if (v_timer == V_BP - 1) begin
                        v_state <= DISP;
                        v_timer <= 5'd0;
                        v_count <= 9'd0;
                    end else
                        v_timer <= v_timer + 1;
                end
                DISP: begin
                    v_sync <= 1'b1;
                    if (v_count == V_DISP - 1) begin
                        v_state <= FP;
                        v_timer <= 5'd0;
                    end else begin
                        v_count <= v_count + 1;
                        v_timer <= v_timer + 1;
                    end
                end
                FP: begin
                    v_sync <= 1'b1;
                    if (v_timer == V_FP - 1) begin
                        v_state <= PW;
                        v_timer <= 5'd0;
                    end else
                        v_timer <= v_timer + 1;
                end
            endcase
        end
    end

    // Bright signal generation
    always @(posedge clk_25 or negedge n_reset) begin
        if (!n_reset)
            bright <= 1'b0;
        else
            bright <= (h_state == DISP) && (v_state == DISP);
    end

endmodule