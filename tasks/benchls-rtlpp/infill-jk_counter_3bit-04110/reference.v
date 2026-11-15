module rtlpp_04110(CE, CLK, CLR, CEO, Q0, Q1, Q2, TC);

    input CE;
    input CLK;
    input CLR;
    output CEO;
    output Q0;
    output Q1;
    output Q2;
    output TC;
   
    reg Q0;
    reg Q1;
    reg Q2;
    reg TC;

    // Internal wires
    wire J0 = 1'b1;
    wire K0 = 1'b1;
    wire J1;
    wire K1 = Q0;
    wire J2;
    wire K2 = Q0;
    wire TC_internal;

    // Flip-Flop 0
    always @(posedge CLK or posedge CLR) begin
        if (CLR)
            Q0 <= 1'b0;
        else if (CE) begin
            if (!J0) begin
                if (K0)
                    Q0 <= 1'b0;
            end else begin
                if (!K0)
                    Q0 <= 1'b1;
                else
                    Q0 <= !Q0;
            end
        end
    end

    // Inverter
    wire invQ2 = ~Q2;
    
    // AND gate 1
    assign J1 = Q0 & invQ2;

    // Flip-Flop 1
    always @(posedge CLK or posedge CLR) begin
        if (CLR)
            Q1 <= 1'b0;
        else if (CE) begin
            if (!J1) begin
                if (K1)
                    Q1 <= 1'b0;
            end else begin
                if (!K1)
                    Q1 <= 1'b1;
                else
                    Q1 <= !Q1;
            end
        end
    end

    // AND gate 2
    assign J2 = Q0 & Q1;

    // Flip-Flop 2
    always @(posedge CLK or posedge CLR) begin
        if (CLR)
            Q2 <= 1'b0;
        else if (CE) begin
            if (!J2) begin
                if (K2)
                    Q2 <= 1'b0;
            end else begin
                if (!K2)
                    Q2 <= 1'b1;
                else
                    Q2 <= !Q2;
            end
        end
    end

    // Inverter
    wire invQ1 = ~Q1;

    // AND gate 3
    assign TC_internal = Q0 & invQ1 & Q2;

    // Output assignments
    assign TC = TC_internal;
    assign CEO = CE & TC_internal;

endmodule