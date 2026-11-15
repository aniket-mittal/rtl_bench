module origen_209255 (
    input  wire        clk_i,
    input  wire        rst_i,
    input  wire        halt_i,
    input  wire [1:0]  WB_i,
    input  wire [1:0]  M_i,
    input  wire [3:0]  EX_i,
    input  wire [31:0] data1_i,
    input  wire [31:0] data2_i,
    input  wire [31:0] signextend_i,
    input  wire [4:0]  rs_i,
    input  wire [4:0]  rt_i,
    input  wire [4:0]  rd_i,
    output reg  [1:0]  WB_o,
    output reg  [1:0]  M_o,
    output reg  [3:0]  EX_o,
    output reg  [31:0] data1_o,
    output reg  [31:0] data2_o,
    output reg  [31:0] signextend_o,
    output reg  [4:0]  rs_o,
    output reg  [4:0]  rt_o,
    output reg  [4:0]  rd_o
);

    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            WB_o <= 2'b0;
            M_o <= 2'b0;
            EX_o <= 4'b0;
            data1_o <= 32'b0;
            data2_o <= 32'b0;
            signextend_o <= 32'b0;
            rs_o <= 5'b0;
            rt_o <= 5'b0;
            rd_o <= 5'b0;
        end
        else if (!halt_i) begin
            WB_o <= WB_i;
            M_o <= M_i;
            EX_o <= EX_i;
            data1_o <= data1_i;
            data2_o <= data2_i;
            signextend_o <= signextend_i;
            rs_o <= rs_i;
            rt_o <= rt_i;
            rd_o <= rd_i;
        end
    end

endmodule