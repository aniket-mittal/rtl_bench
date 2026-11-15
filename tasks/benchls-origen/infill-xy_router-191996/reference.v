module origen_191996 #(
    parameter FILAS = 8,
    parameter COLUMNAS = 8
) (
    input [7:0] Destino,
    input [7:0] Actual,
    output reg Norte,
    output reg Este,
    output reg Oeste,
    output reg Sur,
    output reg Local
);

    localparam filas_size = $clog2(FILAS);
    localparam columnas_size = $clog2(COLUMNAS);

    localparam destino_fila_msb = 7;
    localparam destino_fila_lsb = destino_fila_msb - filas_size + 1;
    localparam destino_columna_msb = destino_fila_lsb - 1;
    localparam destino_columna_lsb = destino_columna_msb - columnas_size + 1;

    localparam actual_fila_msb = 7;
    localparam actual_fila_lsb = actual_fila_msb - filas_size + 1;
    localparam actual_columna_msb = actual_fila_lsb - 1;
    localparam actual_columna_lsb = actual_columna_msb - columnas_size + 1;

    wire [filas_size-1:0] fila_destino, fila_actual;
    wire [columnas_size-1:0] columna_destino, columna_actual;

    assign fila_destino = Destino[destino_fila_msb:destino_fila_lsb];
    assign columna_destino = Destino[destino_columna_msb:destino_columna_lsb];
    assign fila_actual = Actual[actual_fila_msb:actual_fila_lsb];
    assign columna_actual = Actual[actual_columna_msb:actual_columna_lsb];

    always @(*) begin
        Norte = 1'b0;
        Este = 1'b0;
        Oeste = 1'b0;
        Sur = 1'b0;
        Local = 1'b0;

        if (fila_destino > fila_actual) begin
            Sur = 1'b1;
        end else if (fila_destino < fila_actual) begin
            Norte = 1'b1;
        end else begin
            if (columna_destino > columna_actual) begin
                Este = 1'b1;
            end else if (columna_destino < columna_actual) begin
                Oeste = 1'b1;
            end else begin
                Local = 1'b1;
            end
        end
    end

endmodule