module origen_072281 (
    input wire CLK,
    input wire RST,
    output reg STBo,
    output wire [7:0] DATo,
    input wire ACKo,
    input wire STBi,
    input wire [7:0] DATi0, DATi1, DATi2, DATi3, DATi4, DATi5, DATi6, DATi7,
    output reg ACKi
);

    reg [2:0] index;
    reg [7:0] RAM [0:7];
    reg acki;

    // Input data storage
    always @(*) begin
        RAM[0] = DATi0;
        RAM[1] = DATi1;
        RAM[2] = DATi2;
        RAM[3] = DATi3;
        RAM[4] = DATi4;
        RAM[5] = DATi5;
        RAM[6] = DATi6;
        RAM[7] = DATi7;
    end

    // Output data selection
    assign DATo = RAM[index];

    // Input acknowledgment
    always @(posedge CLK or posedge RST) begin
        if (RST)
            ACKi <= 1'b0;
        else
            ACKi <= STBi && (index == 3'b111);
    end

    // Index control
    always @(posedge CLK or posedge RST) begin
        if (RST)
            index <= 3'b000;
        else if (STBi && ACKo)
            index <= index + 1'b1;
    end

    // Output strobe control
    always @(posedge CLK or posedge RST) begin
        if (RST)
            STBo <= 1'b0;
        else if (STBi && !ACKi)
            STBo <= 1'b1;
        else if (ACKo && (index == 3'b111))
            STBo <= 1'b0;
    end

endmodule