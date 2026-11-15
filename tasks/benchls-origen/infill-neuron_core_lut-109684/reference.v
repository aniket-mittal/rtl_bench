module origen_109684 #(
    parameter GLOBAL_NEURON = 1024,
    parameter CORE_NEURON = 256,
    parameter C_GN = 4
)(
    input wire clk,
    input wire rst,
    input wire core_w_en,
    input wire core_r_en,
    input wire [$clog2(GLOBAL_NEURON) - $clog2(CORE_NEURON) - 1:0] core_w_addr,
    input wire [$clog2(GLOBAL_NEURON) - $clog2(CORE_NEURON) - 1:0] core_r_addr,
    input wire [$clog2(C_GN) - 1:0] core_d_in,
    output reg [$clog2(C_GN) - 1:0] core_grp_offset,
    output reg grp_r_en
);

    localparam LUT_DEPTH = 2**($clog2(GLOBAL_NEURON) - $clog2(CORE_NEURON));
    localparam LUT_WIDTH = $clog2(C_GN);

    reg [LUT_WIDTH-1:0] core_lut [0:LUT_DEPTH-1];
    reg [LUT_WIDTH-1:0] d_out;
    reg core_r_en_d;

    integer i;
    initial begin
        core_lut[0] = 1;
        for (i = 1; i < LUT_DEPTH; i = i + 1) begin
            core_lut[i] = 0;
        end
        d_out = 0;
        core_r_en_d = 0;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            d_out <= 0;
            core_r_en_d <= 0;
        end else begin
            if (core_w_en) begin
                core_lut[core_w_addr] <= core_d_in;
            end
            if (core_r_en) begin
                d_out <= core_lut[core_r_addr];
            end
            core_r_en_d <= core_r_en;
        end
    end

    always @(*) begin
        core_grp_offset = d_out;
        grp_r_en = core_r_en_d;
    end

endmodule