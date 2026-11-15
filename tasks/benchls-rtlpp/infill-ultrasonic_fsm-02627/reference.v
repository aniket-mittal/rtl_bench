module rtlpp_02627 (
    input wire clock,
    input wire reset,
    input wire pulso, 
    input wire tick,
    output reg zera_tick,
    output reg conta_tick,
    output reg zera_bcd,
    output reg conta_bcd,
    output reg pronto
);

    reg [2:0] Eatual, Eprox; 

    parameter inicial    = 3'b000;
    parameter prepara    = 3'b001; 
    parameter conta      = 3'b010; 
    parameter conta_cm   = 3'b011; 
    parameter fim        = 3'b100; 

    always @(posedge clock or posedge reset) begin
        if (reset)
            Eatual <= inicial;
        else
            Eatual <= Eprox; 
    end

    always @(*) begin
        case (Eatual)
            inicial    : Eprox = pulso ? prepara : inicial;
            prepara    : Eprox = pulso ? conta : fim;
            conta      : Eprox = pulso ? (tick ? conta_cm : conta) : fim;
            conta_cm   : Eprox = pulso ? conta : fim;
            fim        : Eprox = inicial;
            default    : Eprox = inicial; // To handle undefined state
        endcase
    end

    always @(*) begin
        zera_tick  = (Eatual == prepara)  ? 1'b1 : 1'b0;
        zera_bcd   = (Eatual == prepara)  ? 1'b1 : 1'b0;
        conta_tick = (Eatual == conta || Eatual == conta_cm) ? 1'b1 : 1'b0;
        conta_bcd  = (Eatual == conta_cm) ? 1'b1 : 1'b0;
        pronto     = (Eatual == fim)      ? 1'b1 : 1'b0;
    end

endmodule