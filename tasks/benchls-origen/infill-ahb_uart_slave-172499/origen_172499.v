module origen_172499(
    input HCLK,
    input HRESETn,
    input HSEL,
    input [31:0] HADDR,
    input [1:0] HTRANS,
    input [2:0] HSIZE,
    input [3:0] HPROT,
    input HWRITE,
    input [31:0] HWDATA,
    input HREADY,
    input [7:0] UART_RX,
    input [0:0] state,

    output reg HREADYOUT,
    output reg [31:0] HRDATA,
    output HRESP,
    output reg tx_en,
    output reg [7:0] UART_TX
);

    reg [3:0] addr_reg;

    wire read_en = HSEL && (HTRANS == 2'b10) && !HWRITE && HREADY;
    wire write_en = HSEL && (HTRANS == 2'b10) && HWRITE && HREADY;

    [MASKED]

    assign HRESP = 1'b0;

endmodule