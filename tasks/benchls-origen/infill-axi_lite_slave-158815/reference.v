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

    always @(posedge AxiAClk or negedge AxiAResetN) begin
        if (!AxiAResetN) begin
            readState <= READSTATE_IDLE;
            writeState <= WRITESTATE_IDLE;
            ARready <= 0;
            Rvalid <= 0;
            ReadEN <= 0;
            AWready <= 0;
            Wready <= 0;
            Bvalid <= 0;
            WriteEN <= 0;
        end else begin
            // Read State Machine
            case (readState)
                READSTATE_IDLE: begin
                    if (ARvalid) begin
                        ReadAddress <= ARaddr;
                        ARready <= 1;
                        readState <= READSTATE_ADDRREADY;
                    end
                end
                READSTATE_ADDRREADY: begin
                    ARready <= 0;
                    ReadEN <= 1;
                    readState <= READSTATE_DATAREADY;
                end
                READSTATE_DATAREADY: begin
                    Rvalid <= 1;
                    if (Rready) begin
                        Rvalid <= 0;
                        ReadEN <= 0;
                        readState <= READSTATE_IDLE;
                    end
                end
            endcase

            // Write State Machine
            case (writeState)
                WRITESTATE_IDLE: begin
                    if (AWvalid) begin
                        WriteAddress <= AWaddr;
                        AWready <= 1;
                        writeState <= WRITESTATE_ADDRREADY;
                    end
                end
                WRITESTATE_ADDRREADY: begin
                    Wready <= 1;
                    AWready <= 0;
                    writeState <= WRITESTATE_DATAREADY;
                end
                WRITESTATE_DATAREADY: begin
                    if (Wvalid) begin
                        WriteEN <= 1;
                        Wready <= 0;
                        Bvalid <= 1;
                        writeState <= WRITESTATE_IDLE;
                    end
                end
            endcase
        end
    end

endmodule