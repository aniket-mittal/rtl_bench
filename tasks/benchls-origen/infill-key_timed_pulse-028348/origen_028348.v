module origen_028348 (
    input wire clk,
    input wire key,
    input wire fd,
    output reg fs
);

    parameter TIME_CNT = 500000;
    parameter TIME = 500000;

    reg [3:0] state;
    reg [31:0] cnt;
    reg last_key;

    localparam IDLE = 4'h0;
    localparam PREP = 4'h1;
    localparam WORK = 4'h2;

    always @(posedge clk) begin
        last_key <= key;
    end

    [MASKED]

endmodule