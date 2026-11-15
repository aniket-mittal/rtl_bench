module origen_082246 (
    input wire clk,
    input wire rst,
    input wire Enable,
    input wire Ready,
    input wire Iniciar,
    input wire Esc_Fin,
    output reg Escribir,
    output reg Leer,
    output reg Estado_Lectura,
    output reg Estado_Escritura,
    output reg Estado_Iniciar,
    output reg [2:0] state_reg,
    output reg [2:0] state_next
);

    // State encoding
    localparam [2:0] 
        NULO        = 3'b000,
        INICIALIZAR = 3'b001,
        LECTURA     = 3'b010,
        USUARIO     = 3'b011,
        ESCRITURA   = 3'b100;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state_reg <= NULO;
        else
            state_reg <= state_next;
    end

    // Next state logic
    always @(*) begin
        case (state_reg)
            NULO: 
                state_next = (Enable | Ready) ? INICIALIZAR : NULO;
            INICIALIZAR: 
                state_next = !Iniciar ? LECTURA : INICIALIZAR;
            LECTURA: 
                state_next = Enable ? USUARIO : LECTURA;
            USUARIO: 
                state_next = Ready ? ESCRITURA : USUARIO;
            ESCRITURA: 
                state_next = Esc_Fin ? LECTURA : ESCRITURA;
            default: 
                state_next = NULO;
        endcase
    end

    // Output logic
    [MASKED]

endmodule