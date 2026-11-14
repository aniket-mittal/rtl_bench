module origen_029148 #(
    parameter ROM_SIZE = 50,
    parameter AW = 5,
    parameter DW = 23
)(
    input wire clk,
    input wire reset,
    input wire clear_error,
    input wire ack,
    input wire transfer_complete,
    input wire [DW-1:0] rom_data,
    output reg [DW-1:0] data_out,
    output reg [AW-1:0] rom_address,
    output reg auto_init_complete,
    output reg auto_init_error
);

    reg transfer_data;
    wire toggle_next_transfer;

    [MASKED]

    assign toggle_next_transfer = transfer_data && transfer_complete;

endmodule