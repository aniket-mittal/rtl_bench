module origen_093118(
    input [5:0] function_code,
    input [2:0] alu_operation,
    output reg [2:0] alu_control
);

[MASKED]

endmodule

module alu_c_test;
    reg [5:0] function_code;
    reg [2:0] alu_operation;
    wire [2:0] alu_control;

    aluControl uut (
        .function_code(function_code),
        .alu_operation(alu_operation),
        .alu_control(alu_control)
    );

    initial begin
        alu_operation = 3'b010;
        function_code = 6'h20;
        #10;
        function_code = 6'h22;
        #10;
        alu_operation = 3'b000;
        #10;
        alu_operation = 3'b111;
        #10;
        ;
    end
endmodule