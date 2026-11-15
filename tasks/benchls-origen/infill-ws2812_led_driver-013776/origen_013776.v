module origen_013776 (
    input wire clk,
    input wire rst_n,
    input wire tx_done,
    output reg tx_en,
    output reg [23:0] RGB
);

    reg [31:0] cnt;
    reg [23:0] RGB_reg [4:0];
    reg [3:0] k;
    reg tx_en_r;
    reg tx_done_r0;

    [MASKED]

    always @(*) begin
        tx_en = tx_en_r;
    end

endmodule