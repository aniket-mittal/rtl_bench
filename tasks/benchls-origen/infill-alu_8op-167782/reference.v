module origen_167782(
    input [31:0] data0_in,
    input [31:0] data1_in,
    input [4:0] data2_in,
    input [3:0] ALUCtrl,
    output reg [31:0] data_out,
    output reg Zero
);

    always @(*) begin
        case (ALUCtrl)
            4'b0010: begin // Addition
                data_out = data0_in + data1_in;
                Zero = (data_out == 0);
            end
            4'b0110: begin // Subtraction
                data_out = data0_in - data1_in;
                Zero = (data_out == 0);
            end
            4'b0000: begin // Bitwise AND
                data_out = data0_in & data1_in;
                Zero = (data_out == 0);
            end
            4'b0001: begin // Bitwise OR
                data_out = data0_in | data1_in;
                Zero = (data_out == 0);
            end
            4'b0111: begin // Comparison (less than)
                data_out = (data0_in < data1_in) ? 32'b1 : 32'b0;
                Zero = (data_out == 0);
            end
            4'b0011: begin // Bitwise XOR
                data_out = data0_in ^ data1_in;
                Zero = (data_out == 0);
            end
            4'b0100: begin // Left Shift
                data_out = data1_in << data2_in;
                Zero = (data_out == 0);
            end
            4'b0101: begin // Right Shift
                data_out = data1_in >> data2_in;
                Zero = (data_out == 0);
            end
            default: begin
                data_out = 32'b0;
                Zero = 1'b0;
            end
        endcase
    end

endmodule