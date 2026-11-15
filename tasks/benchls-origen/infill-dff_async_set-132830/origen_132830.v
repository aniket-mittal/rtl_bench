`timescale 1ns / 1ps

module origen_132830 (
    input CLK,
    input D,
    input SET_B,
    input VPWR,
    input VGND,
    input VPB,
    input VNB,
    output reg Q
);

    [MASKED]

endmodule

module dff_set_tb;

    // Inputs
    reg CLK;
    reg D;
    reg SET_B;
    reg VPWR;
    reg VGND;
    reg VPB;
    reg VNB;

    // Output
    wire Q;

    // Instantiate the Unit Under Test (UUT)
    dff_set uut (
        .CLK(CLK),
        .D(D),
        .SET_B(SET_B),
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB),
        .Q(Q)
    );

    // Clock generation
    always #5 CLK = ~CLK;

    initial begin
        // Initialize inputs
        CLK = 0;
        D = 0;
        SET_B = 0;
        VPWR = 1;
        VGND = 0;
        VPB = 1;
        VNB = 0;

        // Wait for global reset
        #100;

        // Test case 1: SET_B high
        SET_B = 1;
        #10;
        if (Q !== 1) $display("Error: Q should be high when SET_B is high");

        // Test case 2: SET_B low, D = 0
        SET_B = 0;
        D = 0;
        #10;
        @(posedge CLK);
        #1;
        if (Q !== 0) $display("Error: Q should be 0 when D is 0");

        // Test case 3: SET_B low, D = 1
        D = 1;
        #10;
        @(posedge CLK);
        #1;
        if (Q !== 1) $display("Error: Q should be 1 when D is 1");

        // Test case 4: SET_B low, D toggles
        repeat (5) begin
            D = ~D;
            #10;
            @(posedge CLK);
            #1;
            if (Q !== D) $display("Error: Q should follow D");
        end

        // Test case 5: SET_B high again
        SET_B = 1;
        #10;
        if (Q !== 1) $display("Error: Q should be high when SET_B is high");

        $display("Testbench completed");
        ;
    end

endmodule