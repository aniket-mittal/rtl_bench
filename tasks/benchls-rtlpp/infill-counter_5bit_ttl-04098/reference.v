module rtlpp_04098(
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

    wire Q0_DUMMY, Q1_DUMMY, Q2_DUMMY, Q3_DUMMY, Q4_DUMMY, TC_DUMMY;
    wire XLXN_2, XLXN_3, XLXN_4, XLXN_5, XLXN_6, XLXN_7, XLXN_8, XLXN_9, XLXN_10;
    wire XLXN_11, XLXN_12, XLXN_13, XLXN_14, XLXN_15, XLXN_16, XLXN_17, XLXN_18, XLXN_19;

    assign Q0 = Q0_DUMMY;
    assign Q1 = Q1_DUMMY;
    assign Q2 = Q2_DUMMY;
    assign Q3 = Q3_DUMMY;
    assign Q4 = Q4_DUMMY;
    assign TC = TC_DUMMY;

    reg Q0_REG = 1'b1;  // Initial state based on FJKPE initial value
    reg Q1_REG = 1'b1;  // Initial state based on FJKPE initial value
    reg Q2_REG = 1'b0;  // Initial state based on FJKCE initial value
    reg Q3_REG = 1'b0;  // Initial state based on FJKCE initial value
    reg Q4_REG = 1'b0;  // Initial state based on FJKCE initial value

    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q0_REG <= 1'b1;
        end else if (CE) begin
            if (!1'b1) begin
                if (1'b1) Q0_REG <= 1'b0;
            end else begin
                if (!1'b1) Q0_REG <= 1'b1;
                else Q0_REG <= !Q0_REG;
            end
        end
    end

    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q1_REG <= 1'b1;
        end else if (CE) begin
            if (!Q0_DUMMY) begin
                if (XLXN_6) Q1_REG <= 1'b0;
            end else begin
                if (!XLXN_6) Q1_REG <= 1'b1;
                else Q1_REG <= !Q1_REG;
            end
        end
    end

    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q2_REG <= 1'b0;
        end else if (CE) begin
            if (!XLXN_9) begin
                if (XLXN_8) Q2_REG <= 1'b0;
            end else begin
                if (!XLXN_8) Q2_REG <= 1'b1;
                else Q2_REG <= !Q2_REG;
            end
        end
    end

    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q3_REG <= 1'b0;
        end else if (CE) begin
            if (!XLXN_13) begin
                if (XLXN_10) Q3_REG <= 1'b0;
            end else begin
                if (!XLXN_10) Q3_REG <= 1'b1;
                else Q3_REG <= !Q3_REG;
            end
        end
    end

    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q4_REG <= 1'b0;
        end else if (CE) begin
            if (!XLXN_15) begin
                if (XLXN_14) Q4_REG <= 1'b0;
            end else begin
                if (!XLXN_14) Q4_REG <= 1'b1;
                else Q4_REG <= !Q4_REG;
            end
        end
    end

    assign Q0_DUMMY = Q0_REG;
    assign Q1_DUMMY = Q1_REG;
    assign Q2_DUMMY = Q2_REG;
    assign Q3_DUMMY = Q3_REG;
    assign Q4_DUMMY = Q4_REG;

    assign XLXN_3 = ~Q1_DUMMY;
    assign XLXN_4 = ~Q3_DUMMY;
    assign XLXN_5 = ~Q4_DUMMY;
    assign XLXN_2 = XLXN_3 | XLXN_4 | XLXN_5;
    assign XLXN_7 = Q3_DUMMY & Q4_DUMMY;
    assign XLXN_6 = Q0_DUMMY | XLXN_7;
    assign XLXN_8 = Q0_DUMMY & Q1_DUMMY;
    assign XLXN_9 = Q0_DUMMY & Q1_DUMMY;
    assign XLXN_11 = Q1_DUMMY & Q4_DUMMY;
    assign XLXN_12 = Q0_DUMMY & Q1_DUMMY & Q2_DUMMY;
    assign XLXN_10 = XLXN_11 | XLXN_12;
    assign XLXN_13 = Q0_DUMMY & Q1_DUMMY & Q2_DUMMY;
    assign XLXN_14 = Q1_DUMMY & Q3_DUMMY;
    assign XLXN_15 = Q0_DUMMY & Q1_DUMMY & Q2_DUMMY & Q3_DUMMY;
    assign XLXN_16 = ~Q0_DUMMY;
    assign XLXN_17 = ~Q2_DUMMY;
    assign XLXN_18 = ~Q3_DUMMY;
    assign XLXN_19 = ~Q4_DUMMY;
    assign TC_DUMMY = XLXN_16 & Q1_DUMMY & XLXN_17 & XLXN_18 & XLXN_19;
    assign CEO = CE & TC_DUMMY;

endmodule