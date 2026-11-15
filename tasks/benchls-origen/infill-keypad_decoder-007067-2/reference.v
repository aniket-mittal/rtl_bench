module origen_007067(
    input [3:0] fil,
    input [3:0] col,
    output reg [3:0] tecla
);

always @(*) begin
    if (col[0]) begin
        case (fil)
            4'b0001: tecla = 4'd0;
            4'b0010: tecla = 4'd4;
            4'b0100: tecla = 4'd8;
            4'b1000: tecla = 4'd12;
            default: tecla = 4'd15;
        endcase
    end
    else if (col[1]) begin
        case (fil)
            4'b0001: tecla = 4'd1;
            4'b0010: tecla = 4'd5;
            4'b0100: tecla = 4'd9;
            4'b1000: tecla = 4'd13;
            default: tecla = 4'd15;
        endcase
    end
    else if (col[2]) begin
        case (fil)
            4'b0001: tecla = 4'd2;
            4'b0010: tecla = 4'd6;
            4'b0100: tecla = 4'd10;
            4'b1000: tecla = 4'd14;
            default: tecla = 4'd15;
        endcase
    end
    else if (col[3]) begin
        case (fil)
            4'b0001: tecla = 4'd3;
            4'b0010: tecla = 4'd7;
            4'b0100: tecla = 4'd11;
            4'b1000: tecla = 4'd15;
            default: tecla = 4'd15;
        endcase
    end
    else begin
        tecla = 4'd15;
    end
end

endmodule