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

    always @(posedge CLK)
    begin
        if (SLOT)
        begin
            if (WRREG_W && !WRREG_Z)
                REG[REGNUM_W] <= WBUS;
            else if (!WRREG_W && WRREG_Z)
                REG[REGNUM_Z] <= ZBUS;
            else if (WRREG_W && WRREG_Z && (REGNUM_W != REGNUM_Z))
            begin
                REG[REGNUM_W] <= WBUS;
                REG[REGNUM_Z] <= ZBUS;
            end
            else if (WRREG_W && WRREG_Z && (REGNUM_W == REGNUM_Z))
                REG[REGNUM_Z] <= ZBUS;
        end
    end

    assign REG_X = REG[REGNUM_X];
    assign REG_Y = REG[REGNUM_Y];
    assign REG_0 = REG[4'h0];

endmodule