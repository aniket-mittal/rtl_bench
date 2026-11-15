module origen_196076 (
    input           clk_10M,
    input           rst,
    input           cnv_en,
    output  [15:0]  DATA,
    output          out_available,
    input           SDO,
    output          CNV,
    output          SCK,
    output          SDI
);

reg [15:0] adc_data;
reg [3:0] st1, st2;
reg out_available_reg;

localparam  ST1_IDLE = 4'h0,
            ST1_CNV  = 4'h1,
            ST1_WAIT = 4'h2,
            ST1_RECV = 4'h3,
            ST1_DONE = 4'h4;

localparam  ST2_IDLE = 4'h0,
            ST2_SCK1  = 4'h1,
            ST2_SCK2  = 4'h2,
            ST2_SHIFT = 4'h3,
            ST2_STORE = 4'h4;

assign DATA = adc_data;
assign out_available = out_available_reg;
assign CNV = (st1 == ST1_CNV);
assign SCK = (st2 == ST2_SCK1) | (st2 == ST2_SCK2);
assign SDI = 1'b0;

[MASKED]

endmodule