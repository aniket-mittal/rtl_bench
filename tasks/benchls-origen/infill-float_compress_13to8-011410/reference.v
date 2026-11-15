module origen_011410 (
    input [12:0] data_13,
    output reg [7:0] data_8_out
);

reg [7:0] data_8;

always @(data_13) begin
    data_8[7] = data_13[12];
    
    casez (data_13[11:0])
        12'b1???????????: begin
            data_8[6:4] = 3'b111;
            data_8[3:0] = data_13[10:7];
        end
        12'b01??????????: begin
            data_8[6:4] = 3'b110;
            data_8[3:0] = data_13[9:6];
        end
        12'b001?????????: begin
            data_8[6:4] = 3'b101;
            data_8[3:0] = data_13[8:5];
        end
        12'b0001????????: begin
            data_8[6:4] = 3'b100;
            data_8[3:0] = data_13[7:4];
        end
        12'b00001???????: begin
            data_8[6:4] = 3'b011;
            data_8[3:0] = data_13[6:3];
        end
        12'b000001??????: begin
            data_8[6:4] = 3'b010;
            data_8[3:0] = data_13[5:2];
        end
        12'b0000001?????: begin
            data_8[6:4] = 3'b001;
            data_8[3:0] = data_13[4:1];
        end
        12'b000000000000: begin
            data_8[6:4] = 3'b000;
            data_8[3:0] = 4'b0000;
        end
        default: begin
            data_8[6:4] = 3'b000;
            data_8[3:0] = data_13[4:1];
        end
    endcase
    
    data_8_out = data_8;
end

endmodule