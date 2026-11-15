module origen_003163 (
    input wire clk_250m,
    input wire reset,
    output reg adc_cnv,
    output reg adc_clk
);

    reg [5:0] cnt_cnv;
    reg [4:0] cnt_clk;
    reg clk_en;

    always @(posedge clk_250m or posedge reset) begin
        if (reset) begin
            cnt_cnv <= 6'd0;
            adc_cnv <= 1'b1;
            clk_en <= 1'b0;
        end else begin
            if (cnt_cnv == 6'd48) begin
                cnt_cnv <= 6'd0;
                adc_cnv <= 1'b1;
                clk_en <= 1'b1;
            end else begin
                cnt_cnv <= cnt_cnv + 1'b1;
                if (cnt_cnv == 6'd19) begin
                    adc_cnv <= 1'b0;
                end
            end
        end
    end

    always @(posedge clk_250m or posedge reset) begin
        if (reset) begin
            cnt_clk <= 5'd0;
            adc_clk <= 1'b0;
        end else if (clk_en) begin
            if (cnt_clk == 5'd15) begin
                cnt_clk <= 5'd0;
                clk_en <= 1'b0;
            end else begin
                cnt_clk <= cnt_clk + 1'b1;
            end
            adc_clk <= ~adc_clk;
        end else begin
            adc_clk <= 1'b0;
        end
    end

endmodule

module ADC7961_dco_dat (
    input wire adc_dco,
    input wire adc_dat,
    input wire adc_cnv,
    input wire reset,
    output reg [15:0] data,
    output reg data_ready
);

    reg [4:0] bit_count;

    always @(posedge adc_dco or posedge reset) begin
        if (reset) begin
            data <= 16'd0;
            bit_count <= 5'd0;
            data_ready <= 1'b0;
        end else begin
            if (adc_cnv) begin
                bit_count <= 5'd0;
                data_ready <= 1'b0;
            end else begin
                if (bit_count < 5'd16) begin
                    data <= {data[14:0], adc_dat};
                    bit_count <= bit_count + 1'b1;
                    if (bit_count == 5'd15) begin
                        data_ready <= 1'b1;
                    end
                end
            end
        end
    end

endmodule

module ADC7961 (
    input wire clk_250m,
    input wire reset,
    input wire adc_dco,
    input wire adc_dat,
    output wire adc_clk,
    output wire adc_cnv,
    output wire [15:0] data,
    output wire data_ready
);

    ADC7961_cnv_clk cnv_clk_inst (
        .clk_250m(clk_250m),
        .reset(reset),
        .adc_cnv(adc_cnv),
        .adc_clk(adc_clk)
    );

    ADC7961_dco_dat dco_dat_inst (
        .adc_dco(adc_dco),
        .adc_dat(adc_dat),
        .adc_cnv(adc_cnv),
        .reset(reset),
        .data(data),
        .data_ready(data_ready)
    );

endmodule