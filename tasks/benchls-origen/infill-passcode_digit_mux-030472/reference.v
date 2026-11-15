module origen_030472(
    input [2:0] state,
    input button_increase,
    input [3:0] insertdata_digit1, insertdata_digit2, insertdata_digit3, insertdata_digit4,
    input [3:0] insertdata_digit5, insertdata_digit6, insertdata_digit7, insertdata_digit8,
    input [2:0] insertdata_position_pointer,
    input [3:0] insertnewpass_digit1, insertnewpass_digit2, insertnewpass_digit3, insertnewpass_digit4,
    input [3:0] insertnewpass_digit5, insertnewpass_digit6, insertnewpass_digit7, insertnewpass_digit8,
    input [2:0] insertnewpass_position_pointer,
    input [3:0] insertpass_digit1, insertpass_digit2, insertpass_digit3, insertpass_digit4,
    input [3:0] insertpass_digit5, insertpass_digit6, insertpass_digit7, insertpass_digit8,
    input [2:0] insertpass_position_pointer,
    input [3:0] data_digit1, data_digit2, data_digit3, data_digit4,
    input [3:0] data_digit5, data_digit6, data_digit7, data_digit8,
    output reg [2:0] position_pointer,
    output reg [3:0] digit1, digit2, digit3, digit4, digit5, digit6, digit7, digit8
);

always @(state or button_increase) begin
    case(state)
        3'b000: begin // Insert Data Mode
            position_pointer <= insertdata_position_pointer;
            digit1 <= insertdata_digit1;
            digit2 <= insertdata_digit2;
            digit3 <= insertdata_digit3;
            digit4 <= insertdata_digit4;
            digit5 <= insertdata_digit5;
            digit6 <= insertdata_digit6;
            digit7 <= insertdata_digit7;
            digit8 <= insertdata_digit8;
        end
        3'b001: begin // Insert New Password Mode
            position_pointer <= insertnewpass_position_pointer;
            digit1 <= insertnewpass_digit1;
            digit2 <= insertnewpass_digit2;
            digit3 <= insertnewpass_digit3;
            digit4 <= insertnewpass_digit4;
            digit5 <= insertnewpass_digit5;
            digit6 <= insertnewpass_digit6;
            digit7 <= insertnewpass_digit7;
            digit8 <= insertnewpass_digit8;
        end
        3'b010: begin // Confirm New Password Mode
            digit1 <= insertnewpass_digit1;
            digit2 <= insertnewpass_digit2;
            digit3 <= insertnewpass_digit3;
            digit4 <= insertnewpass_digit4;
            digit5 <= insertnewpass_digit5;
            digit6 <= insertnewpass_digit6;
            digit7 <= insertnewpass_digit7;
            digit8 <= insertnewpass_digit8;
        end
        3'b011: begin // Insert Password Mode
            position_pointer <= insertpass_position_pointer;
            digit1 <= insertpass_digit1;
            digit2 <= insertpass_digit2;
            digit3 <= insertpass_digit3;
            digit4 <= insertpass_digit4;
            digit5 <= insertpass_digit5;
            digit6 <= insertpass_digit6;
            digit7 <= insertpass_digit7;
            digit8 <= insertpass_digit8;
        end
        3'b100: begin // Data Display Mode
            digit1 <= data_digit1;
            digit2 <= data_digit2;
            digit3 <= data_digit3;
            digit4 <= data_digit4;
            digit5 <= data_digit5;
            digit6 <= data_digit6;
            digit7 <= data_digit7;
            digit8 <= data_digit8;
        end
        default: begin
            position_pointer <= 3'b000;
            digit1 <= 4'b0000;
            digit2 <= 4'b0000;
            digit3 <= 4'b0000;
            digit4 <= 4'b0000;
            digit5 <= 4'b0000;
            digit6 <= 4'b0000;
            digit7 <= 4'b0000;
            digit8 <= 4'b0000;
        end
    endcase
end

endmodule