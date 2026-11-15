module origen_199829 #(
    parameter front = 16,
    parameter visible_area = 640,
    parameter sync = 96,
    parameter back = 48
) (
    input ck,
    input reset,
    output reg [11:0] position,
    output reg newline,
    output reg syncron,
    output reg active
);

    reg [11:0] count;

    [MASKED]

endmodule