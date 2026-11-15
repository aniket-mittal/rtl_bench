module origen_213111(
    input clk,
    input reset,
    input [7:0] red,
    input [7:0] green,
    input [7:0] blue,
    output reg [7:0] r,
    output reg [7:0] g,
    output reg [7:0] b,
    output reg hsync,
    output reg vsync
);

    reg [10:0] hcount;
    reg [9:0] vcount;
    reg videoh;
    reg videov;

    always @(posedge clk) begin
        if (reset) begin
            hcount <= 0;
            vcount <= 0;
        end
        else begin
            hcount <= (hcount == 799) ? 0 : hcount + 1;
            if (hcount == 699) begin
                vcount <= (vcount == 524) ? 0 : vcount + 1;
            end
        end
    end

    always @(*)begin
        videoh = (hcount < 640);
        videov = (vcount < 480);
    end

    always @(*)begin
        hsync = (hcount >= 659 && hcount <= 755) ? 0 : 1;
        vsync = (vcount >= 493 && vcount <= 494) ? 0 : 1;
    end

    always @(*)begin
        if (videoh && videov) begin
            r = red;
            g = green;
            b = blue;
        end
        else begin
            r = 0;
            g = 0;
            b = 0;
        end
    end

endmodule