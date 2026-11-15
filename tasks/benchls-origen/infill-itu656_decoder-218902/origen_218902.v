module origen_218902 (
    input                   iCLK_27,
    input                   iRST_N,
    input                   iSkip,
    input                   iSwap_CbCr,
    input        [7:0]       iTD_DATA,
    output       [15:0]      oYCbCr,
    output       [9:0]       oTV_X,
    output       [9:0]       oTV_Y,
    output       [31:0]      oTV_Cont,
    output                  oDVAL
);

    reg  [23:0]  Window;
    reg  [17:0]  Cont;
    reg          Active_Video;
    reg          Start;
    reg          Data_Valid;
    reg          Pre_Field, Field;
    reg          SAV;
    reg          FVAL;
    reg  [9:0]   TV_Y;
    reg  [31:0]  Data_Cont;
    reg  [7:0]   Cb, Cr;
    reg  [15:0]  YCbCr;

    [MASKED]

    assign oYCbCr = YCbCr;
    assign oTV_X = Cont[17:8];
    assign oTV_Y = TV_Y;
    assign oTV_Cont = Data_Cont;
    assign oDVAL = Data_Valid;

endmodule