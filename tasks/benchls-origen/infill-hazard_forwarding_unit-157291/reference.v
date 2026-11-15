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
    always @(*) begin
        // Forwarding for Execute stage
        if (regwriteM && writeregM != 0 && writeregM == rsE)
            forwardAE = 2'b10;
        else if (regwriteW && writeregW != 0 && writeregW == rsE)
            forwardAE = 2'b01;
        else
            forwardAE = 2'b00;

        if (regwriteM && writeregM != 0 && writeregM == rtE)
            forwardBE = 2'b10;
        else if (regwriteW && writeregW != 0 && writeregW == rtE)
            forwardBE = 2'b01;
        else
            forwardBE = 2'b00;

        // Forwarding for Decode stage
        if (regwriteE && writeregE != 0 && writeregE == rsD)
            forwardAD = 1'b1;
        else
            forwardAD = 1'b0;

        if (regwriteE && writeregE != 0 && writeregE == rtD)
            forwardBD = 1'b1;
        else
            forwardBD = 1'b0;
    end

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