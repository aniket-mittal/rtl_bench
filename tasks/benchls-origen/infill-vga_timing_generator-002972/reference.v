module origen_002972 (
    input wire vga_clk,
    input wire s_rst_n,
    output reg h_sync,
    output reg v_sync,
    output reg h_de,
    output reg de,
    output reg po_start_flag
);

    // Timing parameters
    parameter H_TOTAL = 1344;
    parameter H_SYNC = 136;
    parameter H_BACK_PORCH = 160;
    parameter H_ACTIVE = 1024;
    parameter H_FRONT_PORCH = 24;

    parameter V_TOTAL = 806;
    parameter V_SYNC = 6;
    parameter V_BACK_PORCH = 29;
    parameter V_ACTIVE = 768;
    parameter V_FRONT_PORCH = 3;

    // Counters
    reg [10:0] h_cnt;
    reg [9:0] v_cnt;

    // State parameters
    localparam SYNC = 2'b00;
    localparam BACK_PORCH = 2'b01;
    localparam ACTIVE = 2'b10;
    localparam FRONT_PORCH = 2'b11;

    reg [1:0] h_state;
    reg [1:0] v_state;

    // Counter logic
    always @(posedge vga_clk or negedge s_rst_n) begin
        if (!s_rst_n) begin
            h_cnt <= 11'd0;
            v_cnt <= 10'd0;
        end else begin
            if (h_cnt == H_TOTAL - 1) begin
                h_cnt <= 11'd0;
                if (v_cnt == V_TOTAL - 1)
                    v_cnt <= 10'd0;
                else
                    v_cnt <= v_cnt + 1'b1;
            end else begin
                h_cnt <= h_cnt + 1'b1;
            end
        end
    end

    // Horizontal state machine
    always @(posedge vga_clk or negedge s_rst_n) begin
        if (!s_rst_n) begin
            h_state <= SYNC;
        end else begin
            case (h_state)
                SYNC: if (h_cnt == H_SYNC - 1) h_state <= BACK_PORCH;
                BACK_PORCH: if (h_cnt == H_SYNC + H_BACK_PORCH - 1) h_state <= ACTIVE;
                ACTIVE: if (h_cnt == H_SYNC + H_BACK_PORCH + H_ACTIVE - 1) h_state <= FRONT_PORCH;
                FRONT_PORCH: if (h_cnt == H_TOTAL - 1) h_state <= SYNC;
            endcase
        end
    end

    // Vertical state machine
    always @(posedge vga_clk or negedge s_rst_n) begin
        if (!s_rst_n) begin
            v_state <= SYNC;
        end else if (h_cnt == H_TOTAL - 1) begin
            case (v_state)
                SYNC: if (v_cnt == V_SYNC - 1) v_state <= BACK_PORCH;
                BACK_PORCH: if (v_cnt == V_SYNC + V_BACK_PORCH - 1) v_state <= ACTIVE;
                ACTIVE: if (v_cnt == V_SYNC + V_BACK_PORCH + V_ACTIVE - 1) v_state <= FRONT_PORCH;
                FRONT_PORCH: if (v_cnt == V_TOTAL - 1) v_state <= SYNC;
            endcase
        end
    end

    // Output logic
    always @(posedge vga_clk or negedge s_rst_n) begin
        if (!s_rst_n) begin
            h_sync <= 1'b0;
            v_sync <= 1'b0;
            h_de <= 1'b0;
            de <= 1'b0;
            po_start_flag <= 1'b0;
        end else begin
            h_sync <= (h_state == SYNC);
            v_sync <= (v_state == SYNC);
            h_de <= (h_state == ACTIVE);
            de <= h_de;
            po_start_flag <= (h_cnt == H_SYNC - 1) && (v_cnt == V_SYNC - 1);
        end
    end

endmodule