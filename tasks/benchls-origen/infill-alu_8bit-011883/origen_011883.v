// ALU Module
module origen_011883(
    input [7:0] INPUT1,
    input [7:0] INPUT2,
    input [2:0] SELECT,
    output [7:0] OUTPUT
);

reg [7:0] OUT;

[MASKED]

assign OUTPUT = OUT;

endmodule

// Testbench Module
module tb_ALU();

reg [7:0] INPUT1, INPUT2;
reg [2:0] SELECT;
wire [7:0] OUTPUT;

ALU dut(
    .INPUT1(INPUT1),
    .INPUT2(INPUT2),
    .SELECT(SELECT),
    .OUTPUT(OUTPUT)
);

initial begin
    INPUT1 = 8'b00000011;  // 3 in decimal
    INPUT2 = 8'b00000001;  // 1 in decimal
    
    // Test pass-through
    SELECT = 3'b000;
    #10 $display("Pass-through: %b", OUTPUT);
    
    // Test addition
    SELECT = 3'b001;
    #10 $display("Addition: %b", OUTPUT);
    
    // Test bitwise AND
    SELECT = 3'b010;
    #10 $display("Bitwise AND: %b", OUTPUT);
    
    // Test bitwise OR
    SELECT = 3'b011;
    #10 $display("Bitwise OR: %b", OUTPUT);
    
    ;
end

endmodule