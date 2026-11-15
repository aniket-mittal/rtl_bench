module origen_015024(
    input CLK,
    input RSTn,
    output reg [2:0] Scan_Sig
);

    parameter T1MS = 16'd49999;

    reg [15:0] C1;
    reg [3:0] i;
    reg [2:0] rScan;

    [MASKED]

    always @(posedge CLK or negedge RSTn) begin
        if (!RSTn)
            Scan_Sig <= 3'b000;
        else
            Scan_Sig <= rScan;
    end

endmodule