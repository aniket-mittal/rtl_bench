module rtlpp_09906 (
    input CE,
    input CLK,
    input CLR,
    output CEO,
    output Q0,
    output Q1,
    output Q2,
    output Q3,
    output Q4,
    output TC
);
    reg Q0_DUMMY = 1'b1;
    reg Q1_DUMMY = 1'b1;
    reg Q2_DUMMY = 1'b0;
    reg Q3_DUMMY = 1'b0;
    reg Q4_DUMMY = 1'b0;
    reg TC_DUMMY;
    wire XLXN_2;
    wire XLXN_6;
    wire XLXN_7;
    wire XLXN_8;
    wire XLXN_9;
    wire XLXN_10;
    wire XLXN_11;
    wire XLXN_12;
    wire XLXN_13;
    wire XLXN_14;
    wire XLXN_15;
    wire XLXN_16;
    wire XLXN_17;
    wire XLXN_18;
    wire XLXN_19;

    assign Q0 = Q0_DUMMY;
    assign Q1 = Q1_DUMMY;
    assign Q2 = Q2_DUMMY;
    assign Q3 = Q3_DUMMY;
    assign Q4 = Q4_DUMMY;
    assign TC = TC_DUMMY;

    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q0_DUMMY <= 1'b1;
        end else if (CE) begin
            if (!XLXN_2) begin
                if (1'b1)
                    Q0_DUMMY <= 1'b0;
            end else begin
                if (!1'b1)
                    Q0_DUMMY <= 1'b1;
                else
                    Q0_DUMMY <= !Q0_DUMMY;
            end
        end
    end

    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q1_DUMMY <= 1'b1;
        end else if (CE) begin
            if (!Q0_DUMMY) begin
                if (XLXN_6)
                    Q1_DUMMY <= 1'b0;
            end else begin
                if (!XLXN_6)
                    Q1_DUMMY <= 1'b1;
                else
                    Q1_DUMMY <= !Q1_DUMMY;
            end
        end
    end

    always @(posedge CLK or posedge CLR) begin
        if (CLR)
            Q2_DUMMY <= 1'b0;
        else if (CE) begin
            if (!XLXN_9) begin
                if (XLXN_8)
                    Q2_DUMMY <= 1'b0;
            end else begin
                if (!XLXN_8)
                    Q2_DUMMY <= 1'b1;
                else
                    Q2_DUMMY <= !Q2_DUMMY;
            end
        end
    end

    always @(posedge CLK or posedge CLR) begin
        if (CLR)
            Q3_DUMMY <= 1'b0;
        else if (CE) begin
            if (!XLXN_13) begin
                if (XLXN_10)
                    Q3_DUMMY <= 1'b0;
            end else begin
                if (!XLXN_10)
                    Q3_DUMMY <= 1'b1;
                else
                    Q3_DUMMY <= !Q3_DUMMY;
            end
        end
    end

    always @(posedge CLK or posedge CLR) begin
        if (CLR)
            Q4_DUMMY <= 1'b0;
        else if (CE) begin
            if (!XLXN_15) begin
                if (XLXN_14)
                    Q4_DUMMY <= 1'b0;
            end else begin
                if (!XLXN_14)
                    Q4_DUMMY <= 1'b1;
                else
                    Q4_DUMMY <= !Q4_DUMMY;
            end
        end
    end

    assign XLXN_2 = ~(Q1_DUMMY | Q3_DUMMY | Q4_DUMMY);
    assign XLXN_6 = Q0_DUMMY | XLXN_7;
    assign XLXN_7 = Q3_DUMMY & Q4_DUMMY;
    assign XLXN_8 = Q0_DUMMY & Q1_DUMMY;
    assign XLXN_9 = Q0_DUMMY & Q1_DUMMY;
    assign XLXN_10 = XLXN_11 | XLXN_12;
    assign XLXN_11 = Q1_DUMMY & Q4_DUMMY;
    assign XLXN_12 = Q0_DUMMY & Q1_DUMMY & Q2_DUMMY;
    assign XLXN_13 = Q0_DUMMY & Q1_DUMMY & Q2_DUMMY;
    assign XLXN_14 = Q1_DUMMY & Q3_DUMMY;
    assign XLXN_15 = Q0_DUMMY & Q1_DUMMY & Q2_DUMMY & Q3_DUMMY;
    assign TC_DUMMY = ~Q0_DUMMY & Q1_DUMMY & ~Q2_DUMMY & ~Q3_DUMMY & ~Q4_DUMMY;
    assign CEO = CE & TC_DUMMY;

endmodule