module origen_051230 (
    input wire clk,
    input wire rst,
    input wire [31:0] ctrlsignals,
    input wire [15:0] memoryin,
    input wire [15:0] acc,
    output reg [15:0] memoryout,
    output reg [15:0] mbr,
    output reg [7:0] ir,
    output reg [7:0] mar,
    output reg [7:0] pc
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pc <= 8'b0;
            mar <= 8'b0;
        end else begin
            // Load memory input into MBR
            if (ctrlsignals[3])
                mbr <= memoryin;
            
            // Load upper 8 bits of memory input into IR
            if (ctrlsignals[4])
                ir <= memoryin[15:8];
            
            // Load lower 8 bits of memory input into MAR
            if (ctrlsignals[5])
                mar <= memoryin[7:0];
            
            // Increment PC
            if (ctrlsignals[6])
                pc <= pc + 1;
            
            // Copy PC to MAR
            if (ctrlsignals[10])
                mar <= pc;
            
            // Copy MBR to memory output
            if (ctrlsignals[12])
                memoryout <= mbr;
            
            // Load accumulator into MBR
            if (ctrlsignals[14])
                mbr <= acc;
            
            // Load MBR into PC
            if (ctrlsignals[15])
                pc <= mbr[7:0];
            
            // Load PC into MBR
            if (ctrlsignals[16])
                mbr <= {8'b0, pc};
        end
    end

endmodule