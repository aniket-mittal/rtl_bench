module origen_023250 (
    input wire clk,
    input wire kill,
    input wire en_wr,
    input wire key_ready,
    input wire [63:0] ram_out,
    output reg [127:0] key_round_rd,
    output wire [4:0] addr
);

    parameter LENGTH_RAM = 32;
    parameter LENGTH_KEY_SET = 22;

    reg [4:0] addr_rd;
    reg [4:0] addr_wr;
    reg key_ready_r;
    reg [63:0] key_round_buf;
    reg flag_addr;

    assign addr = en_wr ? addr_wr : addr_rd;

    [MASKED]

    always @(*) begin
        key_round_rd = {ram_out, flag_addr ? ram_out : key_round_buf};
    end

endmodule