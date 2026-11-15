module rtlpp_04158(
    input CE,
    input CLK,
    input CLR,
    output CEO,
    output Q0,
    output Q1,
    output TC
);

    reg Q0_DUMMY;
    reg Q1_DUMMY;
    reg Q2;
    wire XLXN_1 = 1'b1;
    wire XLXN_2 = 1'b1;
    wire XLXN_3 = 1'b1;
    wire XLXN_4;
    wire XLXN_5;
    wire XLXN_6;
    wire XLXN_7;
    wire XLXN_8;
    wire TC_DUMMY;

    assign Q0 = Q0_DUMMY;
    assign Q1 = Q1_DUMMY;
    assign TC = TC_DUMMY;

    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q0_DUMMY <= 1'b0;
        end else if (CE) begin
            if (!Q2) begin
                if (XLXN_1) Q0_DUMMY <= 1'b0;
            end else begin
                if (!XLXN_1) Q0_DUMMY <= 1'b1;
                else Q0_DUMMY <= !Q0_DUMMY;
            end
        end
    end

    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q1_DUMMY <= 1'b0;
        end else if (CE) begin
            if (!Q0_DUMMY) begin
                if (XLXN_2) Q1_DUMMY <= 1'b0;
            end else begin
                if (!XLXN_2) Q1_DUMMY <= 1'b1;
                else Q1_DUMMY <= !Q1_DUMMY;
            end
        end
    end

    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q2 <= 1'b0;
        end else if (CE) begin
            if (!XLXN_4) begin
                if (XLXN_3) Q2 <= 1'b0;
            end else begin
                if (!XLXN_3) Q2 <= 1'b1;
                else Q2 <= !Q2;
            end
        end
    end

    assign XLXN_5 = ~Q0_DUMMY;
    assign XLXN_6 = ~Q1_DUMMY;
    assign XLXN_4 = XLXN_5 & XLXN_6;
    assign XLXN_7 = ~Q0_DUMMY;
    assign XLXN_8 = ~Q2;
    assign TC_DUMMY = XLXN_7 & Q1_DUMMY & XLXN_8;
    assign CEO = CE & TC_DUMMY;

endmodule