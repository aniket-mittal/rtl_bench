module origen_072936 (
    input wire clk,
    input wire rst,
    output reg vga_hs,
    output reg vga_vs,
    output reg vga_clk,
    output reg bright,
    output reg vga_blank_n,
    output reg [9:0] hcount,
    output reg [9:0] vcount,
    output reg [5:0] addr,
    output reg [2:0] letteraddr,
    output reg [2:0] numberaddr,
    output reg [5:0] column,
    output reg [5:0] row
);

    // VGA timing parameters
    parameter H_TOTAL = 800;
    parameter H_SYNC = 96;
    parameter H_BACK = 48;
    parameter H_ACTIVE = 640;
    parameter H_FRONT = 16;
    parameter V_TOTAL = 525;
    parameter V_SYNC = 2;
    parameter V_BACK = 33;
    parameter V_ACTIVE = 400;
    parameter V_FRONT = 90;

    // Clock division
    reg [1:0] clk_div;
    always @(posedge clk or posedge rst) begin
        if (rst)
            clk_div <= 2'b00;
        else
            clk_div <= clk_div + 1'b1;
    end
    always @(posedge clk) vga_clk <= clk_div[1];

    // Horizontal and vertical counters
    always @(posedge vga_clk or posedge rst) begin
        if (rst) begin
            hcount <= 10'd0;
            vcount <= 10'd0;
        end else begin
            if (hcount == H_TOTAL - 1) begin
                hcount <= 10'd0;
                if (vcount == V_TOTAL - 1)
                    vcount <= 10'd0;
                else
                    vcount <= vcount + 1'b1;
            end else begin
                hcount <= hcount + 1'b1;
            end
        end
    end

    // Sync signals
    always @(posedge vga_clk or posedge rst) begin
        if (rst) begin
            vga_hs <= 1'b1;
            vga_vs <= 1'b1;
        end else begin
            vga_hs <= (hcount < H_SYNC) ? 1'b0 : 1'b1;
            vga_vs <= (vcount < V_SYNC) ? 1'b0 : 1'b1;
        end
    end

    // Active display area and blanking
    wire h_active = (hcount >= H_SYNC + H_BACK) && (hcount < H_SYNC + H_BACK + H_ACTIVE);
    wire v_active = (vcount >= V_SYNC + V_BACK) && (vcount < V_SYNC + V_BACK + V_ACTIVE);
    
    always @(posedge vga_clk or posedge rst) begin
        if (rst) begin
            bright <= 1'b0;
            vga_blank_n <= 1'b0;
        end else begin
            bright <= h_active && v_active;
            vga_blank_n <= h_active && v_active;
        end
    end

    // Character cell addressing
    always @(posedge vga_clk) begin
        if (bright) begin
            column <= (hcount - H_SYNC - H_BACK) / 40;
            row <= (vcount - V_SYNC - V_BACK) / 40;
            letteraddr <= (hcount - H_SYNC - H_BACK) % 40 / 5;
            numberaddr <= (vcount - V_SYNC - V_BACK) % 40 / 5;
            addr <= {row[2:0], column[2:0]};
        end else begin
            column <= 6'd0;
            row <= 6'd0;
            letteraddr <= 3'd0;
            numberaddr <= 3'd0;
            addr <= 6'd0;
        end
    end

endmodule