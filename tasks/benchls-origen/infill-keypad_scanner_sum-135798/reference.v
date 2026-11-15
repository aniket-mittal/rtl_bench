module origen_135798(
    input wire clk,
    input wire rst,
    input wire [3:0] row,
    output wire [3:0] col,
    output wire [7:0] final_output
);

    wire [3:0] counter_out;
    wire [3:0] keypad_row, keypad_col;
    wire [3:0] selected_value;

    // Binary counter module
    binary_counter counter (
        .clk(clk),
        .rst(rst),
        .count(counter_out)
    );

    // Keypad scanner module
    keypad_scanner scanner (
        .clk(clk),
        .rst(rst),
        .row(row),
        .col(col),
        .row_out(keypad_row),
        .col_out(keypad_col)
    );

    // Value selector module
    value_selector selector (
        .row(keypad_row),
        .col(keypad_col),
        .selected_value(selected_value)
    );

    // Final output calculation
    assign final_output = counter_out + selected_value;

endmodule

module binary_counter(
    input wire clk,
    input wire rst,
    output reg [3:0] count
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b0000;
        else if (count == 4'b1111)
            count <= 4'b0000;
        else
            count <= count + 1;
    end

endmodule

module keypad_scanner(
    input wire clk,
    input wire rst,
    input wire [3:0] row,
    output reg [3:0] col,
    output reg [3:0] row_out,
    output reg [3:0] col_out
);

    reg [1:0] state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 2'b00;
            col <= 4'b1110;
            row_out <= 4'b0000;
            col_out <= 4'b0000;
        end else begin
            case (state)
                2'b00: col <= 4'b1110;
                2'b01: col <= 4'b1101;
                2'b10: col <= 4'b1011;
                2'b11: col <= 4'b0111;
            endcase

            if (row != 4'b1111) begin
                row_out <= row;
                col_out <= col;
            end

            state <= state + 1;
        end
    end

endmodule

module value_selector(
    input wire [3:0] row,
    input wire [3:0] col,
    output reg [3:0] selected_value
);

    always @(*) begin
        case ({row, col})
            8'b1110_1110: selected_value = 4'd1;
            8'b1110_1101: selected_value = 4'd2;
            8'b1110_1011: selected_value = 4'd3;
            8'b1110_0111: selected_value = 4'd4;
            8'b1101_1110: selected_value = 4'd5;
            8'b1101_1101: selected_value = 4'd6;
            8'b1101_1011: selected_value = 4'd7;
            8'b1101_0111: selected_value = 4'd8;
            8'b1011_1110: selected_value = 4'd9;
            8'b1011_1101: selected_value = 4'd10;
            8'b1011_1011: selected_value = 4'd11;
            8'b1011_0111: selected_value = 4'd12;
            8'b0111_1110: selected_value = 4'd13;
            8'b0111_1101: selected_value = 4'd14;
            8'b0111_1011: selected_value = 4'd15;
            8'b0111_0111: selected_value = 4'd16;
            default: selected_value = 4'd0;
        endcase
    end

endmodule