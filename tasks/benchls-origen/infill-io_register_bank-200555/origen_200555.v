module origen_200555(
    input reset,
    input [7:0] pico_out,
    input [7:0] id_port,
    input write_s,
    output reg [7:0] seg, min, hora, dia, mes, year,
    output reg [7:0] seg_tim, min_tim, hora_tim,
    output reg [7:0] swt, flecha, operacion, agarre
);

    reg [7:0] seg_reg, min_reg, hora_reg, dia_reg, mes_reg, year_reg;

    [MASKED]

    assign seg = seg_reg;
    assign min = min_reg;
    assign hora = hora_reg;
    assign dia = dia_reg;
    assign mes = mes_reg;
    assign year = year_reg;

endmodule