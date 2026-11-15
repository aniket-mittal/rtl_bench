module origen_117979(
    input [5:0] in_6bit,
    output [3:0] out_4bit
);

    wire [3:0] col;
    wire [1:0] row;
    reg [3:0] temp_out;

    assign col = in_6bit[4:1];
    assign row = {in_6bit[5], in_6bit[0]};
    assign out_4bit = temp_out;

    [MASKED]

endmodule