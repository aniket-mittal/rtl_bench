module origen_222985 (
    input [15:0] D,
    input [3:0] S,
    input VPWR,
    input VGND,
    input VPB,
    input VNB,
    output reg Z
);

reg [15:0] d_reg;
reg [3:0] s_reg;
reg vpwr_reg, vgnd_reg, vpb_reg, vnb_reg;

initial begin
    d_reg = 16'bX;
    s_reg = 4'bX;
    vpwr_reg = 1'bX;
    vgnd_reg = 1'bX;
    vpb_reg = 1'bX;
    vnb_reg = 1'bX;
end

always @(D, S, VPWR, VGND, VPB, VNB) begin
    if (VPWR == 1'bX && VGND == 1'bX && VPB == 1'bX && VNB == 1'bX) begin
        d_reg = 16'bX;
        s_reg = 4'bX;
        vpwr_reg = 1'bX;
        vgnd_reg = 1'bX;
        vpb_reg = 1'bX;
        vnb_reg = 1'bX;
    end

    if (VPWR == 1'b0 && VGND == 1'b0 && VPB == 1'b0 && VNB == 1'b0) begin
        d_reg = 16'b0;
        s_reg = 4'b0;
        vpwr_reg = 1'b0;
        vgnd_reg = 1'b0;
        vpb_reg = 1'b0;
        vnb_reg = 1'b0;
    end

    if (VPWR == 1'b1 && VGND == 1'b1 && VPB == 1'b1 && VNB == 1'b1) begin
        d_reg = 16'b1;
        s_reg = 4'b1;
        vpwr_reg = 1'b1;
        vgnd_reg = 1'b1;
        vpb_reg = 1'b1;
        vnb_reg = 1'b1;
    end

    if (VPWR == 1'bX) begin
        vpwr_reg = 1'bX;
    end

    if (VGND == 1'bX) begin
        vgnd_reg = 1'bX;
    end

    if (VPB == 1'bX) begin
        vpb_reg = 1'bX;
    end

    if (VNB == 1'bX) begin
        vnb_reg = 1'bX;
    end

    if (D == 16'bX) begin
        d_reg = 16'bX;
    end

    if (S == 4'bX) begin
        s_reg = 4'bX;
    end

    Z = d_reg[s_reg];
end

always @(d_reg or s_reg or vpwr_reg or vgnd_reg or vpb_reg or vnb_reg) begin
    #20 d_reg = 16'b0;
    #40 s_reg = 4'b0;
    #60 vgnd_reg = 1'b0;
    #80 vnb_reg = 1'b0;
    #100 vpb_reg = 1'b0;
    #120 vpwr_reg = 1'b0;
    #140 d_reg = 16'b1;
    #160 s_reg = 4'b1;
    #180 vgnd_reg = 1'b1;
    #200 vnb_reg = 1'b1;
    #220 vpb_reg = 1'b1;
    #240 vpwr_reg = 1'b1;
    #260 d_reg = 16'b0;
    #280 s_reg = 4'b0;
    #300 vgnd_reg = 1'b0;
    #320 vnb_reg = 1'b0;
    #340 vpb_reg = 1'b0;
    #360 vpwr_reg = 1'b0;
    #380 vpwr_reg = 1'b1;
    #400 vpb_reg = 1'bX;
    #420 vnb_reg = 1'bX;
    #440 vgnd_reg = 1'bX;
    #460 s_reg = 4'bX;
    #480 d_reg = 16'bX;
    #500 vpwr_reg = 1'bX;
    #520 vpb_reg = 1'bX;
    #540 vnb_reg = 1'bX;
    #560 vgnd_reg = 1'bX;
    #580 s_reg = 4'bX;
    #600 d_reg = 16'bX;
end

endmodule