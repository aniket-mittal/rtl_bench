module rtlpp_04154(
    input CE,
    input CLK,
    input CLR,
    output CEO,
    output Q0,
    output Q1,
    output Q2,
    output Q3,
    output TC
);

    reg Q0_DUMMY, Q1_DUMMY, Q2_DUMMY, Q3_DUMMY, TC_DUMMY;
    wire XLXN_1, XLXN_2, XLXN_3, XLXN_4, XLXN_5, XLXN_6, XLXN_7, XLXN_8, XLXN_9;
    
    // Initialization
    assign Q0 = Q0_DUMMY;
    assign Q1 = Q1_DUMMY;
    assign Q2 = Q2_DUMMY;
    assign Q3 = Q3_DUMMY;
    assign TC = TC_DUMMY;
    
    // VCC Logic
    assign XLXN_1 = 1'b1;
    assign XLXN_2 = 1'b1;

    // Flip-Flop Logic
    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q0_DUMMY <= 1'b0;
            Q1_DUMMY <= 1'b0;
            Q2_DUMMY <= 1'b0;
            Q3_DUMMY <= 1'b0;
        end else if (CE) begin
            if (!XLXN_2)
                if (XLXN_1)
                    Q0_DUMMY <= 1'b0;
            else
                if (!XLXN_1)
                    Q0_DUMMY <= 1'b1;
                else
                    Q0_DUMMY <= !Q0_DUMMY;

            if (!XLXN_3)
                if (Q0_DUMMY)
                    Q1_DUMMY <= 1'b0;
            else
                if (!Q0_DUMMY)
                    Q1_DUMMY <= 1'b1;
                else
                    Q1_DUMMY <= !Q1_DUMMY;

            if (!XLXN_6)
                if (XLXN_5)
                    Q2_DUMMY <= 1'b0;
            else
                if (!XLXN_5)
                    Q2_DUMMY <= 1'b1;
                else
                    Q2_DUMMY <= !Q2_DUMMY;

            if (!XLXN_7)
                if (Q0_DUMMY)
                    Q3_DUMMY <= 1'b0;
            else
                if (!Q0_DUMMY)
                    Q3_DUMMY <= 1'b1;
                else
                    Q3_DUMMY <= !Q3_DUMMY;
        end
    end

    // Logic Gates
    assign XLXN_3 = Q0_DUMMY & XLXN_4;
    assign XLXN_4 = ~Q3_DUMMY;
    assign XLXN_5 = Q0_DUMMY & Q1_DUMMY;
    assign XLXN_6 = Q0_DUMMY & Q1_DUMMY;
    assign XLXN_7 = Q0_DUMMY & Q1_DUMMY & Q2_DUMMY;
    assign XLXN_8 = ~Q1_DUMMY;
    assign XLXN_9 = ~Q2_DUMMY;
    assign TC_DUMMY = Q0_DUMMY & XLXN_8 & XLXN_9 & Q3_DUMMY;
    assign CEO = CE & TC_DUMMY;

endmodule