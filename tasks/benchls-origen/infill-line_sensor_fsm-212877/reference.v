module origen_212877 #(
    parameter TIMEOUT = 20'd1_000_000
) (
    input reset,
    input clock,
    input inSignal,
    output reg outSignal,
    output reg hayNegro,
    output reg [19:0] contador
);

reg estado;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        estado <= 0;
        outSignal <= 0;
        hayNegro <= 0;
        contador <= 0;
    end
    else begin
        case (estado)
            0: begin
                outSignal <= 1;
                if (contador[12]) begin
                    estado <= 1;
                    contador <= 0;
                    outSignal <= 0;
                end
                else begin
                    contador <= contador + 1;
                end
            end
            1: begin
                if (~inSignal) begin
                    estado <= 0;
                    contador <= 0;
                    hayNegro <= 0;
                end
                else if (contador >= TIMEOUT) begin
                    estado <= 0;
                    contador <= 0;
                end
                else begin
                    contador <= contador + 1;
                    hayNegro <= 1;
                end
            end
        endcase
    end
end

endmodule