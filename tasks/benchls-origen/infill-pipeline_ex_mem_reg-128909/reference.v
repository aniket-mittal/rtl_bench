module origen_128909 (
    input wire rst,
    input wire clk,
    input wire cpu_stall,
    input wire ex_c_rfw,
    input wire [1:0] ex_c_wbsource,
    input wire [1:0] ex_c_drw,
    input wire [31:0] ex_alu_r,
    input wire [31:0] ex_rfb,
    input wire [4:0] ex_rf_waddr,
    input wire [31:0] ex_jalra,
    input wire [4:0] ex_rt,
    input wire [31:0] wb_wdata,
    input wire [31:0] dmem_in,

    output reg p_c_rfw,
    output reg [1:0] p_c_wbsource,
    output reg [31:0] p_alu_r,
    output reg [31:0] dmem_data,
    output reg [4:0] p_rf_waddr,
    output reg [31:0] p_jalra,
    output reg [31:0] dmem_addr,
    output reg [1:0] dmem_drw,
    output reg [31:0] p_dout
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            p_c_rfw <= 0;
            p_c_wbsource <= 0;
            p_alu_r <= 0;
            dmem_data <= 0;
            p_rf_waddr <= 0;
            p_jalra <= 0;
            dmem_addr <= 0;
            dmem_drw <= 0;
            p_dout <= 0;
        end
        else if (!cpu_stall) begin
            p_c_rfw <= (ex_c_rfw && (ex_rt == p_rf_waddr)) ? 1'b1 : 1'b0;
            dmem_addr <= ex_alu_r;
            dmem_drw <= ex_c_drw;
            dmem_data <= p_c_rfw ? wb_wdata : ex_rfb;
            p_c_wbsource <= ex_c_wbsource;
            p_alu_r <= ex_alu_r;
            p_rf_waddr <= ex_rf_waddr;
            p_jalra <= ex_jalra;
            p_dout <= dmem_in;
        end
    end

endmodule