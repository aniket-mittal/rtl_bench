module origen_034860 (
    input wire q0,
    input wire start,
    input wire clk,
    output reg CargaQ,
    output reg DesplazaQ,
    output reg ResetA,
    output reg CargaA,
    output reg Fin
);

    // State encoding
    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;
    parameter S5 = 3'b101;
    parameter S6 = 3'b110;

    reg [2:0] state, next_state;

    // State register
    always @(posedge clk or posedge start) begin
        if (start)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S4;
            S4: next_state = S5;
            S5: next_state = S6;
            S6: next_state = S6;
            default: next_state = S0;
        endcase
    end

    // Output logic
    always @(*) begin
        CargaQ = (state == S0);
        DesplazaQ = (state == S2) || (state == S4);
        ResetA = (state == S0);
        CargaA = q0 && ((state == S1) || (state == S3) || (state == S5));
        Fin = (state == S6);
    end

endmodule