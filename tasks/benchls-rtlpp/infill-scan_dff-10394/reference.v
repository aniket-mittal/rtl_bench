module rtlpp_10394 (
    Q,
    CLK,
    D,
    SCD,
    SCE,
    RESET_B
);

    output reg Q;
    input  CLK;
    input  D;
    input  SCD;
    input  SCE;
    input  RESET_B;

    always @(posedge CLK or negedge RESET_B) begin
        if (!RESET_B) 
            Q <= 1'b0; // Assuming reset to 0
        else if (SCE)
            Q <= SCD;
        else
            Q <= D;
    end
endmodule