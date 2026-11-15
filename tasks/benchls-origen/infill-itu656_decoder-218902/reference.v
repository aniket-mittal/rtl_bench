module origen_218902 (
    input                   iCLK_27,
    input                   iRST_N,
    input                   iSkip,
    input                   iSwap_CbCr,
    input        [7:0]       iTD_DATA,
    output       [15:0]      oYCbCr,
    output       [9:0]       oTV_X,
    output       [9:0]       oTV_Y,
    output       [31:0]      oTV_Cont,
    output                  oDVAL
);

    reg  [23:0]  Window;
    reg  [17:0]  Cont;
    reg          Active_Video;
    reg          Start;
    reg          Data_Valid;
    reg          Pre_Field, Field;
    reg          SAV;
    reg          FVAL;
    reg  [9:0]   TV_Y;
    reg  [31:0]  Data_Cont;
    reg  [7:0]   Cb, Cr;
    reg  [15:0]  YCbCr;

    always @(posedge iCLK_27 or negedge iRST_N) begin
        if (!iRST_N) begin
            Window <= 24'h000000;
            Cont <= 18'h00000;
            Active_Video <= 1'b0;
            Start <= 1'b0;
            Data_Valid <= 1'b0;
            Pre_Field <= 1'b0;
            Field <= 1'b0;
            SAV <= 1'b0;
            FVAL <= 1'b0;
            TV_Y <= 10'h000;
            Data_Cont <= 32'h00000000;
            Cb <= 8'h00;
            Cr <= 8'h00;
            YCbCr <= 16'h0000;
        end else begin
            Window <= {Window[15:0], iTD_DATA};
            Cont <= Cont + 18'h00001;

            if (Window[23:16] == 8'hFF && Window[15:8] == 8'h00 && Window[7:0] == 8'h00) begin
                SAV <= 1'b1;
                if (Cont[0]) begin
                    Field <= ~Field;
                    FVAL <= 1'b1;
                end else begin
                    FVAL <= 1'b0;
                end
            end else begin
                SAV <= 1'b0;
            end

            if (SAV) begin
                Active_Video <= 1'b1;
                if (Cont[17:1] == 17'h00000) begin
                    Start <= 1'b1;
                    TV_Y <= 10'h000;
                end else begin
                    Start <= 1'b0;
                    TV_Y <= TV_Y + 10'h001;
                end
            end else begin
                Active_Video <= 1'b0;
                Start <= 1'b0;
            end

            if (Active_Video) begin
                if (!iSkip) begin
                    Data_Valid <= 1'b1;
                    if (iSwap_CbCr) begin
                        Cr <= Window[23:16];
                        Cb <= Window[15:8];
                    end else begin
                        Cb <= Window[23:16];
                        Cr <= Window[15:8];
                    end
                    YCbCr <= {Window[15:8], Window[7:0]};
                end else begin
                    Data_Valid <= 1'b0;
                end
            end else begin
                Data_Valid <= 1'b0;
            end

            Data_Cont <= Data_Cont + 32'h00000001;
        end
    end

    assign oYCbCr = YCbCr;
    assign oTV_X = Cont[17:8];
    assign oTV_Y = TV_Y;
    assign oTV_Cont = Data_Cont;
    assign oDVAL = Data_Valid;

endmodule