module origen_118428 (
    input wire clk,
    input wire rst,
    input wire read_cod_ena,
    input wire init_data_ena,
    input wire [3:0] spo_cod,
    output reg [3:0] nib_gene,
    output reg [4:0] addr_cod,
    output reg [23:0] data,
    output reg done_cod,
    output reg done_fin
);

    reg [2:0] cnt_array;
    integer i;

    [MASKED]

    always @(*) begin
        nib_gene = data[3:0];
    end

endmodule