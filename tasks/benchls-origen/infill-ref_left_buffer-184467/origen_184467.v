module origen_184467(
    input CLK,
    input RST_n,
    input preset,
    input EN_LEFT,
    input [7:0] REF_DATA,
    output [7:0] REF_LEFT0,
    output [7:0] REF_LEFT1,
    output [7:0] REF_LEFT2,
    output [7:0] REF_LEFT3,
    output [7:0] REF_LEFT4,
    output [7:0] REF_LEFT5,
    output [7:0] REF_LEFT6,
    output [7:0] REF_LEFT7
);

    reg [2:0] count;
    reg [7:0] ref_left[0:7];

    [MASKED]

    assign REF_LEFT0 = ref_left[0];
    assign REF_LEFT1 = ref_left[1];
    assign REF_LEFT2 = ref_left[2];
    assign REF_LEFT3 = ref_left[3];
    assign REF_LEFT4 = ref_left[4];
    assign REF_LEFT5 = ref_left[5];
    assign REF_LEFT6 = ref_left[6];
    assign REF_LEFT7 = ref_left[7];

endmodule