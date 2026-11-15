module rtlpp_04120(CE, 
                  CLK, 
                  CLR, 
                  CEO, 
                  Q0, 
                  Q1, 
                  Q2, 
                  Q3, 
                  TC);

    input CE;
    input CLK;
    input CLR;
    output CEO;
    output Q0;
    output Q1;
    output Q2;
    output Q3;
    output TC;

    reg Q0_DUMMY = 1'b0;
    reg Q1_DUMMY = 1'b0;
    reg Q2_DUMMY = 1'b0;
    reg Q3_DUMMY = 1'b0;
    wire TC_DUMMY;

    wire XLXN_1 = 1'b1;
    wire XLXN_2 = 1'b1;
    wire XLXN_3;
    wire XLXN_4;
    wire XLXN_5;
    wire XLXN_6;
    wire XLXN_7;
    wire XLXN_8;
    wire XLXN_9;

    assign Q0 = Q0_DUMMY;
    assign Q1 = Q1_DUMMY;
    assign Q2 = Q2_DUMMY;
    assign Q3 = Q3_DUMMY;
    assign TC = TC_DUMMY;

    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q0_DUMMY <= 1'b0;
        end else if (CE) begin
            if (!XLXN_2) begin
                if (XLXN_1) begin
                    Q0_DUMMY <= 1'b0;
                end
            end else begin
                if (!XLXN_1) begin
                    Q0_DUMMY <= 1'b1;
                end else begin
                    Q0_DUMMY <= !Q0_DUMMY;
                end
            end
        end
    end

    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q1_DUMMY <= 1'b0;
        end else if (CE) begin
            if (!XLXN_3) begin
                if (Q0_DUMMY) begin
                    Q1_DUMMY <= 1'b0;
                end
            end else begin
                if (!Q0_DUMMY) begin
                    Q1_DUMMY <= 1'b1;
                end else begin
                    Q1_DUMMY <= !Q1_DUMMY;
                end
            end
        end
    end

    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q2_DUMMY <= 1'b0;
        end else if (CE) begin
            if (!XLXN_6) begin
                if (XLXN_5) begin
                    Q2_DUMMY <= 1'b0;
                end
            end else begin
                if (!XLXN_5) begin
                    Q2_DUMMY <= 1'b1;
                end else begin
                    Q2_DUMMY <= !Q2_DUMMY;
                end
            end
        end
    end

    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q3_DUMMY <= 1'b0;
        end else if (CE) begin
            if (!XLXN_7) begin
                if (Q0_DUMMY) begin
                    Q3_DUMMY <= 1'b0;
                end
            end else begin
                if (!Q0_DUMMY) begin
                    Q3_DUMMY <= 1'b1;
                end else begin
                    Q3_DUMMY <= !Q3_DUMMY;
                end
            end
        end
    end

    assign XLXN_3 = Q0_DUMMY & XLXN_4;
    assign XLXN_4 = ~Q3_DUMMY;
    assign XLXN_5 = Q0_DUMMY & Q1_DUMMY;
    assign XLXN_6 = Q0_DUMMY & Q1_DUMMY;
    assign XLXN_7 = Q0_DUMMY & Q1_DUMMY & Q2_DUMMY;
    assign XLXN_8 = ~Q1_DUMMY;
    assign XLXN_9 = ~Q2_DUMMY;
    assign TC_DUMMY = Q0_DUMMY & XLXN_8 & XLXN_9 & Q3_DUMMY;
    assign CEO = TC_DUMMY & CE;

endmodule