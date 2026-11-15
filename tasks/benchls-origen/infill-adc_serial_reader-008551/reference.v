module origen_008551 #(
    parameter SCLK_DIV_POWER = 3
)(
    input wire clk_100MHz,
    input wire DRDY_Bar,
    input wire DOUT,
    output reg CLK,
    output reg SCLK,
    output reg FLAG__New_Data,
    output reg [15:0] DATA
);

    // Clock divider
    reg [SCLK_DIV_POWER-1:0] clk_div_counter = 0;
    always @(posedge clk_100MHz) begin
        clk_div_counter <= clk_div_counter + 1;
        CLK <= clk_div_counter[SCLK_DIV_POWER-1];
        SCLK <= ~clk_div_counter[SCLK_DIV_POWER-1];
    end

    // State definition
    localparam IDLE = 1'b0;
    localparam DATA_READ = 1'b1;

    reg state = IDLE;
    reg [3:0] Data_Count = 0;
    reg [14:0] TEMP_DATA = 0;
    reg DRDY_Bar_prev = 1'b1;

    always @(negedge SCLK) begin
        DRDY_Bar_prev <= DRDY_Bar;

        case (state)
            IDLE: begin
                FLAG__New_Data <= 1'b0;
                if (DRDY_Bar && !DRDY_Bar_prev) begin
                    state <= DATA_READ;
                    Data_Count <= 4'd0;
                    TEMP_DATA <= 15'd0;
                end
            end

            DATA_READ: begin
                if (Data_Count < 4'd15) begin
                    TEMP_DATA <= {TEMP_DATA[13:0], DOUT};
                    Data_Count <= Data_Count + 1'b1;
                end else begin
                    DATA <= {TEMP_DATA, DOUT};
                    FLAG__New_Data <= 1'b1;
                    state <= IDLE;
                end
            end
        endcase
    end

endmodule