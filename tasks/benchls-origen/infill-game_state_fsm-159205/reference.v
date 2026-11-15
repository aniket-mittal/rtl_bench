module origen_159205(
    input  [2:0] CC_POSX_IN,
    input  [2:0] CC_POSY_IN,
    input  [2:0] CC_ESTADO_IN,
    input        CC_PERDIO_IN,
    input        CC_GANO_IN,
    input        CC_CLOCK_50,
    input        CC_RESET,
    output reg [7:0] CC_REG7_OUT
);

reg [2:0] current_state, next_state;

localparam Inicial  = 3'b000,
          Espera1   = 3'b001,
          Espera2   = 3'b010,
          Espera3   = 3'b011,
          Casa1ON   = 3'b100,
          Casa2ON   = 3'b101,
          Casa3ON   = 3'b110;

always @(*)
begin
    case (current_state)
        Inicial:
            begin
                if (CC_POSX_IN == 3'b000 && CC_POSY_IN == 3'b000)
                    next_state = Espera1;
                else if (CC_POSX_IN == 3'b001 && CC_POSY_IN == 3'b000)
                    next_state = Espera2;
                else if (CC_POSX_IN == 3'b010 && CC_POSY_IN == 3'b000)
                    next_state = Espera3;
                else
                    next_state = Inicial;
            end
        Espera1:
            begin
                if (CC_ESTADO_IN == Casa1ON)
                    next_state = Casa1ON;
                else
                    next_state = Espera1;
            end
        Espera2:
            begin
                if (CC_ESTADO_IN == Casa2ON)
                    next_state = Casa2ON;
                else
                    next_state = Espera2;
            end
        Espera3:
            begin
                if (CC_ESTADO_IN == Casa3ON)
                    next_state = Casa3ON;
                else
                    next_state = Espera3;
            end
        Casa1ON:
            begin
                if (CC_PERDIO_IN || CC_GANO_IN)
                    next_state = Inicial;
                else
                    next_state = Casa1ON;
            end
        Casa2ON:
            begin
                if (CC_PERDIO_IN || CC_GANO_IN)
                    next_state = Inicial;
                else
                    next_state = Casa2ON;
            end
        Casa3ON:
            begin
                if (CC_PERDIO_IN || CC_GANO_IN)
                    next_state = Inicial;
                else
                    next_state = Casa3ON;
            end
        default:
            next_state = Inicial;
    endcase
end

always @(posedge CC_CLOCK_50 or posedge CC_RESET)
begin
    if (CC_RESET)
        current_state <= Inicial;
    else
        current_state <= next_state;
end

always @(*)
begin
    case (current_state)
        Inicial, Espera1, Espera2, Espera3:
            CC_REG7_OUT = 8'b00000000;
        Casa1ON:
            CC_REG7_OUT = 8'b10111111;
        Casa2ON:
            CC_REG7_OUT = 8'b11110111;
        Casa3ON:
            CC_REG7_OUT = 8'b11111101;
        default:
            CC_REG7_OUT = 8'b00000000;
    endcase
end

endmodule