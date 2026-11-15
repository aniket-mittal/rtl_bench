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

    always @(posedge write_s or posedge reset) begin
        if (reset) begin
            seg_reg <= 8'h00;
            min_reg <= 8'h00;
            hora_reg <= 8'h00;
            dia_reg <= 8'h00;
            mes_reg <= 8'h00;
            year_reg <= 8'h00;
            seg_tim <= 8'h00;
            min_tim <= 8'h00;
            hora_tim <= 8'h00;
            swt <= 8'h00;
            flecha <= 8'h00;
            operacion <= 8'h00;
            agarre <= 8'h00;
        end else begin
            case (id_port)
                8'h01: seg_reg <= pico_out;
                8'h02: min_reg <= pico_out;
                8'h03: hora_reg <= pico_out;
                8'h04: dia_reg <= pico_out;
                8'h05: mes_reg <= pico_out;
                8'h06: year_reg <= pico_out;
                8'h07: seg_tim <= pico_out;
                8'h08: min_tim <= pico_out;
                8'h09: hora_tim <= pico_out;
                8'h0A: swt <= pico_out;
                8'h0B: flecha <= pico_out;
                8'h0C: operacion <= pico_out;
                8'h0D: agarre <= pico_out;
            endcase
        end
    end

    assign seg = seg_reg;
    assign min = min_reg;
    assign hora = hora_reg;
    assign dia = dia_reg;
    assign mes = mes_reg;
    assign year = year_reg;

endmodule