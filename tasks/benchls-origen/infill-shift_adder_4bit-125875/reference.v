module origen_125875(
    input wire clk,
    input wire rst,
    input wire [3:0] data_in,
    input wire shift_en,
    input wire mode_select,
    output wire [4:0] sum_out
);

    wire [3:0] shift_out;

    // 4-bit shift register module
    shift_register_4bit sr (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .shift_en(shift_en),
        .data_out(shift_out)
    );

    // 4-bit adder module
    adder_4bit adder (
        .a(shift_out),
        .b(mode_select ? 4'd8 : 4'd4),
        .sum(sum_out)
    );

endmodule

module shift_register_4bit(
    input wire clk,
    input wire rst,
    input wire [3:0] data_in,
    input wire shift_en,
    output reg [3:0] data_out
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 4'b0000;
        end else if (shift_en) begin
            data_out <= data_in;
        end else begin
            data_out <= {data_out[2:0], data_out[3]};
        end
    end

endmodule

module adder_4bit(
    input wire [3:0] a,
    input wire [3:0] b,
    output wire [4:0] sum
);

    assign sum = a + b;

endmodule