module origen_177171(
    input clk_orig,
    input rst,
    input lev,
    output reg clk_1hz,
    output reg clk_lev,
    output reg clk_screen,
    output reg clk_small
);

    parameter lev1_val = 28'd250_000; // 4 Hz
    parameter lev2_val = 28'd125_000; // 8 Hz
    parameter lev3_val = 28'd62_500;  // 16 Hz

    reg [27:0] clk_cntr_1hz;
    reg [27:0] clk_cntr_small;
    reg [25:0] clk_cntr_screen;
    reg [28:0] clk_cntr_lev;
    reg [1:0] lev_toggle;

    always @(posedge clk_orig or posedge rst) begin
        if (rst) begin
            clk_cntr_1hz <= 28'd0;
            clk_1hz <= 1'b0;
        end else begin
            if (clk_cntr_1hz == 28'd49_999_999) begin
                clk_cntr_1hz <= 28'd0;
                clk_1hz <= ~clk_1hz;
            end else begin
                clk_cntr_1hz <= clk_cntr_1hz + 28'd1;
            end
        end
    end

    always @(posedge clk_orig or posedge rst) begin
        if (rst) begin
            clk_cntr_small <= 28'd0;
            clk_small <= 1'b0;
        end else begin
            if (clk_cntr_small == 28'd2499) begin
                clk_cntr_small <= 28'd0;
                clk_small <= ~clk_small;
            end else begin
                clk_cntr_small <= clk_cntr_small + 28'd1;
            end
        end
    end

    always @(posedge clk_orig or posedge rst) begin
        if (rst) begin
            clk_cntr_screen <= 26'd0;
            clk_screen <= 1'b0;
        end else begin
            if (clk_cntr_screen == 26'd24_999_999) begin
                clk_cntr_screen <= 26'd0;
                clk_screen <= ~clk_screen;
            end else begin
                clk_cntr_screen <= clk_cntr_screen + 26'd1;
            end
        end
    end

    always @(posedge clk_orig or posedge rst) begin
        if (rst) begin
            clk_cntr_lev <= 29'd0;
            lev_toggle <= 2'b00;
            clk_lev <= 1'b0;
        end else begin
            if (lev) begin
                lev_toggle <= lev_toggle + 2'b01;
                if (lev_toggle == 2'b00) begin
                    clk_cntr_lev <= clk_cntr_lev + 29'd1;
                    if (clk_cntr_lev == lev1_val - 29'd1) begin
                        clk_cntr_lev <= 29'd0;
                        clk_lev <= ~clk_lev;
                    end
                end else if (lev_toggle == 2'b01) begin
                    clk_cntr_lev <= clk_cntr_lev + 29'd1;
                    if (clk_cntr_lev == lev2_val - 29'd1) begin
                        clk_cntr_lev <= 29'd0;
                        clk_lev <= ~clk_lev;
                    end
                end else if (lev_toggle == 2'b10) begin
                    clk_cntr_lev <= clk_cntr_lev + 29'd1;
                    if (clk_cntr_lev == lev3_val - 29'd1) begin
                        clk_cntr_lev <= 29'd0;
                        clk_lev <= ~clk_lev;
                    end
                end else begin
                    lev_toggle <= 2'b00;
                end
            end else begin
                clk_cntr_lev <= clk_cntr_lev + 29'd1;
                if (clk_cntr_lev == lev1_val - 29'd1) begin
                    clk_cntr_lev <= 29'd0;
                    clk_lev <= ~clk_lev;
                end
            end
        end
    end

endmodule