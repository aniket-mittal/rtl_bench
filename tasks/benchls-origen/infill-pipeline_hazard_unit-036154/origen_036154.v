module origen_036154(
    input wire clk,
    input wire [4:0] rsd, rtd, rdd, rse, rte, rde,
    input wire [4:0] writeRegE, writeRegM, writeRegW,
    input wire BranchD,
    input wire memToRegE, memToRegM,
    input wire RegWriteE, RegWriteM, RegWriteW,
    output reg [1:0] ForwardAE, ForwardBE,
    output reg ForwardAD, ForwardBD,
    output reg FlushE, stallF, stallD
);

    // Forwarding logic for Execute stage
    [MASKED]

    // Load-use hazard detection
    wire lwstall;
    assign lwstall = ((rsd == rte) || (rtd == rte)) && memToRegE;

    // Branch hazard detection
    wire branchstall;
    assign branchstall = (BranchD && RegWriteE && (writeRegE == rsd || writeRegE == rtd)) ||
                         (BranchD && memToRegM && (writeRegM == rsd || writeRegM == rtd));

    // Forwarding for Decode stage
    always @(*) begin
        ForwardAD = (rsd != 0) && (rsd == writeRegM) && RegWriteM;
        ForwardBD = (rtd != 0) && (rtd == writeRegM) && RegWriteM;
    end

    // Stall and Flush control
    always @(*) begin
        stallF = lwstall || branchstall;
        stallD = lwstall || branchstall;
        FlushE = lwstall || branchstall;
    end

endmodule