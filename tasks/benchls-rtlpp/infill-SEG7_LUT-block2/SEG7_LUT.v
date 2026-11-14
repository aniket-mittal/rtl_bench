module SEG7_LUT(
    output [6:0] oSEG,
    input  [3:0] iDIG
);
    reg [6:0] seg_data;
    [MASKED]
    assign oSEG = seg_data;
endmodule