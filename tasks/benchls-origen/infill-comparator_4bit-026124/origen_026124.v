module origen_026124(
    input [3:0] X,
    input [3:0] Y,
    output reg XlessthanY,
    output reg XequalY,
    output reg XgreaterthanY
);

[MASKED]

endmodule

module testbench_Comparator();
    reg [3:0] X, Y;
    wire XlessthanY, XequalY, XgreaterthanY;

    four_bit_Comparator uut (
        .X(X),
        .Y(Y),
        .XlessthanY(XlessthanY),
        .XequalY(XequalY),
        .XgreaterthanY(XgreaterthanY)
    );

    initial begin
        X = 4'b0110; Y = 4'b1001; // X = 6, Y = 9
        #30;
        X = 4'b1100; Y = 4'b0111; // X = 12, Y = 7
        #30;
        X = 4'b1000; Y = 4'b1000; // X = 8, Y = 8
        #30;
        ;
    end

    initial begin
        $monitor("Time=%0t X=%b Y=%b XlessthanY=%b XequalY=%b XgreaterthanY=%b",
                 $time, X, Y, XlessthanY, XequalY, XgreaterthanY);
    end

endmodule