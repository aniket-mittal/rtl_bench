module origen_139461 (
    input [15:0] data_in,
    input [3:0] shift_amount,
    input shift_direction,
    output reg [15:0] data_out
);

    always @(*) begin
        case (shift_direction)
            1'b0: // Left shift
                case (shift_amount)
                    4'd0:  data_out = data_in;
                    4'd1:  data_out = {data_in[14:0], 1'b0};
                    4'd2:  data_out = {data_in[13:0], 2'b0};
                    4'd3:  data_out = {data_in[12:0], 3'b0};
                    4'd4:  data_out = {data_in[11:0], 4'b0};
                    4'd5:  data_out = {data_in[10:0], 5'b0};
                    4'd6:  data_out = {data_in[9:0], 6'b0};
                    4'd7:  data_out = {data_in[8:0], 7'b0};
                    4'd8:  data_out = {data_in[7:0], 8'b0};
                    4'd9:  data_out = {data_in[6:0], 9'b0};
                    4'd10: data_out = {data_in[5:0], 10'b0};
                    4'd11: data_out = {data_in[4:0], 11'b0};
                    4'd12: data_out = {data_in[3:0], 12'b0};
                    4'd13: data_out = {data_in[2:0], 13'b0};
                    4'd14: data_out = {data_in[1:0], 14'b0};
                    4'd15: data_out = {data_in[0], 15'b0};
                endcase
            1'b1: // Right shift
                case (shift_amount)
                    4'd0:  data_out = data_in;
                    4'd1:  data_out = {1'b0, data_in[15:1]};
                    4'd2:  data_out = {2'b0, data_in[15:2]};
                    4'd3:  data_out = {3'b0, data_in[15:3]};
                    4'd4:  data_out = {4'b0, data_in[15:4]};
                    4'd5:  data_out = {5'b0, data_in[15:5]};
                    4'd6:  data_out = {6'b0, data_in[15:6]};
                    4'd7:  data_out = {7'b0, data_in[15:7]};
                    4'd8:  data_out = {8'b0, data_in[15:8]};
                    4'd9:  data_out = {9'b0, data_in[15:9]};
                    4'd10: data_out = {10'b0, data_in[15:10]};
                    4'd11: data_out = {11'b0, data_in[15:11]};
                    4'd12: data_out = {12'b0, data_in[15:12]};
                    4'd13: data_out = {13'b0, data_in[15:13]};
                    4'd14: data_out = {14'b0, data_in[15:14]};
                    4'd15: data_out = {15'b0, data_in[15]};
                endcase
        endcase
    end

endmodule