module origen_129462 (
    input wire SNnotDB,
    input wire DBnotSN,
    input wire [7:0] RomExpConCtl,
    output reg Constantb,
    output reg Constantc,
    output reg Constantd,
    output reg Constante,
    output reg Constantf,
    output reg Constantg,
    output reg Constanth
);

    wire SNnotBD;
    wire [1:0] f;
    wire ROMbit;

    assign SNnotBD = SNnotDB & ~DBnotSN;
    assign f = RomExpConCtl[1:0];
    assign ROMbit = RomExpConCtl[2];

    [MASKED]

endmodule