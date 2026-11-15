module rtlpp_01031 (
    input wire       clock,
    input wire       reset,
    input wire       medir,
    input wire       echo,
    input wire       fim_medida,
    input wire       fim_timeout,
    output reg       zera_timeout,
    output reg       conta_timeout,
    output reg       zera,
    output reg       gera,
    output reg       registra,
    output reg       pronto,
    output reg [3:0] db_estado 
);

    reg [2:0] Eatual, Eprox; 

    parameter inicial       = 3'b000;
    parameter preparacao    = 3'b001;
    parameter envia_trigger = 3'b010;
    parameter espera_echo   = 3'b011;
    parameter medida        = 3'b100;
    parameter armazenamento = 3'b101;
    parameter final_medida  = 3'b110;

    always @(posedge clock or posedge reset) begin
        if (reset) 
            Eatual <= inicial;
        else
            Eatual <= Eprox; 
    end

    always @(*) begin
        case (Eatual)
            inicial: Eprox = medir ? preparacao : inicial;
            preparacao: Eprox = envia_trigger;
            envia_trigger: Eprox = espera_echo;
            espera_echo: Eprox = fim_timeout ? envia_trigger : (echo ? medida : espera_echo);
            medida: Eprox = fim_medida ? armazenamento : medida;
            armazenamento: Eprox = final_medida;
            final_medida: Eprox = inicial;
            default: Eprox = inicial;
        endcase
    end

    always @(*) begin
        zera = (Eatual == preparacao) ? 1'b1 : 1'b0;
        gera = (Eatual == envia_trigger) ? 1'b1 : 1'b0;
        registra = (Eatual == armazenamento) ? 1'b1 : 1'b0;
        pronto = (Eatual == final_medida) ? 1'b1 : 1'b0;
        conta_timeout = (Eatual == espera_echo) ? 1'b1 : 1'b0;
        zera_timeout = (Eatual == envia_trigger) ? 1'b1 : 1'b0;

        case (Eatual)
            inicial:       db_estado = 4'b0000;
            preparacao:    db_estado = 4'b0001;
            envia_trigger: db_estado = 4'b0010;
            espera_echo:   db_estado = 4'b0011;
            medida:        db_estado = 4'b0100;
            armazenamento: db_estado = 4'b0101;
            final_medida:  db_estado = 4'b1111;
            default:       db_estado = 4'b1110;
        endcase
    end

endmodule