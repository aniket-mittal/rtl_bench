module origen_071009 #(
    parameter num = 0
)(
    input wire clk,
    input wire req0, req1,
    input wire cmd0, cmd1,
    input wire ack_i,
    input wire [31:0] wdata0, wdata1,
    input wire [31:0] addr0, addr1,
    output reg ack_o_0, ack_o_1,
    output reg grant0, grant1,
    output reg cmd, req,
    output reg [31:0] wdata, addr
);

    reg [1:0] mask;
    wire addr_match0, addr_match1;

    initial begin
        mask = 2'b01;
    end

    assign addr_match0 = (num == 0) ? ~addr0[31] : addr0[31];
    assign addr_match1 = (num == 0) ? ~addr1[31] : addr1[31];

    [MASKED]

endmodule