module origen_098999(
    input wire clock,
    input wire reset,
    input wire start,
    input wire score,
    input wire fail,
    input wire crush,
    output reg next,
    output reg [6:0] hex
);

    // State encoding
    parameter [6:0] S0 = 7'b1000000, S1 = 7'b1111001, S2 = 7'b0100100, S3 = 7'b0110000,
                    S4 = 7'b0011001, S5 = 7'b0010010, S6 = 7'b0000010, S7 = 7'b1111000,
                    S8 = 7'b0000000, S9 = 7'b0010000;

    reg [6:0] ps, ns;

    // State register
    always @(posedge clock or posedge reset) begin
        if (reset)
            ps <= S0;
        else
            ps <= ns;
    end

    // Next state logic
    always @(*) begin
        ns = ps;
        next = 1'b0;
        
        if (start && score && !crush && !fail) begin
            case (ps)
                S0: ns = S1;
                S1: ns = S2;
                S2: ns = S3;
                S3: ns = S4;
                S4: ns = S5;
                S5: ns = S6;
                S6: ns = S7;
                S7: ns = S8;
                S8: ns = S9;
                S9: begin
                    ns = S0;
                    next = 1'b1;
                end
                default: ns = S0;
            endcase
        end
    end

    // Output logic
    always @(*) begin
        hex = ps;
    end

endmodule