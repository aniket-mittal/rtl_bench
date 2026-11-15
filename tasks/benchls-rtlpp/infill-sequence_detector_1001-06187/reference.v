module rtlpp_06187 (
    input CLK,
    input [3:0] I,
    output Y
);

    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
    reg [2:0] NS, PS;
    reg temp;

    always @(posedge CLK)
        PS <= NS;

    always @(PS or I) begin
        case (PS)
            S0: begin
                temp = 0;
                if (I[3] == 0 && I[2] == 0 && I[1] == 0 && I[0] == 1)
                    NS = S1;
                else
                    NS = S0;
            end
            S1: begin
                temp = 0;
                if (I[3] == 0 && I[2] == 0 && I[1] == 0 && I[0] == 0)
                    NS = S2;
                else
                    NS = S0;
            end
            S2: begin
                temp = 0;
                if (I[3] == 1 && I[2] == 0 && I[1] == 0 && I[0] == 1)
                    NS = S3;
                else
                    NS = S0;
            end
            S3: begin
                if (I[3] == 0 && I[2] == 1 && I[1] == 0 && I[0] == 0) begin
                    temp = 0;
                    NS = S4;
                end else begin
                    temp = 0;
                    NS = S0;
                end
            end
            S4: begin
                temp = 1;
                if (I[3] == 0 && I[2] == 0 && I[1] == 0 && I[0] == 1)
                    NS = S1;
                else
                    NS = S0;
            end
            default: begin
                NS = S0;
                temp = 0;
            end
        endcase
    end

    assign Y = temp;

endmodule