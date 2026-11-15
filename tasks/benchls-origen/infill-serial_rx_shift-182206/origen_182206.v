module origen_182206 (
    input Clk,
    input Rst_n,
    input RxEn,
    input Rx,
    input Tick,
    input [3:0] NBits,
    output reg RxDone,
    output reg [7:0] RxData
);

localparam IDLE = 1'b0, READ = 1'b1;
reg state;
reg [3:0] Bit;
reg [7:0] Read_data;

[MASKED]

endmodule