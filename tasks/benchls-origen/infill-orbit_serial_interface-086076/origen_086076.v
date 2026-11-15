module origen_086076 (
    input wire reset,
    input wire iClkOrb,
    input wire [11:0] iWord,
    output reg [10:0] oAddr,
    output reg oRdEn,
    output reg oSwitch,
    output reg oOrbit,
    output reg [11:0] oParallel,
    output reg oVal,
    output reg [5:0] cycle,
    output reg RqSlow,
    output reg RqFast
);

    reg [1:0] seq;
    reg [3:0] cntBit;
    reg [10:0] cntWrd;
    reg [3:0] cntPhr;
    reg [2:0] cntGrp;
    reg [7:0] cntFrm;
    reg [11:0] word;
    reg [10:0] cntRqFast;
    reg [14:0] cntRqSlow;

    [MASKED]

endmodule