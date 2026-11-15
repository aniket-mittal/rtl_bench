module origen_066011 (
    input wire iOSC_28, iERASE, iPROGRAM, iVERIFY, iOK, iFAIL, iRESET_N,
    input wire p_ready, WE_CLK, iFLASH_RY_N,
    output reg [23:0] oFLASH_ADDR,
    output reg [3:0] oFLASH_CMD,
    output wire oFLASH_TR,
    output wire oREAD_PRO_END,
    output wire oVERIFY_TIME
);

    reg [31:0] delay;
    wire ck_prog, ck_read;
    reg [3:0] ST_P;
    reg [23:0] addr_prog, addr_read;
    reg end_read, end_prog;

    // Command Decoder
    always @(posedge iOSC_28 or negedge iRESET_N) begin
        if (!iRESET_N)
            oFLASH_CMD <= 4'b0000;
        else begin
            casez ({iERASE, iPROGRAM, iVERIFY})
                3'b100: oFLASH_CMD <= 4'b0010; // Erase
                3'b010: oFLASH_CMD <= 4'b0100; // Program
                3'b001: oFLASH_CMD <= 4'b1000; // Verify
                default: oFLASH_CMD <= 4'b0000;
            endcase
        end
    end

    // Timing Control
    always @(posedge iOSC_28 or negedge iRESET_N) begin
        if (!iRESET_N)
            delay <= 32'd0;
        else
            delay <= delay + 1;
    end

    assign ck_prog = delay[7];
    assign ck_read = delay[5];

    // Program Operation State Machine
    always @(posedge ck_prog or negedge iRESET_N) begin
        if (!iRESET_N) begin
            ST_P <= 4'd0;
            addr_prog <= 24'd0;
            end_prog <= 1'b0;
        end else begin
            case (ST_P)
                4'd0: ST_P <= iPROGRAM ? 4'd1 : 4'd0;
                4'd1: ST_P <= p_ready ? 4'd2 : 4'd1;
                4'd2: ST_P <= 4'd3;
                4'd3: ST_P <= WE_CLK ? 4'd4 : 4'd3;
                4'd4: ST_P <= iFLASH_RY_N ? 4'd5 : 4'd4;
                4'd5: ST_P <= 4'd6;
                4'd6: ST_P <= 4'd7;
                4'd7: begin
                    if (addr_prog == 24'hFFFFFF) begin
                        ST_P <= 4'd8;
                        end_prog <= 1'b1;
                    end else begin
                        addr_prog <= addr_prog + 1;
                        ST_P <= 4'd1;
                    end
                end
                4'd8: ST_P <= 4'd9;
                4'd9: ST_P <= 4'd0;
                default: ST_P <= 4'd0;
            endcase
        end
    end

    // Read/Verify Operation
    always @(posedge ck_read or negedge iRESET_N) begin
        if (!iRESET_N) begin
            addr_read <= 24'd0;
            end_read <= 1'b0;
        end else if (iVERIFY) begin
            if (addr_read == 24'hFFFFFF) begin
                end_read <= 1'b1;
            end else begin
                addr_read <= addr_read + 1;
            end
        end
    end

    // Address Multiplexing
    always @(*) begin
        oFLASH_ADDR = iPROGRAM ? addr_prog : addr_read;
    end

    // Flash Transfer Signal
    assign oFLASH_TR = iERASE | iPROGRAM | iVERIFY;

    // Status Outputs
    assign oREAD_PRO_END = end_read & end_prog;
    assign oVERIFY_TIME = iVERIFY;

endmodule