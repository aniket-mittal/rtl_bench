module origen_129393 (
    input A0, A1, A2, A3,
    input S0, S1,
    input VPWR, VGND, VPB, VNB,
    output reg X
);

    [MASKED]

endmodule

module testbench;
    reg A0, A1, A2, A3;
    reg S0, S1;
    reg VPWR, VGND, VPB, VNB;
    wire X;

    MUX4 dut (
        .A0(A0), .A1(A1), .A2(A2), .A3(A3),
        .S0(S0), .S1(S1),
        .VPWR(VPWR), .VGND(VGND), .VPB(VPB), .VNB(VNB),
        .X(X)
    );

    initial begin
        // Initialize all inputs
        {A0, A1, A2, A3, S0, S1, VPWR, VGND, VPB, VNB} = 10'b1111111111;

        #20 A0 = 0;
        #20 A1 = 0;
        #20 A2 = 0;
        #20 A3 = 0;
        #20 S0 = 0;
        #20 S1 = 0;
        #20 VGND = 0;
        #20 VNB = 0;
        #20 VPB = 0;
        #20 VPWR = 0;
        #20 A0 = 1;
        #20 A1 = 1;
        #20 A2 = 1;
        #20 A3 = 1;
        #20 S0 = 1;
        #20 S1 = 1;
        #20 VGND = 1;
        #20 VNB = 1;
        #20 VPB = 1;
        #20 VPWR = 1;
        #20 A0 = 0;
        #20 A1 = 0;
        #20 A2 = 0;
        #20 A3 = 0;
        #20 S0 = 0;
        #20 S1 = 0;
        #20 VGND = 0;
        #20 VNB = 0;
        #20 VPB = 0;
        #20 VPWR = 0;
        #20 VPWR = 1;
        #20 VPB = 1;
        #20 VNB = 1;
        #20 VGND = 1;
        #20 S1 = 1;
        #20 S0 = 1;
        #20 A3 = 1;
        #20 A2 = 1;
        #20 A1 = 1;
        #20 A0 = 1;
        #20 VPWR = 1'bx;
        #20 VPB = 1'bx;
        #20 VNB = 1'bx;
        #20 VGND = 1'bx;
        #20 S1 = 1'bx;
        #20 S0 = 1'bx;
        #20 A3 = 1'bx;
        #20 A2 = 1'bx;
        #20 A1 = 1'bx;
        #20 A0 = 1'bx;

        #20 ;
    end

    initial begin
        $dumpfile("mux4_test.vcd");
        $dumpvars(0, testbench);
    end
endmodule