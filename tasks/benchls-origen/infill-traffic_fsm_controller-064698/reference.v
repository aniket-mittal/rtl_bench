module origen_064698(
    input wire Clk,
    input wire Reset,
    input wire Humo,
    input wire T1,
    input wire T2,
    input wire CS,
    output reg TempAlto,
    output reg TempMedio,
    output reg HumoOut,
    output reg Elec,
    output reg EJECA,
    output reg EJECB,
    output reg EJECC,
    output reg EJECD
);

    // State encoding
    localparam [2:0] 
        s0 = 3'b000,
        s1 = 3'b001,
        s2 = 3'b010,
        s3 = 3'b011,
        s4 = 3'b100,
        s5 = 3'b101,
        s6 = 3'b110,
        s7 = 3'b111;

    reg [2:0] current_state, next_state;

    // State register
    always @(posedge Clk or posedge Reset) begin
        if (Reset)
            current_state <= s0;
        else
            current_state <= next_state;
    end

    // Next state logic and output logic
    always @(*) begin
        // Default values
        next_state = current_state;
        TempAlto = 1'b0;
        TempMedio = 1'b0;
        HumoOut = 1'b0;
        Elec = 1'b0;
        EJECA = 1'b0;
        EJECB = 1'b0;
        EJECC = 1'b0;
        EJECD = 1'b0;

        case (current_state)
            s0: begin
                if (T1) begin
                    next_state = s1;
                    TempAlto = 1'b1;
                    EJECA = 1'b1;
                end else begin
                    next_state = s2;
                    EJECA = 1'b1;
                end
            end
            s1: begin
                next_state = s2;
            end
            s2: begin
                if (!T1 && T2) begin
                    next_state = s3;
                    TempMedio = 1'b1;
                    EJECB = 1'b1;
                end else begin
                    next_state = s4;
                    EJECB = 1'b1;
                end
            end
            s3: begin
                next_state = s4;
            end
            s4: begin
                if (Humo) begin
                    next_state = s5;
                    HumoOut = 1'b1;
                    EJECC = 1'b1;
                end else begin
                    next_state = s6;
                    EJECC = 1'b1;
                end
            end
            s5: begin
                next_state = s6;
            end
            s6: begin
                if (CS) begin
                    next_state = s7;
                    Elec = 1'b1;
                    EJECD = 1'b1;
                end else begin
                    next_state = s0;
                    EJECD = 1'b1;
                end
            end
            s7: begin
                next_state = s0;
            end
            default: next_state = s0;
        endcase
    end

endmodule