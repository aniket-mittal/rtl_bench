module origen_135180 (
    input wire aclr,
    input wire [39:0] data,
    input wire rdclk,
    input wire rdreq,
    input wire wrclk,
    input wire wrreq,
    output reg [39:0] q,
    output reg rdempty,
    output wire [4:0] rdusedw,
    output reg wrfull,
    output wire [4:0] wrusedw
);

    reg [39:0] mem [0:31];
    reg [4:0] wrptr, rdptr;
    reg [5:0] wrptr_gray, rdptr_gray;
    reg [5:0] wrptr_gray_sync, rdptr_gray_sync;
    reg [5:0] wrptr_bin, rdptr_bin;

    wire [4:0] wrptr_next, rdptr_next;
    wire [5:0] wrptr_gray_next, rdptr_gray_next;
    wire wrfull_next, rdempty_next;

    // Write pointer logic
    always @(posedge wrclk or posedge aclr) begin
        if (aclr) begin
            wrptr <= 5'b0;
            wrptr_gray <= 6'b0;
        end else if (wrreq && !wrfull) begin
            wrptr <= wrptr_next;
            wrptr_gray <= wrptr_gray_next;
        end
    end

    assign wrptr_next = wrptr + 5'b1;
    assign wrptr_gray_next = (wrptr_next >> 1) ^ wrptr_next;

    // Read pointer logic
    always @(posedge rdclk or posedge aclr) begin
        if (aclr) begin
            rdptr <= 5'b0;
            rdptr_gray <= 6'b0;
        end else if (rdreq && !rdempty) begin
            rdptr <= rdptr_next;
            rdptr_gray <= rdptr_gray_next;
        end
    end

    assign rdptr_next = rdptr + 5'b1;
    assign rdptr_gray_next = (rdptr_next >> 1) ^ rdptr_next;

    // Synchronization
    always @(posedge wrclk or posedge aclr) begin
        if (aclr)
            rdptr_gray_sync <= 6'b0;
        else
            rdptr_gray_sync <= rdptr_gray;
    end

    always @(posedge rdclk or posedge aclr) begin
        if (aclr)
            wrptr_gray_sync <= 6'b0;
        else
            wrptr_gray_sync <= wrptr_gray;
    end

    // Gray to binary conversion
    always @* begin
        wrptr_bin = wrptr_gray_sync;
        rdptr_bin = rdptr_gray_sync;
        wrptr_bin[4:0] = wrptr_bin[5:1] ^ wrptr_bin[4:0];
        rdptr_bin[4:0] = rdptr_bin[5:1] ^ rdptr_bin[4:0];
    end

    // Full and empty flags
    assign wrfull_next = (wrptr_gray_next == {~rdptr_gray_sync[5:4], rdptr_gray_sync[3:0]});
    assign rdempty_next = (rdptr_gray_next == wrptr_gray_sync);

    always @(posedge wrclk or posedge aclr)
        if (aclr)
            wrfull <= 1'b0;
        else
            wrfull <= wrfull_next;

    always @(posedge rdclk or posedge aclr)
        if (aclr)
            rdempty <= 1'b1;
        else
            rdempty <= rdempty_next;

    // Used words calculation
    assign wrusedw = wrptr - rdptr_bin[4:0];
    assign rdusedw = wrptr_bin[4:0] - rdptr;

    // Memory write operation
    always @(posedge wrclk) begin
        if (wrreq && !wrfull)
            mem[wrptr] <= data;
    end

    // Memory read operation
    always @(posedge rdclk) begin
        if (rdreq && !rdempty)
            q <= mem[rdptr];
    end

endmodule