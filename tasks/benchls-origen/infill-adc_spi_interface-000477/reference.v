module origen_000477 (
    input wire iRST,
    input wire iCLK,
    input wire iCLK_n,
    input wire iGO,
    input wire [2:0] iCH,
    input wire iDOUT,
    output reg [7:0] oLED,
    output reg oDIN,
    output reg oCS_n,
    output reg oSCLK
);

    reg go_en;
    reg [3:0] cont;
    reg [11:0] adc_data;

    always @(posedge iCLK or negedge iRST) begin
        if (!iRST) begin
            go_en <= 1'b0;
            cont <= 4'd0;
            adc_data <= 12'd0;
            oLED <= 8'd0;
            oDIN <= 1'b0;
            oCS_n <= 1'b1;
            oSCLK <= 1'b0;
        end else begin
            if (iGO && !go_en) begin
                go_en <= 1'b1;
                cont <= 4'd0;
            end else if (go_en) begin
                cont <= cont + 1'b1;
                if (cont == 4'd15) begin
                    go_en <= 1'b0;
                end
            end

            oCS_n <= ~go_en;
            oSCLK <= go_en ? iCLK : 1'b0;

            case (cont)
                4'd1: oLED <= adc_data[11:4];
                4'd2: oDIN <= iCH[2];
                4'd3: oDIN <= iCH[1];
                4'd4: oDIN <= iCH[0];
                default: oDIN <= 1'b0;
            endcase

            if (cont >= 4'd4 && cont <= 4'd15) begin
                adc_data <= {adc_data[10:0], iDOUT};
            end
        end
    end

endmodule