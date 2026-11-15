module origen_053856 (
    input wire vga_clk,
    input wire reset,
    input wire [15:0] vramstart,
    input wire [15:0] cramstart,
    input wire [7:0] vdata,
    output reg [15:0] vaddr,
    output reg [3:0] color,
    output reg hsync,
    output reg vsync
);

    // Timing parameters
    parameter H_VISIBLE = 512;
    parameter H_SYNC_PULSE = 96;
    parameter H_BACK_PORCH = 48;
    parameter H_FRONT_PORCH = 144;
    parameter H_TOTAL = 800;

    parameter V_VISIBLE = 480;
    parameter V_SYNC_PULSE = 2;
    parameter V_BACK_PORCH = 31;
    parameter V_FRONT_PORCH = 11;
    parameter V_TOTAL = 525;

    // Counters
    reg [9:0] c_hor;
    reg [9:0] c_ver;
    reg [3:0] vstate;
    reg [7:0] char_code;
    reg [7:0] char_color;
    reg [7:0] char_bitmap;

    // Character rendering
    parameter CHAR_WIDTH = 16;
    parameter CHAR_HEIGHT = 8;

    always @(posedge vga_clk or posedge reset) begin
        if (reset) begin
            c_hor <= 0;
            c_ver <= 0;
            vstate <= 0;
            vaddr <= vramstart;
            hsync <= 1;
            vsync <= 1;
        end else begin
            // Horizontal counter
            if (c_hor == H_TOTAL - 1) begin
                c_hor <= 0;
                if (c_ver == V_TOTAL - 1)
                    c_ver <= 0;
                else
                    c_ver <= c_ver + 1;
            end else begin
                c_hor <= c_hor + 1;
            end

            // Horizontal sync
            if (c_hor == H_VISIBLE + H_FRONT_PORCH)
                hsync <= 0;
            else if (c_hor == H_VISIBLE + H_FRONT_PORCH + H_SYNC_PULSE)
                hsync <= 1;

            // Vertical sync
            if (c_ver == V_VISIBLE + V_FRONT_PORCH)
                vsync <= 0;
            else if (c_ver == V_VISIBLE + V_FRONT_PORCH + V_SYNC_PULSE)
                vsync <= 1;

            // State machine for character rendering
            case (vstate)
                0: begin // Fetch character
                    vaddr <= vramstart + {c_ver[8:3], c_hor[8:4]};
                    vstate <= 1;
                end
                1: begin // Store character code
                    char_code <= vdata;
                    vaddr <= vramstart + {c_ver[8:3], c_hor[8:4]} + 1;
                    vstate <= 2;
                end
                2: begin // Store character color
                    char_color <= vdata;
                    vaddr <= cramstart + {char_code, c_ver[2:0]};
                    vstate <= 3;
                end
                3: begin // Store bitmap data
                    char_bitmap <= vdata;
                    vstate <= 4;
                end
                4: begin // Output color
                    if (char_bitmap[7-c_hor[3:0]])
                        color <= char_color[7:4]; // Foreground color
                    else
                        color <= char_color[3:0]; // Background color
                    
                    if (c_hor[3:0] == 15)
                        vstate <= 0;
                    else
                        vstate <= 4;
                end
                default: vstate <= 0;
            endcase
        end
    end

endmodule