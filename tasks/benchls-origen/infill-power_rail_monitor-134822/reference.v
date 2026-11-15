module origen_134822 (
    output wire VPWR,
    output wire VGND,
    output reg VPB,
    output reg VNB
);

    // Define supply signals
    supply1 vdd;
    supply0 gnd;

    // Assign VPWR and VGND
    assign VPWR = vdd;
    assign VGND = gnd;

    // Initialize VPB and VNB
    initial begin
        VPB = 1'b0;
        VNB = 1'b0;
    end

    // Monitor VPWR for transitions
    always @(VPWR) begin
        case (VPWR)
            1'b0: begin
                // VPWR is 0
                VPB <= 1'b0;
                VNB <= 1'b0;
            end
            1'b1: begin
                // VPWR is 1
                VPB <= 1'b1;
                VNB <= 1'b1;
            end
            1'bx, 1'bz: begin
                // VPWR is unknown or high-impedance
                VPB <= 1'bx;
                VNB <= 1'bx;
            end
        endcase
    end

    // Handle transitions
    always @(posedge VPWR) begin
        // VPWR transitions from 0 to 1
        VPB <= 1'b1;
        VNB <= 1'b0;
    end

    always @(negedge VPWR) begin
        // VPWR transitions from 1 to 0
        VPB <= 1'b0;
        VNB <= 1'b1;
    end

endmodule