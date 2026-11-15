module origen_068075 (
    input [7:0] diff_ptr,
    output reg full_flag,
    output reg empty_flag,
    output reg almost_empty,
    output reg almost_full,
    output reg half_flag
);

initial begin
    full_flag = 0;
    empty_flag = 0;
    almost_empty = 0;
    almost_full = 0;
    half_flag = 0;
end

[MASKED]

endmodule

module test;
    reg [7:0] diff_ptr;
    wire full_flag, empty_flag, almost_empty, almost_full, half_flag;

    flagset uut (
        .diff_ptr(diff_ptr),
        .full_flag(full_flag),
        .empty_flag(empty_flag),
        .almost_empty(almost_empty),
        .almost_full(almost_full),
        .half_flag(half_flag)
    );

    initial begin
        $monitor("diff_ptr=%d, full=%b, empty=%b, almost_empty=%b, almost_full=%b, half=%b",
                 diff_ptr, full_flag, empty_flag, almost_empty, almost_full, half_flag);

        diff_ptr = 0;   // Empty condition
        #10;
        diff_ptr = 255; // Full condition
        #10;
        diff_ptr = 127; // Half-full condition
        #10;
        ;
    end
endmodule