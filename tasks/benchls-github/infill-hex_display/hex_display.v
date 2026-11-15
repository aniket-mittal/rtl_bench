module hex_display #(
    parameter INVERT = 0
)
(
    input  wire [3:0] in,
    input  wire       enable,

    output wire [6:0] out
);

reg [6:0] enc;

[MASKED]

assign out = INVERT ? ~enc : enc;

endmodule