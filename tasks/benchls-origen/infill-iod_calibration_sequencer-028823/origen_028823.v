module origen_028823 #(
    parameter WIDTH = 8
) (
    input wire clk_div,
    input wire rst,
    input wire [WIDTH-1:0] iod_busy,
    output reg ready,
    output reg iod_rst,
    output reg iod_mask,
    output reg iod_cal,
    output reg iod_cal_master
);

    reg [WIDTH-1:0] iod_busy_reg;
    wire iod_any_busy, iod_all_busy;
    reg [11:0] iod_cnt;
    reg [2:0] iod_state;

    assign iod_any_busy = |iod_busy_reg;
    assign iod_all_busy = &iod_busy_reg;

    [MASKED]

endmodule