module origen_059928 (
    input clk, rst,
    input [7:0] DataIn,
    input Write0, Write1,
    input [63:0] BlockEnable,
    output [7:0] DataOut0, DataOut1
);

    wire valid, lru;
    assign valid = Write0 | Write1;
    assign lru = (DataIn[7:6] == 2'b11 & Write1) | (DataIn[7:6] == 2'b00 & Write0);

    genvar i;
    generate
        for (i = 0; i < 64; i = i + 1) begin : gen_mblocks
            MBlock Mblk0 (
                .clk(clk),
                .rst(rst),
                .Din(DataIn[5:0]),
                .WriteEnable(Write0),
                .Enable(BlockEnable[i]),
                .valid(valid),
                .LruEnable(lru),
                .Dout(DataOut0)
            );

            MBlock Mblk1 (
                .clk(clk),
                .rst(rst),
                .Din(DataIn[5:0]),
                .WriteEnable(Write1),
                .Enable(BlockEnable[i]),
                .valid(valid),
                .LruEnable(lru),
                .Dout(DataOut1)
            );
        end
    endgenerate

endmodule

module MBlock (
    input clk, rst,
    input [5:0] Din,
    input WriteEnable, Enable, valid, LruEnable,
    output [7:0] Dout
);

    wire lru_out, valid_out;
    wire [5:0] data_out;

    MCell lru_bit (
        .clk(clk),
        .rst(rst),
        .Din(~WriteEnable),
        .WriteEnable(LruEnable),
        .Enable(Enable),
        .Dout(lru_out)
    );

    MCell valid_bit (
        .clk(clk),
        .rst(rst),
        .Din(1'b1),
        .WriteEnable(WriteEnable & valid),
        .Enable(Enable),
        .Dout(valid_out)
    );

    genvar i;
    generate
        for (i = 0; i < 6; i = i + 1) begin : gen_data_bits
            MCell data_bit (
                .clk(clk),
                .rst(rst),
                .Din(Din[i]),
                .WriteEnable(WriteEnable),
                .Enable(Enable),
                .Dout(data_out[i])
            );
        end
    endgenerate

    assign Dout = {lru_out, valid_out, data_out};

endmodule

module MCell (
    input clk, rst,
    input Din, WriteEnable, Enable,
    output Dout
);

    reg q;

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else if (Enable & WriteEnable)
            q <= Din;
    end

    assign Dout = (Enable & ~WriteEnable) ? q : 1'bz;

endmodule