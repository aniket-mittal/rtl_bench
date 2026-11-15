module origen_154607 (
    input PCLK,
    input PRESETB,
    input [31:0] PADDR,
    input PSEL,
    input PENABLE,
    input PWRITE,
    input [31:0] PWDATA,
    input fc_done,
    input [31:0] clk_counter,
    input [31:0] max_index,
    output reg fc_start,
    output reg [10:0] data_size,
    output reg [31:0] PRDATA
);

    wire state_enable = PSEL && PENABLE;
    wire state_enable_pre = PSEL && !PENABLE;
    reg [31:0] prdata_reg;

    always @(posedge PCLK or negedge PRESETB) begin
        if (!PRESETB) begin
            fc_start <= 1'b0;
            data_size <= 11'b0;
        end
        else begin
            if (state_enable && PWRITE && (PADDR == 32'h00000000)) begin
                fc_start <= PWDATA[0];
            end
            if (state_enable && PWRITE && (PADDR == 32'h0000001C)) begin
                data_size <= PWDATA[10:0];
            end
        end
    end

    always @(*) begin
        case (PADDR)
            32'h00000000: prdata_reg = {31'b0, fc_start};
            32'h00000004: prdata_reg = {31'b0, fc_done};
            32'h00000008: prdata_reg = clk_counter;
            32'h0000000C: prdata_reg = max_index;
            32'h0000001C: prdata_reg = {21'b0, data_size};
            default: prdata_reg = 32'b0;
        endcase
    end

    always @(posedge PCLK) begin
        if (state_enable && !PWRITE) begin
            PRDATA <= prdata_reg;
        end
    end

endmodule