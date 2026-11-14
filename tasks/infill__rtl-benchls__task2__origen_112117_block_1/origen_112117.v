module origen_112117 (
    input wire clk,
    input wire start,
    input wire reset,
    output reg clear_acc,
    output reg done,
    output reg wr_en_x,
    output reg wr_en_y,
    output reg wr_en_a,
    output reg [3:0] addr_x,
    output reg [1:0] addr_y,
    output reg [1:0] addr_a
);

    reg [15:0] state;
    reg [15:0] next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= 16'd0;
        else
            state <= next_state;
    end

    [MASKED]

endmodule