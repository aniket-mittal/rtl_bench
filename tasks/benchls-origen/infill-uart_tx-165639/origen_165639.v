module origen_165639 #(
    parameter div = 16'd868  // Clock division factor (for 115200 baud rate)
)(
    input clk,
    input rst,
    input wr,
    input [7:0] din,
    output reg txd,
    output reg rdy
);

    reg [31:0] count;
    reg [7:0] data;
    reg [3:0] state, n_state;

    localparam s0 = 4'd0, s1 = 4'd1, s2 = 4'd2, s3 = 4'd3, s4 = 4'd4,
              s5 = 4'd5, s6 = 4'd6, s7 = 4'd7, s8 = 4'd8, s9 = 4'd9;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            state <= s0;
            txd <= 1'b1;
            rdy <= 1'b1;
        end
        else begin
            state <= n_state;
            if (count == div - 1) begin
                count <= 0;
            end
            else begin
                count <= count + 1;
            end
        end
    end

    [MASKED]

endmodule