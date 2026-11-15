module origen_122334 (
    input wire clk,
    input wire RegWriteW, RegWriteM, RegWriteE,
    input wire [4:0] WriteRegW, WriteRegM, WriteRegE,
    input wire MemToRegM, MemToRegE,
    input wire [4:0] rsE, rtE, rsD, rtD,
    input wire BranchD,
    output reg [1:0] ForwardAE, ForwardBE,
    output reg ForwardAD, ForwardBD,
    output reg FlushE, StallD, StallF
);

    reg lwstall, branchStall;

    // Data Forwarding for Execute stage
    always @(*) begin
        // ForwardAE
        if ((rsE != 0) && (rsE == WriteRegM) && RegWriteM)
            ForwardAE = 2'b10;
        else if ((rsE != 0) && (rsE == WriteRegW) && RegWriteW)
            ForwardAE = 2'b01;
        else
            ForwardAE = 2'b00;

        // ForwardBE
        if ((rtE != 0) && (rtE == WriteRegM) && RegWriteM)
            ForwardBE = 2'b10;
        else if ((rtE != 0) && (rtE == WriteRegW) && RegWriteW)
            ForwardBE = 2'b01;
        else
            ForwardBE = 2'b00;
    end

    // Data Forwarding for Decode stage
    always @(*) begin
        ForwardAD = (rsD != 0) && (rsD == WriteRegM) && RegWriteM;
        ForwardBD = (rtD != 0) && (rtD == WriteRegM) && RegWriteM;
    end

    // Load-Use Hazard detection
    always @(*) begin
        lwstall = ((rsD == rtE) || (rtD == rtE)) && MemToRegE;
    end

    // Branch Hazard detection
    always @(*) begin
        branchStall = (BranchD && RegWriteE && (WriteRegE == rsD || WriteRegE == rtD)) ||
                      (BranchD && MemToRegM && (WriteRegM == rsD || WriteRegM == rtD));
    end

    // Stalling and Flushing logic
    always @(*) begin
        StallF = lwstall || branchStall;
        StallD = lwstall || branchStall;
        FlushE = lwstall || branchStall;
    end

endmodule