module origen_115178(
    input [4:0] count,
    output reg [6:0] hex5, hex4, hex3, hex2
);

    [MASKED]

endmodule

module clear_full_testbench();
    reg [4:0] count;
    wire [6:0] hex5, hex4, hex3, hex2;

    clear_full dut(
        .count(count),
        .hex5(hex5),
        .hex4(hex4),
        .hex3(hex3),
        .hex2(hex2)
    );

    initial begin
        for(count = 0; count < 32; count = count + 1) begin
            #10;
        end
        ;
    end

    initial begin
        $monitor("Time=%0t count=%b hex5=%b hex4=%b hex3=%b hex2=%b",
                 $time, count, hex5, hex4, hex3, hex2);
    end

endmodule