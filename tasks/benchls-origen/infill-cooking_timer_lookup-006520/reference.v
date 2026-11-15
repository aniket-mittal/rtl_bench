module origen_006520(
    input [1:0] producto,
    input [2:0] tipo_ingrediente,
    input reset,
    output reg [1:0] tiempo
);

always @(*) begin
    case(producto)
        2'b00: begin
            case(tipo_ingrediente)
                3'b000: tiempo = 2'b01;
                3'b001: tiempo = 2'b10;
                3'b010: tiempo = 2'b11;
                3'b011: tiempo = 2'b01;
                3'b100: tiempo = 2'b10;
                default: tiempo = 2'b00;
            endcase
        end
        2'b01: begin
            case(tipo_ingrediente)
                3'b000: tiempo = 2'b10;
                3'b001: tiempo = 2'b01;
                3'b010: tiempo = 2'b11;
                3'b011: tiempo = 2'b10;
                default: tiempo = 2'b00;
            endcase
        end
        2'b10: begin
            case(tipo_ingrediente)
                3'b000: tiempo = 2'b11;
                3'b001: tiempo = 2'b10;
                3'b010: tiempo = 2'b01;
                default: tiempo = 2'b00;
            endcase
        end
        2'b11: begin
            case(tipo_ingrediente)
                3'b000: tiempo = 2'b01;
                3'b001: tiempo = 2'b11;
                3'b010: tiempo = 2'b10;
                3'b011: tiempo = 2'b01;
                default: tiempo = 2'b00;
            endcase
        end
    endcase
end

endmodule