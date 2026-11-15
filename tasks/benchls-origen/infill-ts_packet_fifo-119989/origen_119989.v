module origen_119989 (
    input wire iClk,
    input wire iClrn,
    input wire [7:0] iData,
    input wire iValid,
    input wire iReq,
    input wire iPsync,
    output reg [7:0] oData,
    output reg oValid,
    output reg oEmpty,
    output reg oFull,
    output reg oPSync,
    output reg oCheck
);

    // Parameters
    parameter BUFFER_SIZE = 1024;
    parameter PACKET_SIZE = 204;
    parameter PAYLOAD_SIZE = 187;

    // Internal signals
    reg [9:0] addrr, addrw;
    reg [10:0] usefulbytes;
    reg [7:0] sendcnt;
    reg tspack;
    reg [7:0] ram [0:BUFFER_SIZE-1];

    // State machine
    reg [1:0] state;
    localparam IDLE = 2'b00, SEND_DATA = 2'b01, SEND_NULL = 2'b10;

    [MASKED]

endmodule