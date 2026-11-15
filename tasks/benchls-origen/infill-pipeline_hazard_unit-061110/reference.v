module origen_061110 (
    input wire clk,
    input wire reset,
    input wire intterupt,
    input wire MemReadEX,
    input wire BranchID,
    input wire JRID,
    input wire MemReadMEM,
    input wire RegWriteEX,
    input wire [4:0] regwriteaddrEX,
    input wire [4:0] rtaddrEX,
    input wire [4:0] rsaddrID,
    input wire [4:0] rtaddrID,
    input wire [4:0] regwriteaddrMEM,
    input wire [2:0] PCSrcID,
    input wire [1:0] MemtoRegMEM,
    output reg stall,
    output reg flush
);

    always @(*) begin
        // Stall logic
        stall = 1'b0;
        
        // Load-use hazard
        if (MemReadEX && ((rtaddrEX == rsaddrID) || (rtaddrEX == rtaddrID))) begin
            stall = 1'b1;
        end
        
        // Branch hazard with register write conflict
        if (BranchID && RegWriteEX && (regwriteaddrEX != 5'b0) && 
           ((regwriteaddrEX == rsaddrID) || (regwriteaddrEX == rtaddrID))) begin
            stall = 1'b1;
        end
        
        // JALR hazard
        if (JRID && RegWriteEX && (regwriteaddrEX != 5'b0) && (regwriteaddrEX == rsaddrID)) begin
            stall = 1'b1;
        end
        
        // Special register access hazards
        if ((rsaddrID == 5'b11111 || rtaddrID == 5'b11111 || rsaddrID == 5'b11010 || rtaddrID == 5'b11010) &&
            (MemReadMEM || (MemtoRegMEM != 2'b00)) &&
            (regwriteaddrMEM == 5'b11111 || regwriteaddrMEM == 5'b11010)) begin
            stall = 1'b1;
        end
        
        // Flush logic
        flush = 1'b0;
        if (!stall && (PCSrcID != 3'b000 || intterupt)) begin
            flush = 1'b1;
        end
    end

endmodule