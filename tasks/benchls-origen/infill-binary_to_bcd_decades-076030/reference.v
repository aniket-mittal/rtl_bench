module origen_076030(
    input wire [7:0] numero,
    input wire update,
    output reg [7:0] unidades,
    output reg [7:0] decenas
);

always @(posedge update) begin
    if (numero >= 90) begin
        decenas = 8'd9;
        unidades = numero - 90;
    end
    else if (numero >= 80) begin
        decenas = 8'd8;
        unidades = numero - 80;
    end
    else if (numero >= 70) begin
        decenas = 8'd7;
        unidades = numero - 70;
    end
    else if (numero >= 60) begin
        decenas = 8'd6;
        unidades = numero - 60;
    end
    else if (numero >= 50) begin
        decenas = 8'd5;
        unidades = numero - 50;
    end
    else if (numero >= 40) begin
        decenas = 8'd4;
        unidades = numero - 40;
    end
    else if (numero >= 30) begin
        decenas = 8'd3;
        unidades = numero - 30;
    end
    else if (numero >= 20) begin
        decenas = 8'd2;
        unidades = numero - 20;
    end
    else if (numero >= 10) begin
        decenas = 8'd1;
        unidades = numero - 10;
    end
    else begin
        decenas = 8'd0;
        unidades = numero;
    end
end

endmodule