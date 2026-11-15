module origen_032430(
    input [3:0] A,
    input [3:0] B,
    output reg [1:0] C
);

[MASKED]

endmodule

module compare3_tb;
    reg [3:0] A, B;
    wire [1:0] C;

    compare3 uut (
        .A(A),
        .B(B),
        .C(C)
    );

    initial begin
        // Test case 1: A < B
        A = 4'b0000; B = 4'b0001;
        #250;

        // Test case 2: A > B
        A = 4'b1000; B = 4'b0001;
        #250;

        // Test case 3: A = B
        A = 4'b0100; B = 4'b0100;
        #250;

        // Test case 4: A > B
        A = 4'b1010; B = 4'b1001;
        #250;

        // Test case 5: A = B
        A = 4'b1111; B = 4'b1111;
        #250;

        ;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b C=%b", $time, A, B, C);
    end
endmodule