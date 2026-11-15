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

[MASKED]

endmodule