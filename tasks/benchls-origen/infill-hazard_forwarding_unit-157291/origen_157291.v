module origen_157291(
    input [4:0] rsD, rtD, rsE, rtE,
    input memtoregE, memtoregM,
    input regwriteE, regwriteM, regwriteW,
    input [4:0] writeregE, writeregM, writeregW,
    input branchD,
    output reg stallF, stallD,
    output reg forwardAD, forwardBD,
    output reg forwardAE, forwardBE,
    output reg flushE
);

    wire lwstallD, branchstallD;

    // Forwarding logic
    [MASKED]

    // Stall logic
    assign lwstallD = memtoregE && (rsD == rtE || rtD == rtE);
    assign branchstallD = branchD && (regwriteE && writeregE == rsD || regwriteE && writeregE == rtD || regwriteM && writeregM == rsD || regwriteM && writeregM == rtD);

    always @(*) begin
        // Stall the pipeline
        stallF = lwstallD || branchstallD;
        stallD = lwstallD || branchstallD;

        // Flush the Execute stage
        flushE = branchstallD;
    end

endmodule