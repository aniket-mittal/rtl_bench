module origen_062424 #(
    parameter ADC_PHYS_WIDTH = 14
) (
    input wire CLK,
    input wire RESET,
    input wire conv_en,
    input wire [ADC_PHYS_WIDTH-1:0] adc_data_in,
    input wire [ADC_PHYS_WIDTH:0] adc_dcval_subtractor,
    output reg [ADC_PHYS_WIDTH:0] data_i,
    output reg [ADC_PHYS_WIDTH:0] data_q
);

    reg [1:0] counter;
    wire [ADC_PHYS_WIDTH:0] adc_data_ac;

    // DC offset removal
    assign adc_data_ac = {adc_data_in[ADC_PHYS_WIDTH-1], adc_data_in} - adc_dcval_subtractor;

    // Counter logic
    always @(posedge CLK or posedge RESET) begin
        if (RESET)
            counter <= 2'b00;
        else if (conv_en)
            counter <= counter + 1'b1;
    end

    // I/Q generation
    always @(posedge CLK or posedge RESET) begin
        if (RESET) begin
            data_i <= 0;
            data_q <= 0;
        end else if (conv_en) begin
            case (counter)
                2'b00: begin
                    data_i <= adc_data_ac;
                    data_q <= adc_data_ac;
                end
                2'b01: begin
                    data_i <= adc_data_ac;
                    data_q <= ~adc_data_ac + 1'b1;
                end
                2'b10: begin
                    data_i <= ~adc_data_ac + 1'b1;
                    data_q <= ~adc_data_ac + 1'b1;
                end
                2'b11: begin
                    data_i <= ~adc_data_ac + 1'b1;
                    data_q <= adc_data_ac;
                end
            endcase
        end
    end

endmodule