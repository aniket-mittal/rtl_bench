module origen_087235 #(
    parameter H_FRONT = 16,
    parameter H_SYNC  = 96,
    parameter H_BACK  = 48,
    parameter H_ACT   = 640,
    parameter V_FRONT = 10,
    parameter V_SYNC  = 2,
    parameter V_BACK  = 33,
    parameter V_ACT   = 480,
    parameter H_TOTAL_WIDTH = 10,
    parameter V_TOTAL_WIDTH = 10,
    parameter POLARITY = 1'b0
) (
    input wire clock,
    input wire aresetn,
    input wire [9:0] R_in,
    input wire [9:0] G_in,
    input wire [9:0] B_in,
    output reg [H_TOTAL_WIDTH-1:0] current_x,
    output reg [V_TOTAL_WIDTH-1:0] current_y,
    output wire ready,
    output wire vga_clk,
    output reg [7:0] R_out,
    output reg [7:0] G_out,
    output reg [7:0] B_out,
    output reg h_sync,
    output reg v_sync,
    output wire blank_n,
    output wire sync_n
);

    localparam H_TOTAL = H_FRONT + H_SYNC + H_BACK + H_ACT;
    localparam V_TOTAL = V_FRONT + V_SYNC + V_BACK + V_ACT;

    reg [H_TOTAL_WIDTH-1:0] hor_pos;
    reg [V_TOTAL_WIDTH-1:0] ver_pos;

    assign vga_clk = ~clock;
    assign sync_n = 1'b1;
    assign blank_n = ((hor_pos >= H_FRONT + H_SYNC + H_BACK) && (hor_pos < H_TOTAL) &&
                      (ver_pos >= V_FRONT + V_SYNC + V_BACK) && (ver_pos < V_TOTAL));
    assign ready = blank_n;

    always @(posedge clock or negedge aresetn) begin
        if (!aresetn) begin
            hor_pos <= 0;
            ver_pos <= 0;
            h_sync <= ~POLARITY;
            v_sync <= ~POLARITY;
            current_x <= 0;
            current_y <= 0;
            R_out <= 8'b0;
            G_out <= 8'b0;
            B_out <= 8'b0;
        end else begin
            // Horizontal counter
            if (hor_pos == H_TOTAL - 1) begin
                hor_pos <= 0;
                if (ver_pos == V_TOTAL - 1)
                    ver_pos <= 0;
                else
                    ver_pos <= ver_pos + 1;
            end else begin
                hor_pos <= hor_pos + 1;
            end

            // Horizontal sync
            if ((hor_pos >= H_FRONT) && (hor_pos < H_FRONT + H_SYNC))
                h_sync <= POLARITY;
            else
                h_sync <= ~POLARITY;

            // Vertical sync
            if ((ver_pos >= V_FRONT) && (ver_pos < V_FRONT + V_SYNC))
                v_sync <= POLARITY;
            else
                v_sync <= ~POLARITY;

            // Current pixel coordinates
            if (blank_n) begin
                current_x <= hor_pos - (H_FRONT + H_SYNC + H_BACK);
                current_y <= ver_pos - (V_FRONT + V_SYNC + V_BACK);
                R_out <= R_in[9:2];
                G_out <= G_in[9:2];
                B_out <= B_in[9:2];
            end else begin
                current_x <= 0;
                current_y <= 0;
                R_out <= 8'b0;
                G_out <= 8'b0;
                B_out <= 8'b0;
            end
        end
    end

endmodule