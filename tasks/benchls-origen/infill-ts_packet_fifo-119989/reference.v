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

    always @(posedge iClk or negedge iClrn) begin
        if (!iClrn) begin
            addrr <= 0;
            addrw <= 0;
            usefulbytes <= 0;
            sendcnt <= 0;
            tspack <= 0;
            oData <= 8'h00;
            oValid <= 0;
            oEmpty <= 1;
            oFull <= 0;
            oPSync <= 0;
            oCheck <= 0;
            state <= IDLE;
        end else begin
            // Input handling
            if (iValid && !oFull) begin
                ram[addrw] <= iData;
                addrw <= (addrw == BUFFER_SIZE-1) ? 0 : addrw + 1;
                usefulbytes <= usefulbytes + 1;
            end

            // Output handling
            case (state)
                IDLE: begin
                    if (iReq && (usefulbytes >= PACKET_SIZE || tspack)) begin
                        state <= SEND_DATA;
                        sendcnt <= 0;
                        oPSync <= 1;
                    end else if (iReq) begin
                        state <= SEND_NULL;
                        sendcnt <= 0;
                        oPSync <= 1;
                    end
                    oValid <= 0;
                end

                SEND_DATA: begin
                    if (sendcnt < PACKET_SIZE) begin
                        oData <= ram[addrr];
                        addrr <= (addrr == BUFFER_SIZE-1) ? 0 : addrr + 1;
                        usefulbytes <= usefulbytes - 1;
                        oValid <= 1;
                        sendcnt <= sendcnt + 1;
                        oPSync <= (sendcnt == 0);
                        oCheck <= (sendcnt >= PAYLOAD_SIZE);
                    end else begin
                        state <= IDLE;
                        tspack <= (usefulbytes >= PACKET_SIZE);
                    end
                end

                SEND_NULL: begin
                    oValid <= 1;
                    case (sendcnt)
                        0: oData <= 8'h47;
                        1: oData <= 8'h1F;
                        2: oData <= 8'hFF;
                        3: oData <= 8'h10;
                        default: oData <= 8'hFF;
                    endcase
                    sendcnt <= sendcnt + 1;
                    oPSync <= (sendcnt == 0);
                    oCheck <= (sendcnt >= PAYLOAD_SIZE);
                    if (sendcnt == PACKET_SIZE - 1) begin
                        state <= IDLE;
                    end
                end
            endcase

            // Status signals
            oEmpty <= (usefulbytes == 0);
            oFull <= (usefulbytes == BUFFER_SIZE);
        end
    end

endmodule