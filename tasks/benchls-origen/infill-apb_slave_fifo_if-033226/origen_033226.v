module origen_033226 (
    input wire pclk,
    input wire presetn,
    input wire [31:0] paddr,
    input wire psel,
    input wire penable,
    input wire pwrite,
    input wire [31:0] pwdata,
    output reg pready,
    output reg [31:0] prdata,
    input wire [31:0] din,
    input wire din_rdy,
    output reg [31:0] dout,
    output reg dout_rdy,
    output reg din_req
);

    [MASKED]

endmodule