module origen_099831(
    input wire Clk, Reset, Run, ClearA_LoadB, M,
    output reg Load_A, Load_X, Shift_En, fn,
    output reg [3:0] curr,
    output reg [2:0] count
);

    // State encoding
    localparam [3:0] A = 4'b0001, B = 4'b0010, C = 4'b0100, D = 4'b1000, E = 4'b0000;

    reg [3:0] state, next_state;

    // State register
    always @(posedge Clk or posedge Reset) begin
        if (Reset)
            state <= A;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            A: next_state = Run ? B : A;
            B: next_state = M ? C : D;
            C: next_state = D;
            D: begin
                if (count == 3'b111)
                    next_state = E;
                else
                    next_state = M ? C : D;
            end
            E: next_state = Run ? E : A;
            default: next_state = A;
        endcase
    end

    // Output logic
    always @(*) begin
        Load_A = (state == C);
        Load_X = (state == C);
        Shift_En = (state == D);
        fn = (count == 3'b111);
        curr = state;
    end

    // Counter logic
    always @(posedge Clk or posedge Reset) begin
        if (Reset)
            count <= 3'b000;
        else if (Shift_En)
            count <= (count == 3'b111) ? count : count + 1;
    end

endmodule