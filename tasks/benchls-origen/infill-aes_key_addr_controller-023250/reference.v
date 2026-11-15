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

    always @(posedge clk or posedge kill) begin
        if (kill) begin
            addr_rd <= 5'b0;
            addr_wr <= 5'b0;
            key_ready_r <= 1'b0;
            key_round_buf <= 64'b0;
            flag_addr <= 1'b0;
        end else begin
            key_ready_r <= key_ready;

            if (key_ready || key_ready_r || addr_rd < 1) begin
                addr_rd <= (addr_rd == LENGTH_KEY_SET - 1) ? 5'b0 : addr_rd + 1'b1;
                flag_addr <= 1'b1;
            end else if (addr_rd == LENGTH_KEY_SET - 1) begin
                addr_rd <= 5'b0;
            end

            if (en_wr) begin
                addr_wr <= (addr_wr == LENGTH_RAM - 1) ? 5'b0 : addr_wr + 1'b1;
            end else if (key_ready) begin
                addr_wr <= 5'b0;
            end

            if (flag_addr) begin
                key_round_buf <= ram_out;
                flag_addr <= 1'b0;
            end
        end
    end

    always @(*) begin
        key_round_rd = {ram_out, flag_addr ? ram_out : key_round_buf};
    end

endmodule