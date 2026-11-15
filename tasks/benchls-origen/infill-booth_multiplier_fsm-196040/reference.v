module origen_196040(
    input go,
    input Ao,
    input Qo,
    input clck,
    input rst,
    output reg initP,
    output reg ldP,
    output reg ldB,
    output reg one_selB,
    output reg zero_selB,
    output reg ldQ,
    output reg initQ,
    output reg ldA,
    output reg done
);

    reg [3:0] ps, ns;
    parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011, S4 = 4'b0100,
              S5 = 4'b0101, S6 = 4'b0110, S7 = 4'b0111, S8 = 4'b1000, S9 = 4'b1001, S10 = 4'b1010;

    always @(posedge clck or posedge rst) begin
        if (rst)
            ps <= S0;
        else
            ps <= ns;
    end

    always @(*) begin
        case (ps)
            S0: begin
                done = 1;
                initP = 0;
                ldP = 0;
                ldB = 0;
                one_selB = 0;
                zero_selB = 0;
                ldQ = 0;
                initQ = 0;
                ldA = 0;
                ns = (go) ? S1 : S0;
            end
            S1: begin
                done = 0;
                initP = 1;
                one_selB = 1;
                ldP = 0;
                ldB = 0;
                zero_selB = 0;
                ldQ = 0;
                initQ = 0;
                ldA = 0;
                ns = (go) ? S1 : S2;
            end
            S2: begin
                done = 0;
                initP = 0;
                ldP = 1;
                ldB = 1;
                one_selB = 0;
                zero_selB = 0;
                ldQ = 0;
                initQ = 0;
                ldA = 0;
                ns = S3;
            end
            S3: begin
                done = 0;
                initP = 0;
                ldP = 0;
                ldB = 0;
                one_selB = 0;
                zero_selB = 0;
                ldQ = (Ao) ? 1 : 0;
                initQ = 0;
                ldA = 0;
                ns = S4;
            end
            S4: begin
                done = 0;
                initP = 0;
                ldP = 0;
                ldB = 0;
                one_selB = 0;
                zero_selB = 0;
                ldQ = 0;
                initQ = (Qo) ? 1 : 0;
                ldA = 0;
                ns = S5;
            end
            S5: begin
                done = 0;
                initP = 0;
                ldP = 0;
                ldB = 0;
                one_selB = 0;
                zero_selB = 0;
                ldQ = 0;
                initQ = 0;
                ldA = 1;
                ns = S6;
            end
            S6: begin
                done = 0;
                initP = 0;
                ldP = 0;
                ldB = 0;
                one_selB = 0;
                zero_selB = 0;
                ldQ = 0;
                initQ = 0;
                ldA = 0;
                ns = S7;
            end
            S7: begin
                done = 0;
                initP = 0;
                ldP = 0;
                ldB = 0;
                one_selB = 0;
                zero_selB = 0;
                ldQ = 0;
                initQ = 0;
                ldA = 0;
                ns = S8;
            end
            S8: begin
                done = 0;
                initP = 0;
                ldP = 0;
                ldB = 0;
                one_selB = 0;
                zero_selB = 0;
                ldQ = 0;
                initQ = 0;
                ldA = 0;
                ns = S9;
            end
            S9: begin
                done = 0;
                initP = 0;
                ldP = 0;
                ldB = 0;
                one_selB = 0;
                zero_selB = 0;
                ldQ = 0;
                initQ = 0;
                ldA = 0;
                ns = S10;
            end
            S10: begin
                done = 0;
                initP = 0;
                ldP = 0;
                ldB = 0;
                one_selB = 0;
                zero_selB = 0;
                ldQ = 0;
                initQ = 0;
                ldA = 0;
                ns = S0;
            end
            default: begin
                done = 0;
                initP = 0;
                ldP = 0;
                ldB = 0;
                one_selB = 0;
                zero_selB = 0;
                ldQ = 0;
                initQ = 0;
                ldA = 0;
                ns = S0;
            end
        endcase
    end

endmodule