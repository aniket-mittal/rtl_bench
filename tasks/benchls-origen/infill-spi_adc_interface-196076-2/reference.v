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

always @(posedge clk_10M or posedge rst) begin
    if (rst) begin
        st1 <= ST1_IDLE;
        st2 <= ST2_IDLE;
        adc_data <= 16'h0000;
        out_available_reg <= 1'b0;
    end
    else begin
        case (st1)
            ST1_IDLE: begin
                if (cnv_en) begin
                    st1 <= ST1_CNV;
                end
            end
            ST1_CNV: begin
                st1 <= ST1_WAIT;
            end
            ST1_WAIT: begin
                if (SDO == 1'b0) begin
                    st1 <= ST1_RECV;
                    st2 <= ST2_SCK1;
                end
            end
            ST1_RECV: begin
                if (st2 == ST2_STORE) begin
                    if (adc_data[0]) begin
                        st1 <= ST1_DONE;
                    end
                    else begin
                        st1 <= ST1_IDLE;
                        st2 <= ST2_IDLE;
                    end
                end
            end
            ST1_DONE: begin
                out_available_reg <= 1'b1;
                st1 <= ST1_IDLE;
            end
        endcase

        case (st2)
            ST2_IDLE: begin
                if (st1 == ST1_RECV) begin
                    st2 <= ST2_SCK1;
                end
            end
            ST2_SCK1: begin
                st2 <= ST2_SCK2;
            end
            ST2_SCK2: begin
                adc_data <= {adc_data[14:0], SDO};
                st2 <= ST2_SHIFT;
            end
            ST2_SHIFT: begin
                st2 <= ST2_STORE;
            end
            ST2_STORE: begin
                st2 <= ST2_SCK1;
            end
        endcase

        if (out_available_reg) begin
            out_available_reg <= 1'b0;
        end
    end
end

endmodule