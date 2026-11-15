module rtlpp_03256(A, E, F, clk, rstAL, start);

    output reg [3:0] A;
    output reg E, F;
    input clk, rstAL, start;

    reg clrE, clrAF, setE, setF, incrA;

    // Embedded designExampleCTRL logic
    reg [1:0] currState, nextState;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b11;

    always @(posedge clk or negedge rstAL)
        if (rstAL == 0) 
            currState <= S0;
        else 
            currState <= nextState;
    
    always @ (start or A[2] or A[3] or currState) begin
        nextState = S0;
        case (currState)
            S0:
                if (start)   
                    nextState = S1;
                else    
                    nextState = S0;
            S1:
                if (A[2] & A[3]) 
                    nextState = S2;
                else    
                    nextState = S1;
            S2:
                nextState = S0;
            default:
                nextState = S0;
        endcase
    end

    always @ (currState or A[2] or start) begin
        setE = 0;
        setF = 0;
        clrE = 0;
        clrAF = 0;
        incrA = 0;

        case (currState)
            S0:
                if (start)   
                    clrAF = 1;
            S1:
                begin   
                    incrA = 1; 
                    if (A[2]) setE = 1; 
                    else  setE = 0;   
                end
            S2:
                setF = 1;
        endcase
    end

    // Embedded designExampleDTP logic
    always @(posedge clk) begin
        if (setE)    
            E <= 1;
        if (setF)    
            F <= 1;
        if (clrE)    
            E <= 0;
        if (clrAF) begin   
            A <= 0; 
            F <= 0;   
        end
        if (incrA)   
            A <= A + 1;
    end

endmodule