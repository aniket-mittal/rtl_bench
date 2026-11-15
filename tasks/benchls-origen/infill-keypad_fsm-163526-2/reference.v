module origen_163526(
    input ck,
    input p,
    input [3:0] w,
    output reg ce,
    output reg enter,
    output reg bs,
    output reg ss,
    output reg load,
    output reg updw,
    output reg reset
);

reg [3:0] state;
parameter CHEQUEAR_P = 4'b0000;
parameter VALOR_DE_W = 4'b0001;
parameter CARGAR_REG = 4'b0010;
parameter RST = 4'b0011;
parameter ENTRA_TECLA = 4'b0100;
parameter LD = 4'b0101;
parameter BACKS = 4'b0110;
parameter SOS = 4'b0111;
parameter UP_DW = 4'b1000;

always @(posedge ck) begin
    case (state)
        CHEQUEAR_P: begin
            if (p) state <= VALOR_DE_W;
            else state <= CHEQUEAR_P;
            ce <= 1'b0;
            enter <= 1'b0;
            bs <= 1'b0;
            ss <= 1'b0;
            load <= 1'b0;
            updw <= 1'b0;
            reset <= 1'b0;
        end
        VALOR_DE_W: begin
            if (w <= 4'b1001) state <= CARGAR_REG;
            else if (w == 4'b1010) state <= RST;
            else if (w == 4'b1011) state <= ENTRA_TECLA;
            else if (w == 4'b1100) state <= LD;
            else if (w == 4'b1101) state <= BACKS;
            else if (w == 4'b1110) state <= SOS;
            else if (w == 4'b1111) state <= UP_DW;
            ce <= 1'b0;
            enter <= 1'b0;
            bs <= 1'b0;
            ss <= 1'b0;
            load <= 1'b0;
            updw <= 1'b0;
            reset <= 1'b0;
        end
        CARGAR_REG: begin
            state <= CHEQUEAR_P;
            ce <= 1'b1;
            enter <= 1'b0;
            bs <= 1'b0;
            ss <= 1'b0;
            load <= 1'b0;
            updw <= 1'b0;
            reset <= 1'b0;
        end
        RST: begin
            state <= CHEQUEAR_P;
            ce <= 1'b0;
            enter <= 1'b0;
            bs <= 1'b0;
            ss <= 1'b0;
            load <= 1'b0;
            updw <= 1'b0;
            reset <= 1'b1;
        end
        ENTRA_TECLA: begin
            state <= CHEQUEAR_P;
            ce <= 1'b0;
            enter <= 1'b1;
            bs <= 1'b0;
            ss <= 1'b0;
            load <= 1'b0;
            updw <= 1'b0;
            reset <= 1'b0;
        end
        LD: begin
            state <= CHEQUEAR_P;
            ce <= 1'b0;
            enter <= 1'b0;
            bs <= 1'b0;
            ss <= 1'b0;
            load <= 1'b1;
            updw <= 1'b0;
            reset <= 1'b0;
        end
        BACKS: begin
            state <= CHEQUEAR_P;
            ce <= 1'b0;
            enter <= 1'b0;
            bs <= 1'b1;
            ss <= 1'b0;
            load <= 1'b0;
            updw <= 1'b0;
            reset <= 1'b0;
        end
        SOS: begin
            state <= CHEQUEAR_P;
            ce <= 1'b0;
            enter <= 1'b0;
            bs <= 1'b0;
            ss <= 1'b1;
            load <= 1'b0;
            updw <= 1'b0;
            reset <= 1'b0;
        end
        UP_DW: begin
            state <= CHEQUEAR_P;
            ce <= 1'b0;
            enter <= 1'b0;
            bs <= 1'b0;
            ss <= 1'b0;
            load <= 1'b0;
            updw <= 1'b1;
            reset <= 1'b0;
        end
        default: begin
            state <= CHEQUEAR_P;
            ce <= 1'b0;
            enter <= 1'b0;
            bs <= 1'b0;
            ss <= 1'b0;
            load <= 1'b0;
            updw <= 1'b0;
            reset <= 1'b0;
        end
    endcase
end

endmodule