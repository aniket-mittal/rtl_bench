module origen_169495(
    input A, B, CLK, reset,
    output reg contar, up_down,
    output reg [2:0] estado
);

reg carro;
reg [2:0] prox_estado, estado_atual;

initial begin
    carro = 1'b0;
    prox_estado = 3'b000;
    estado_atual = 3'b000;
    contar = 1'b0;
    up_down = 1'b0;
    estado = 3'b000;
end

always @(posedge CLK or posedge reset) begin
    if (reset) begin
        estado_atual <= 3'b000;
        contar <= 1'b0;
        up_down <= 1'b0;
    end else begin
        estado_atual <= prox_estado;
    end
end

always @(estado_atual, A, B) begin
    case (estado_atual)
        3'b000: begin // s0
            prox_estado = 3'b001;
            carro = 1'b0;
        end
        3'b001: begin // s1
            if (A == 1'b1 && B == 1'b0) begin
                prox_estado = 3'b010;
                carro = 1'b1;
            end else begin
                prox_estado = 3'b001;
                carro = 1'b0;
            end
        end
        3'b010: begin // s2
            if (A == 1'b0 && B == 1'b1) begin
                prox_estado = 3'b011;
                carro = 1'b1;
            end else begin
                prox_estado = 3'b010;
                carro = 1'b1;
            end
        end
        3'b011: begin // s3
            if (A == 1'b1 && B == 1'b1) begin
                prox_estado = 3'b100;
                carro = 1'b1;
            end else begin
                prox_estado = 3'b011;
                carro = 1'b1;
            end
        end
        3'b100: begin // s4
            if (A == 1'b0 && B == 1'b0) begin
                prox_estado = 3'b101;
                carro = 1'b1;
            end else begin
                prox_estado = 3'b100;
                carro = 1'b1;
            end
        end
        3'b101: begin // s5
            if (A == 1'b1 && B == 1'b0) begin
                prox_estado = 3'b110;
                carro = 1'b1;
            end else begin
                prox_estado = 3'b101;
                carro = 1'b1;
            end
        end
        3'b110: begin // s6
            if (A == 1'b0 && B == 1'b0) begin
                prox_estado = 3'b000;
                carro = 1'b1;
            end else begin
                prox_estado = 3'b110;
                carro = 1'b1;
            end
        end
        default: begin
            prox_estado = 3'b000;
            carro = 1'b0;
        end
    endcase

    contar = (estado_atual == 3'b011 && carro == 1'b1) ? 1'b1 : 1'b0;
    up_down = (estado_atual == 3'b110 && carro == 1'b1 && A == 1'b0 && B == 1'b0) ? 1'b1 : 1'b0;
    estado = estado_atual;
end

endmodule