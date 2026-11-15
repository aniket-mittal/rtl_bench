module counter706(CE, 
                  CLK, 
                  CLR, 
                  CEO, 
                  Q0, 
                  Q1, 
                  Q2, 
                  TC);

    input CE;
    input CLK;
    input CLR;
    
    output Q0;
    output Q1;
    output Q2;
    output TC;
    output CEO;
    
    reg Q0_DUMMY = 1'b1;
    reg Q1_DUMMY = 1'b1;
    reg Q2_DUMMY = 1'b1;
    reg Q3 = 1'b1;
    
    wire XLXN_1 = 1'b1;
    wire XLXN_2 = 1'b1;
    wire XLXN_8;
    wire XLXN_3;
    wire XLXN_4;
    wire XLXN_5;
    wire XLXN_6;
    wire XLXN_7;
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
    wire XLXN_20;
    wire XLXN_21;
    wire XLXN_22;
    wire XLXN_23;

    assign Q0 = Q0_DUMMY;
    assign Q1 = Q1_DUMMY;
    assign Q2 = Q2_DUMMY;
   
    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q0_DUMMY <= 1'b1;
        end else if (CE) begin
            Q0_DUMMY <= ~Q0_DUMMY;
        end
    end

    assign XLXN_4 = Q0_DUMMY & Q3;
    assign XLXN_7 = ~Q3;
    assign XLXN_6 = ~Q0_DUMMY;
    assign XLXN_5 = XLXN_6 & XLXN_7;
    assign XLXN_3 = XLXN_4 | XLXN_5;
   
    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q1_DUMMY <= 1'b1;
        end else if (CE) begin
            if (XLXN_2 == 1) begin
                if (XLXN_3 == 0) begin
                    Q1_DUMMY <= 1'b1;
                end else begin
                    Q1_DUMMY <= ~Q1_DUMMY;
                end
            end else begin
                if (XLXN_3 == 1) begin
                    Q1_DUMMY <= 1'b0;
                end
            end
        end
    end

    assign XLXN_8 = XLXN_9 | XLXN_10;
    assign XLXN_9 = Q0_DUMMY & Q3;
    assign XLXN_11 = ~Q0_DUMMY;
    assign XLXN_12 = ~Q3;
    assign XLXN_8 =  Q0_DUMMY & Q3 | Q2_DUMMY  & XLXN_11 & XLXN_12;

    
    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q3 <= 1'b1;
        end else if (CE) begin
            if (XLXN_19 == 1) begin
                if (XLXN_18 == 0) begin
                    Q3 <= 1'b1;
                end else begin
                    Q3 <= ~Q3;
                end
            end else begin
                if (XLXN_18 == 1) begin
                    Q3 <= 1'b0;
                end
            end
        end
    end

    assign XLXN_19 = XLXN_20 & XLXN_21 & XLXN_22;
    assign XLXN_20 = ~Q0_DUMMY;
    assign XLXN_21 = ~Q1_DUMMY;
    assign XLXN_22 = ~Q2_DUMMY;
    
    
    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            Q2_DUMMY <= 1'b1;
        end else if (CE) begin
            Q2_DUMMY <= ~Q2_DUMMY;
        end
    end
    
    assign TC = ~(Q0_DUMMY ^ Q1_DUMMY ^ Q2_DUMMY ^ Q3) & (Q1_DUMMY & Q2_DUMMY & Q3);
    
    assign CEO = CE & TC;

endmodule