module origen_148357 (
    input wire [5:0] mwaddr,
    input wire [5:0] mraddr,
    input wire win_ready,
    input wire win_valid,
    input wire [16:0] mrdata_s,
    input wire clk,
    output reg mrd,
    output reg mrvalid,
    output reg [16:0] mrdata,
    output reg [16:0] mdata_0,
    output reg [16:0] mdata_1,
    output reg [16:0] mdata_2,
    output reg [16:0] mdata_3,
    output reg mvalid_0,
    output reg mvalid_1,
    output reg mvalid_2,
    output reg mvalid_3,
    output reg win_last,
    output reg [67:0] win_data,
    output reg adc_ready,
    output reg win_valid_out
);

reg mrd_s;
reg [6:0] maddrdiff_s;
reg mxfer_s;
reg [5:0] maddrdiff;
reg [1:0] mwcnt, mrcnt;
reg [5:0] mraddr_reg;

always @(*) begin
    mrd_s = (mwaddr == mraddr_reg) ? 1'b0 : win_ready;
    maddrdiff_s = {1'b1, mwaddr} - mraddr_reg;
    mxfer_s = win_ready | ~win_valid;
    maddrdiff = maddrdiff_s[5:0];
    adc_ready = (maddrdiff >= 6'd32) ? 1'b0 : (maddrdiff <= 6'd20) ? 1'b1 : adc_ready;
end

always @(posedge clk) begin
    if (mrd_s) mraddr_reg <= mraddr_reg + 1'b1;
    mrd <= mrd_s;
    mrvalid <= mrd;
    mrdata <= mrdata_s;
end

always @(posedge clk) begin
    if (mrvalid) mwcnt <= mwcnt + 1'b1;

    case (mwcnt)
        2'd0: begin
            if (mrvalid) begin
                mvalid_0 <= 1'b1;
                mdata_0 <= mrdata;
            end
            if (mrcnt == 2'd0 && mxfer_s) begin
                mvalid_0 <= 1'b0;
                mdata_0 <= 17'd0;
            end
        end
        2'd1: begin
            if (mrvalid) begin
                mvalid_1 <= 1'b1;
                mdata_1 <= mrdata;
            end
            if (mrcnt == 2'd1 && mxfer_s) begin
                mvalid_1 <= 1'b0;
                mdata_1 <= 17'd0;
            end
        end
        2'd2: begin
            if (mrvalid) begin
                mvalid_2 <= 1'b1;
                mdata_2 <= mrdata;
            end
            if (mrcnt == 2'd2 && mxfer_s) begin
                mvalid_2 <= 1'b0;
                mdata_2 <= 17'd0;
            end
        end
        2'd3: begin
            if (mrvalid) begin
                mvalid_3 <= 1'b1;
                mdata_3 <= mrdata;
            end
            if (mrcnt == 2'd3 && mxfer_s) begin
                mvalid_3 <= 1'b0;
                mdata_3 <= 17'd0;
            end
        end
    endcase
end

always @(posedge clk) begin
    if (mrcnt != mwcnt && win_ready) mrcnt <= mrcnt + 1'b1;

    if (~win_valid || win_ready) begin
        case (mrcnt)
            2'd0: begin
                win_valid_out <= mvalid_0;
                win_data <= {mdata_3, mdata_2, mdata_1, mdata_0};
                win_last <= mvalid_0 & ~mvalid_1 & ~mvalid_2 & ~mvalid_3;
            end
            2'd1: begin
                win_valid_out <= mvalid_1;
                win_data <= {mdata_0, mdata_3, mdata_2, mdata_1};
                win_last <= mvalid_1 & ~mvalid_2 & ~mvalid_3 & ~mvalid_0;
            end
            2'd2: begin
                win_valid_out <= mvalid_2;
                win_data <= {mdata_1, mdata_0, mdata_3, mdata_2};
                win_last <= mvalid_2 & ~mvalid_3 & ~mvalid_0 & ~mvalid_1;
            end
            2'd3: begin
                win_valid_out <= mvalid_3;
                win_data <= {mdata_2, mdata_1, mdata_0, mdata_3};
                win_last <= mvalid_3 & ~mvalid_0 & ~mvalid_1 & ~mvalid_2;
            end
        endcase
    end
end

initial begin
    mraddr_reg = 6'd0;
end

endmodule