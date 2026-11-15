module origen_086076 (
    input wire reset,
    input wire iClkOrb,
    input wire [11:0] iWord,
    output reg [10:0] oAddr,
    output reg oRdEn,
    output reg oSwitch,
    output reg oOrbit,
    output reg [11:0] oParallel,
    output reg oVal,
    output reg [5:0] cycle,
    output reg RqSlow,
    output reg RqFast
);

    reg [1:0] seq;
    reg [3:0] cntBit;
    reg [10:0] cntWrd;
    reg [3:0] cntPhr;
    reg [2:0] cntGrp;
    reg [7:0] cntFrm;
    reg [11:0] word;
    reg [10:0] cntRqFast;
    reg [14:0] cntRqSlow;

    always @(posedge iClkOrb or negedge reset) begin
        if (!reset) begin
            seq <= 2'b00;
            cntBit <= 4'b0;
            cntWrd <= 11'b0;
            cntPhr <= 4'b0;
            cntGrp <= 3'b0;
            cntFrm <= 8'b0;
            oAddr <= 11'b0;
            oRdEn <= 1'b0;
            oSwitch <= 1'b0;
            oOrbit <= 1'b0;
            oParallel <= 12'b0;
            oVal <= 1'b0;
            cycle <= 6'b0;
            RqSlow <= 1'b0;
            RqFast <= 1'b0;
            word <= 12'b0;
            cntRqFast <= 11'b0;
            cntRqSlow <= 15'b0;
        end else begin
            case (seq)
                2'b00: begin
                    oRdEn <= 1'b1;
                    seq <= 2'b01;
                end
                2'b01: begin
                    word <= iWord;
                    oRdEn <= 1'b0;
                    seq <= 2'b10;
                end
                2'b10: begin
                    oOrbit <= word[cntBit];
                    oVal <= 1'b1;
                    if (cntBit == 4'd11) begin
                        seq <= 2'b11;
                        cntBit <= 4'b0;
                    end else begin
                        cntBit <= cntBit + 1'b1;
                    end
                end
                2'b11: begin
                    oVal <= 1'b0;
                    if (cntWrd == 11'd2047) begin
                        cntWrd <= 11'b0;
                        oSwitch <= ~oSwitch;
                        if (cntPhr == 4'd11) begin
                            cntPhr <= 4'b0;
                            if (cntGrp == 3'd5) begin
                                cntGrp <= 3'b0;
                                cntFrm <= cntFrm + 1'b1;
                            end else begin
                                cntGrp <= cntGrp + 1'b1;
                            end
                        end else begin
                            cntPhr <= cntPhr + 1'b1;
                        end
                    end else begin
                        cntWrd <= cntWrd + 1'b1;
                    end
                    oAddr <= cntWrd;
                    seq <= 2'b00;
                end
            endcase

            // RqFast logic
            if (cntRqFast == 11'd1535) begin
                cntRqFast <= 11'b0;
                RqFast <= 1'b1;
                cycle <= cycle + 1'b1;
            end else begin
                cntRqFast <= cntRqFast + 1'b1;
                if (cntRqFast == 11'd20) RqFast <= 1'b0;
            end

            // RqSlow logic
            if (cntRqSlow == 15'd24575) begin
                cntRqSlow <= 15'b0;
                RqSlow <= 1'b1;
            end else begin
                cntRqSlow <= cntRqSlow + 1'b1;
                if (cntRqSlow == 15'd2048) RqSlow <= 1'b0;
            end

            // oParallel logic
            oParallel <= word;
            if (cntPhr == 4'd0) oParallel[11] <= 1'b1;
            if (cntGrp == 3'd0) oParallel[10] <= 1'b1;
            if (cntFrm == 8'd0) oParallel[9] <= 1'b1;
            if (cntWrd == 11'd0) oParallel[8] <= 1'b1;
        end
    end

endmodule