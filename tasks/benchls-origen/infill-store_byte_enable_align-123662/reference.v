module origen_123662 (
    input [31:0] write_data,
    input [1:0] d_address,
    input [1:0] store_size,
    output reg [3:0] d_byteena,
    output reg [31:0] d_writedataout
);

always @(*) begin
    case (store_size)
        2'b11: begin // 4-byte store
            case (d_address)
                2'b00: begin
                    d_byteena = 4'b1000;
                    d_writedataout = write_data;
                end
                2'b01: begin
                    d_byteena = 4'b0100;
                    d_writedataout = {write_data[23:0], write_data[31:24]};
                end
                2'b10: begin
                    d_byteena = 4'b0010;
                    d_writedataout = {write_data[15:0], write_data[31:16]};
                end
                2'b11: begin
                    d_byteena = 4'b0001;
                    d_writedataout = {write_data[7:0], write_data[31:8]};
                end
            endcase
        end
        2'b01: begin // 2-byte store
            case (d_address[1])
                1'b0: begin
                    d_byteena = 4'b1100;
                    d_writedataout = write_data;
                end
                1'b1: begin
                    d_byteena = 4'b0011;
                    d_writedataout = {write_data[15:0], write_data[31:16]};
                end
            endcase
        end
        default: begin // Any other store size
            d_byteena = 4'b1111;
            d_writedataout = write_data;
        end
    endcase
end

endmodule