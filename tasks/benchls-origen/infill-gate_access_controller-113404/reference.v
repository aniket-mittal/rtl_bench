module origen_113404(
    input clk_2,
    input [7:0] SWI,
    output reg [7:0] LED,
    output reg [7:0] SEG,
    output reg LCD_E, LCD_RS, LCD_RW,
    output reg [7:0] LCD_DATA
);

    // State definitions
    localparam FECHADA = 1'b0;
    localparam ABERTA = 1'b1;

    // Internal signals
    reg state_cancela_morador, state_cancela_visitante;
    reg reset, chega_morador, entrando_morador, chega_visitante, entrando_visitante;
    reg alarme;
    reg [1:0] contador_ciclos_morador, contador_ciclos_visitante;
    reg clk_3;

    // Clock division
    always @(posedge clk_2) begin
        clk_3 <= ~clk_3;
    end

    // Input mapping
    always @(*) begin
        reset = SWI[0];
        chega_morador = SWI[1];
        entrando_morador = SWI[2];
        chega_visitante = SWI[3];
        entrando_visitante = SWI[4];
    end

    // Resident gate state machine
    always @(posedge clk_3 or posedge reset) begin
        if (reset) begin
            state_cancela_morador <= FECHADA;
            contador_ciclos_morador <= 2'b00;
        end else begin
            case (state_cancela_morador)
                FECHADA: begin
                    if (chega_morador && !entrando_morador && state_cancela_visitante == FECHADA)
                        state_cancela_morador <= ABERTA;
                    else if (entrando_morador)
                        alarme <= 1'b1;
                end
                ABERTA: begin
                    if (entrando_morador) begin
                        contador_ciclos_morador <= contador_ciclos_morador + 1'b1;
                        if (contador_ciclos_morador == 2'b11) begin
                            state_cancela_morador <= FECHADA;
                            contador_ciclos_morador <= 2'b00;
                        end
                    end else if (contador_ciclos_morador > 2'b00) begin
                        alarme <= 1'b1;
                        state_cancela_morador <= FECHADA;
                        contador_ciclos_morador <= 2'b00;
                    end
                end
            endcase
        end
    end

    // Visitor gate state machine
    always @(posedge clk_3 or posedge reset) begin
        if (reset) begin
            state_cancela_visitante <= FECHADA;
            contador_ciclos_visitante <= 2'b00;
        end else begin
            case (state_cancela_visitante)
                FECHADA: begin
                    if (chega_visitante && !entrando_visitante && state_cancela_morador == FECHADA)
                        state_cancela_visitante <= ABERTA;
                    else if (entrando_visitante)
                        alarme <= 1'b1;
                end
                ABERTA: begin
                    if (entrando_visitante) begin
                        contador_ciclos_visitante <= contador_ciclos_visitante + 1'b1;
                        if (contador_ciclos_visitante == 2'b11) begin
                            state_cancela_visitante <= FECHADA;
                            contador_ciclos_visitante <= 2'b00;
                        end
                    end else if (contador_ciclos_visitante > 2'b00) begin
                        alarme <= 1'b1;
                        state_cancela_visitante <= FECHADA;
                        contador_ciclos_visitante <= 2'b00;
                    end
                end
            endcase
        end
    end

    // Output logic
    always @(*) begin
        LED[0] = (state_cancela_morador == ABERTA);
        LED[1] = (state_cancela_visitante == ABERTA);
        LED[2] = alarme;
        LED[7:3] = 5'b00000;
        SEG[7] = clk_3;
        SEG[6:0] = 7'b0000000;
    end

    // LCD-related outputs (not implemented in this example)
    always @(*) begin
        LCD_E = 1'b0;
        LCD_RS = 1'b0;
        LCD_RW = 1'b0;
        LCD_DATA = 8'h00;
    end

endmodule