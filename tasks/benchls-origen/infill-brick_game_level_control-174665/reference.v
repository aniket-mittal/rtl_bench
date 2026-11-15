module origen_174665(
    input iCLK,
    input iRST,
    input iLevel_Up,
    input iLevel_Down,
    input [299:0] iState_flag,
    input iBallDie,
    input iSpecial_attacked,
    output reg [1:0] oLevel,
    output reg [1:0] oSlider_flag,
    output reg oSpecial_block,
    output reg oRST
);

    reg COUNT_ACT;
    reg PASS_LEVEL;
    reg [17:0] oRST_COUNT;

    initial begin
        oLevel = 2'b00;
        oSlider_flag = 2'b00;
        oSpecial_block = 1'b1;
    end

    always @(posedge iCLK or negedge iRST) begin
        if (!iRST) begin
            oRST <= 1'b0;
            oSpecial_block <= 1'b1;
        end
        else begin
            if (iSpecial_attacked) begin
                oSpecial_block <= 1'b0;
            end
        end
    end

    always @(posedge iCLK) begin
        if (COUNT_ACT) begin
            oRST_COUNT <= oRST_COUNT + 1'b1;
            if (oRST_COUNT >= 17'd99999) begin
                oRST <= 1'b0;
            end
        end
        else begin
            oRST_COUNT <= 17'b0;
        end
    end

    always @(posedge iCLK or negedge iRST) begin
        if (!iRST) begin
            oLevel <= 2'b00;
            oSlider_flag <= 2'b00;
        end
        else begin
            if (!iLevel_Up) begin
                if (oLevel < 2'b10) begin
                    oLevel <= oLevel + 1'b1;
                    oSlider_flag <= 2'b11;
                end
            end
            else if (!iLevel_Down) begin
                if (oLevel > 2'b00) begin
                    oLevel <= oLevel - 1'b1;
                    case (oLevel)
                        2'b10: oSlider_flag <= 2'b11;
                        2'b01: oSlider_flag <= 2'b10;
                        2'b00: oSlider_flag <= 2'b00;
                    endcase
                end
            end
            else if (iState_flag == 300'b0 && oLevel < 2'b10) begin
                oLevel <= oLevel + 1'b1;
                oSlider_flag <= 2'b11;
            end
        end
    end

    always @(*) begin
        if (iBallDie || oRST_COUNT >= 17'd99999) begin
            COUNT_ACT = 1'b1;
        end
        else begin
            COUNT_ACT = 1'b0;
        end

        if (oLevel == 2'b10 && iState_flag == 300'b0) begin
            PASS_LEVEL = 1'b1;
        end
        else begin
            PASS_LEVEL = 1'b0;
        end
    end

endmodule