module origen_012974 (
    input wire reset,
    input wire clk,
    input wire dp,
    input wire dm,
    input wire enable,
    output reg eop_r,
    output reg [7:0] rdata,
    output reg rdata_ready,
    output reg [7:0] rbyte_cnt,
    output reg eop_rfe
);

    reg [1:0] dp_r, dm_r;
    reg [2:0] state;
    reg [2:0] bit_count;
    reg [2:0] clk_counter;
    reg [2:0] num_ones;
    reg do_remove_zero;
    reg r_strobe;
    reg recv_enable;

    localparam IDLE = 3'b000;
    localparam RECEIVING = 3'b001;
    localparam EOP = 3'b010;

    [MASKED]

endmodule