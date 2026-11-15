module origen_158815(
    input wire AxiAClk,
    input wire AxiAResetN,
    input wire [31:0] ARaddr,
    output reg [31:0] Rdata,
    output reg Rvalid,
    input wire Rready,
    output reg ARready,
    input wire ARvalid,
    input wire [31:0] AWaddr,
    input wire [31:0] Wdata,
    output reg WriteEN,
    output reg AWready,
    input wire AWvalid,
    input wire Wvalid,
    output reg Wready,
    output reg Bvalid
);

    // Read State Machine
    reg [1:0] readState;
    reg [31:0] ReadAddress;
    parameter READSTATE_IDLE = 2'b00;
    parameter READSTATE_ADDRREADY = 2'b01;
    parameter READSTATE_DATAREADY = 2'b10;

    reg ReadEN;

    // Write State Machine
    reg [1:0] writeState;
    reg [31:0] WriteAddress;
    parameter WRITESTATE_IDLE = 2'b00;
    parameter WRITESTATE_ADDRREADY = 2'b01;
    parameter WRITESTATE_DATAREADY = 2'b10;

    [MASKED]

endmodule