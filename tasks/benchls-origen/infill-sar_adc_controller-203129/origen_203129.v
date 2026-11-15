module origen_203129(
    input wire st_conv,
    output wire clkout,
    input wire clkin,
    output wire sample,
    output wire [11:0] result,
    output wire [11:0] dac_value,
    input wire comp_in,
    output wire adc_done,
    input wire rst
);

    localparam S_WAIT = 2'b00;
    localparam S_SAMPLE = 2'b01;
    localparam S_CONV = 2'b10;
    localparam S_DONE = 2'b11;

    reg [1:0] state;
    reg [11:0] steps [13:0];
    reg [11:0] dac_reg;
    reg [3:0] count;
    reg sample_reg;
    reg adc_done_reg;

    assign clkout = (state == S_CONV) ? clkin : 1'b0;
    assign sample = sample_reg;
    assign result = dac_reg;
    assign dac_value = steps[count];
    assign adc_done = adc_done_reg;

    initial begin
        state <= S_WAIT;
        dac_reg <= 12'b0;
        count <= 4'b0;
        sample_reg <= 1'b0;
        adc_done_reg <= 1'b0;
        steps[0] <= 12'h800;
        steps[1] <= 12'hc00;
        steps[2] <= 12'ha00;
        steps[3] <= 12'hb00;
        steps[4] <= 12'h980;
        steps[5] <= 12'ha80;
        steps[6] <= 12'hb80;
        steps[7] <= 12'ha40;
        steps[8] <= 12'hb40;
        steps[9] <= 12'ha60;
        steps[10] <= 12'hb60;
        steps[11] <= 12'ha50;
        steps[12] <= 12'hb50;
        steps[13] <= 12'ha58;
    end

    [MASKED]

endmodule