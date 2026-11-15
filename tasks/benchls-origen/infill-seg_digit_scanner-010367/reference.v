module origen_010367(
    input wire CLK,
    input wire RSTn,
    input wire [15:0] NumberSig,
    output reg [3:0] NumberData
);

    parameter T1MS = 500000;

    reg [18:0] C1;
    reg [1:0] i;
    reg [3:0] rNumber;

    always @(posedge CLK or negedge RSTn) begin
        if (!RSTn) begin
            C1 <= 19'd0;
            i <= 2'd0;
            rNumber <= 4'd0;
        end else begin
            if (C1 == T1MS - 1) begin
                C1 <= 19'd0;
                case (i)
                    2'd0: begin
                        rNumber <= NumberSig[15:12];
                        i <= 2'd1;
                    end
                    2'd1: begin
                        rNumber <= NumberSig[11:8];
                        i <= 2'd2;
                    end
                    2'd2: begin
                        rNumber <= NumberSig[7:4];
                        i <= 2'd3;
                    end
                    2'd3: begin
                        rNumber <= NumberSig[3:0];
                        i <= 2'd0;
                    end
                endcase
            end else begin
                C1 <= C1 + 1'b1;
            end
        end
    end

    always @(posedge CLK or negedge RSTn) begin
        if (!RSTn) begin
            NumberData <= 4'd0;
        end else begin
            NumberData <= rNumber;
        end
    end

endmodule