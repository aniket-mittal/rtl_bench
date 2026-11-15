module origen_139502(
    input [3:0] A,
    input [3:0] B,
    input C,
    output [3:0] S,
    output Cout
);

wire [3:0] B_xor;
wire [4:0] sum;

// XOR B with C for subtraction
assign B_xor = B ^ {4{C}};

// Perform addition
[MASKED]

// Assign outputs
assign S = sum[3:0];
assign Cout = sum[4];

endmodule

// Testbench
module adder_subtractor_tb;
    reg [3:0] A, B;
    reg C;
    wire [3:0] S;
    wire Cout;

    adder_subtractor uut (
        .A(A),
        .B(B),
        .C(C),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        // Test case 1: Addition
        A = 4'b0101; B = 4'b0011; C = 0;
        #10;
        
        // Test case 2: Subtraction
        A = 4'b1000; B = 4'b0011; C = 1;
        #10;
        
        // Test case 3: Addition with carry
        A = 4'b1111; B = 4'b0001; C = 0;
        #10;
        
        // Test case 4: Subtraction with borrow
        A = 4'b0100; B = 4'b0110; C = 1;
        #10;
        
        ;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b C=%b S=%b Cout=%b", $time, A, B, C, S, Cout);
    end

endmodule