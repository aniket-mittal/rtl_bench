module origen_000477 (
    input wire iRST,
    input wire iCLK,
    input wire iCLK_n,
    input wire iGO,
    input wire [2:0] iCH,
    input wire iDOUT,
    output reg [7:0] oLED,
    output reg oDIN,
    output reg oCS_n,
    output reg oSCLK
);

    reg go_en;
    reg [3:0] cont;
    reg [11:0] adc_data;

    [MASKED]

endmodule