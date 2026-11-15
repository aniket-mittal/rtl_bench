module origen_072932(
    input clk,
    input reset,
    input switch,
    output reg hsync,
    output reg vsync,
    output reg [9:0] hc,
    output reg [9:0] vc,
    output reg disp_on
);

    parameter hpixels = 800;
    parameter vlines = 521;

    reg vsenable;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            hc <= 10'd0;
            vsenable <= 1'b0;
        end else if (switch) begin
            if (hc == hpixels - 1) begin
                hc <= 10'd0;
                vsenable <= 1'b1;
            end else begin
                hc <= hc + 1'b1;
                vsenable <= 1'b0;
            end
        end
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            vc <= 10'd0;
        end else if (switch && vsenable) begin
            if (vc == vlines - 1) begin
                vc <= 10'd0;
            end else begin
                vc <= vc + 1'b1;
            end
        end
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            hsync <= 1'b1;
            vsync <= 1'b1;
            disp_on <= 1'b0;
        end else if (switch) begin
            hsync <= (hc < 10'd8) || (hc > 10'd103);
            vsync <= (vc < 10'd2) || (vc > 10'd3);
            disp_on <= (hc >= 10'd152) && (hc < 10'd791) && (vc >= 10'd37) && (vc < 10'd516);
        end
    end

endmodule