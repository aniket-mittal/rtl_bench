module origen_199547 #(
    parameter DATA_BITS = 32,
    parameter BCNT = 1,
    parameter DSTRB = 0
) (
    input  wire        xrst,
    input  wire        xclk,
    output reg         xBrise,
    output reg         xBfall,
    output reg         xLRrise,
    output reg         xLRfall,
    output reg [31:0]  xData,
    output reg         xData_rdy,
    input  wire        BCLK,
    input  wire        LRCLK,
    input  wire [15:0] din
);

    localparam IF_TPD = 1;

    reg [3:0]  shift_cnt;
    reg [15:0] temp_data;
    reg        b_clk, bc1, bc0;
    reg        xlrclk, lr1, lr0;
    reg [15:0] d2, d1, d0;

    always @(posedge xclk or posedge xrst) begin
        if (xrst) begin
            shift_cnt <= 0;
            temp_data <= 0;
            b_clk <= 0;
            bc1 <= 0;
            bc0 <= 0;
            xlrclk <= 0;
            lr1 <= 0;
            lr0 <= 0;
            d2 <= 0;
            d1 <= 0;
            d0 <= 0;
            xData <= 0;
            xData_rdy <= 0;
            xBrise <= 0;
            xBfall <= 0;
            xLRrise <= 0;
            xLRfall <= 0;
        end else begin
            b_clk <= BCLK;
            bc1 <= b_clk;
            bc0 <= bc1;
            xlrclk <= LRCLK;
            lr1 <= xlrclk;
            lr0 <= lr1;
            d2 <= d1;
            d1 <= d0;
            d0 <= din;

            case (shift_cnt)
                4'd0: begin
                    if (xLRfall) begin
                        shift_cnt <= 4'd1;
                        temp_data <= d0;
                    end
                end
                4'd1: begin
                    if (xBrise) begin
                        shift_cnt <= shift_cnt + 1;
                        temp_data <= {temp_data[14:0], d0[DSTRB]};
                    end
                end
                4'd15: begin
                    if (xBrise) begin
                        shift_cnt <= 4'd0;
                        xData[15:0] <= temp_data;
                        xData_rdy <= 1'b1;
                    end
                end
                default: begin
                    if (xBrise) begin
                        shift_cnt <= shift_cnt + 1;
                        temp_data <= {temp_data[14:0], d0[DSTRB]};
                    end
                end
            endcase

            if (xLRrise) begin
                shift_cnt <= 4'd1;
                xData_rdy <= 1'b0;
            end

            xBrise <= bc1 & ~bc0;
            xBfall <= bc0 & ~bc1;
            xLRrise <= lr1 & ~lr0;
            xLRfall <= lr0 & ~lr1;
            xData <= {temp_data, d2, d1, d0[DSTRB]};
        end
    end

endmodule