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

    always @(posedge clk) begin
        if (~req0 & ~req1) begin
            ack_o_0 <= 1'b0;
            ack_o_1 <= 1'b0;
            grant0 <= 1'b0;
            grant1 <= 1'b0;
            cmd <= 1'b0;
            req <= 1'b0;
            wdata <= 32'b0;
            addr <= 32'b0;
        end
        else if (req0 & ~req1 & addr_match0) begin
            ack_o_0 <= 1'b1;
            ack_o_1 <= 1'b0;
            grant0 <= 1'b1;
            grant1 <= 1'b0;
            cmd <= cmd0;
            req <= req0;
            wdata <= wdata0;
            addr <= addr0;
        end
        else if (~req0 & req1 & addr_match1) begin
            ack_o_0 <= 1'b0;
            ack_o_1 <= 1'b1;
            grant0 <= 1'b0;
            grant1 <= 1'b1;
            cmd <= cmd1;
            req <= req1;
            wdata <= wdata1;
            addr <= addr1;
        end
        else if (req0 & req1 & addr_match0 & addr_match1) begin
            if (mask[0]) begin
                ack_o_0 <= 1'b1;
                ack_o_1 <= 1'b0;
                grant0 <= 1'b1;
                grant1 <= 1'b0;
                cmd <= cmd0;
                req <= req0;
                wdata <= wdata0;
                addr <= addr0;
            end
            else begin
                ack_o_0 <= 1'b0;
                ack_o_1 <= 1'b1;
                grant0 <= 1'b0;
                grant1 <= 1'b1;
                cmd <= cmd1;
                req <= req1;
                wdata <= wdata1;
                addr <= addr1;
            end
            mask <= {mask[0], mask[1]};
        end
        else begin
            ack_o_0 <= 1'b0;
            ack_o_1 <= 1'b0;
            grant0 <= 1'b0;
            grant1 <= 1'b0;
            cmd <= 1'b0;
            req <= 1'b0;
            wdata <= 32'b0;
            addr <= 32'b0;
        end
    end

endmodule