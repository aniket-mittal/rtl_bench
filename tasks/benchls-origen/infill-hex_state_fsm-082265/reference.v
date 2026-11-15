module origen_082265(
    input wire reset,
    input wire clock,
    input wire in0,
    input wire in1,
    output reg [3:0] outHex
);

    // State encoding
    parameter A = 5'b00001;
    parameter B = 5'b00010;
    parameter C = 5'b00100;
    parameter D = 5'b01000;
    parameter E = 5'b10000;
    parameter F = 5'b10001;

    reg [4:0] fstate, reg_fstate;

    // State transition logic
    always @(posedge clock or negedge reset) begin
        if (!reset)
            fstate <= A;
        else
            fstate <= reg_fstate;
    end

    // Next state logic
    always @(*) begin
        case (fstate)
            A: begin
                if (in0 && !in1)
                    reg_fstate = B;
                else if (in1 && !in0)
                    reg_fstate = D;
                else
                    reg_fstate = A;
            end
            B: begin
                if (in0 && !in1)
                    reg_fstate = C;
                else if (in1 && !in0)
                    reg_fstate = F;
                else
                    reg_fstate = B;
            end
            C: begin
                if (in1 && !in0)
                    reg_fstate = D;
                else if (in0 && !in1)
                    reg_fstate = C;
                else
                    reg_fstate = C;
            end
            D: begin
                if (in1 && !in0)
                    reg_fstate = E;
                else if (in0 && !in1)
                    reg_fstate = B;
                else
                    reg_fstate = D;
            end
            E: begin
                if (in0 && !in1)
                    reg_fstate = B;
                else if (in1 && !in0)
                    reg_fstate = E;
                else
                    reg_fstate = E;
            end
            F: begin
                if (in0 && !in1)
                    reg_fstate = B;
                else if (in1 && !in0)
                    reg_fstate = F;
                else
                    reg_fstate = F;
            end
            default: reg_fstate = A;
        endcase
    end

    // Output logic
    always @(*) begin
        case (fstate)
            A: outHex = 4'b0001;
            B: outHex = 4'b0010;
            C: outHex = 4'b0011;
            D: outHex = 4'b0100;
            E: outHex = 4'b0101;
            F: outHex = 4'b0110;
            default: outHex = 4'b0000;
        endcase
    end

endmodule