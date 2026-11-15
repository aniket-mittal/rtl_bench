module origen_093801 (
    input wire iClk,
    input wire iClrn,
    input wire iValid,
    input wire iCheck,
    input wire iPSync,
    input wire [7:0] iData,
    output reg [7:0] oData,
    output reg oValid,
    output reg oCheck,
    output reg oPSync
);

    parameter [14:0] INITIALBITS = 15'h7FFF;

    reg [14:0] prbs;
    reg [2:0] packCnt;
    wire prbsbit;

    assign prbsbit = prbs[14] ^ prbs[13];

    always @(posedge iClk or negedge iClrn) begin
        if (!iClrn) begin
            prbs <= INITIALBITS;
            packCnt <= 3'b0;
            oData <= 8'b0;
            oValid <= 1'b0;
            oCheck <= 1'b0;
            oPSync <= 1'b0;
        end else begin
            oValid <= iValid;
            oCheck <= iCheck;
            oPSync <= iPSync;

            if (iValid) begin
                if (iPSync) begin
                    if (packCnt == 3'b0) begin
                        prbs <= INITIALBITS;
                        oData <= ~iData;
                    end else begin
                        oData <= iData;
                    end
                    packCnt <= packCnt + 1'b1;
                end else if (iCheck) begin
                    oData <= 8'b0;
                end else begin
                    oData <= iData ^ prbs[7:0];
                    prbs <= {prbs[13:0], prbsbit};
                end
            end
        end
    end

endmodule