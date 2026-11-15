module rtlpp_10821(
    input CLK,
    input SLOT,
    input WRREG_Z,
    input WRREG_W,
    input [3:0] REGNUM_X,
    input [3:0] REGNUM_Y,
    input [3:0] REGNUM_Z,
    input [3:0] REGNUM_W,
    output [31:0] REG_X,
    output [31:0] REG_Y,
    output [31:0] REG_0,
    input [31:0] ZBUS,
    input [31:0] WBUS
);

    reg [31:0] REG[0:15]; 

    [MASKED]

    assign REG_X = REG[REGNUM_X];
    assign REG_Y = REG[REGNUM_Y];
    assign REG_0 = REG[4'h0];

endmodule