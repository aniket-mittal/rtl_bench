module origen_201280 #(
    parameter FA_DIVISOR = 8'd100,
    parameter WATCHDOG   = 16'd10000
)
(
    input  wire       clk,
    input  wire       triggerIn,
    input  wire       FAenable,
    output wire       FAmarker,
    output reg        isSynchronized,
    output reg        triggered
);

    reg [7:0] fa_counter;
    reg [7:0] fa_stretch;
    reg [15:0] watchdog;

    reg triggerIn_d1;

    always @(posedge clk) begin
        triggerIn_d1 <= triggerIn;

        if (FAenable) begin
            if (fa_counter == 0) begin
                fa_counter <= FA_DIVISOR - 1;
                fa_stretch <= 8'd255;
            end else begin
                fa_counter <= fa_counter - 1;
                fa_stretch <= (fa_stretch != 0) ? fa_stretch - 1 : 0;
            end
        end else begin
            fa_counter <= 0;
            fa_stretch <= 0;
        end

        if (triggerIn && ~triggerIn_d1) begin
            if (fa_counter == 0) begin
                isSynchronized <= 1'b1;
            end else begin
                isSynchronized <= 1'b0;
            end
            triggered <= 1'b1;
            watchdog <= WATCHDOG;
        end else begin
            if (watchdog != 0) begin
                watchdog <= watchdog - 1;
            end else begin
                triggered <= 1'b0;
            end
        end
    end

    assign FAmarker = (fa_stretch != 0);

endmodule