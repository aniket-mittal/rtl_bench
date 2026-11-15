module origen_015024(
    input CLK,
    input RSTn,
    output reg [2:0] Scan_Sig
);

    parameter T1MS = 16'd49999;

    reg [15:0] C1;
    reg [3:0] i;
    reg [2:0] rScan;

    always @(posedge CLK or negedge RSTn) begin
        if (!RSTn) begin
            C1 <= 16'd0;
            i <= 4'd0;
            rScan <= 3'b000;
        end
        else begin
            if (C1 == T1MS) begin
                C1 <= 16'd0;
                case (i)
                    4'd0: begin
                        i <= 4'd1;
                        rScan <= 3'b100;
                    end
                    4'd1: begin
                        i <= 4'd2;
                        rScan <= 3'b010;
                    end
                    4'd2: begin
                        i <= 4'd0;
                        rScan <= 3'b001;
                    end
                    default: begin
                        i <= 4'd0;
                        rScan <= 3'b000;
                    end
                endcase
            end
            else begin
                C1 <= C1 + 1'b1;
            end
        end
    end

    always @(posedge CLK or negedge RSTn) begin
        if (!RSTn)
            Scan_Sig <= 3'b000;
        else
            Scan_Sig <= rScan;
    end

endmodule