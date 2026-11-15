module origen_027775 #(
    parameter ADC_WIDTH = 14,
    parameter ADC_LATENCY = 5
) (
    input wire [ADC_WIDTH-1:0] Q_IN,
    input wire Q_IN_OV,
    input wire acq_en,
    input wire SYS_CLK,
    input wire RESET,
    output reg [ADC_WIDTH-1:0] Q_OUT,
    output reg Q_OUT_OV,
    output wire data_ready,
    output wire out_en
);

    reg [ADC_LATENCY-1:0] data_ready_buf;

    // Latency compensation shift register
    generate
        genvar i;
        for (i = 0; i < ADC_LATENCY; i = i + 1) begin : gen_latency
            if (i == 0) begin
                always @(posedge SYS_CLK or posedge RESET) begin
                    if (RESET)
                        data_ready_buf[i] <= 1'b0;
                    else
                        data_ready_buf[i] <= acq_en;
                end
            end else begin
                always @(posedge SYS_CLK or posedge RESET) begin
                    if (RESET)
                        data_ready_buf[i] <= 1'b0;
                    else
                        data_ready_buf[i] <= data_ready_buf[i-1];
                end
            end
        end
    endgenerate

    // Data handling
    always @(posedge SYS_CLK or posedge RESET) begin
        if (RESET) begin
            Q_OUT <= {ADC_WIDTH{1'b0}};
            Q_OUT_OV <= 1'b0;
        end else begin
            Q_OUT <= Q_IN;
            Q_OUT_OV <= Q_IN_OV;
        end
    end

    // Output assignments
    assign data_ready = data_ready_buf[ADC_LATENCY-1];
    assign out_en = 1'b1;

endmodule