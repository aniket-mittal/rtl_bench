module origen_107873(
    input [63:0] A,
    input [63:0] B,
    output [63:0] mult_low
);
    reg signed [63:0] signedA, signedB;
    reg signed [127:0] signedResult;
    
    [MASKED]
    
    assign mult_low = signedResult[63:0];
endmodule

module shifter(
    input [63:0] value,
    input direction,
    input [5:0] distance,
    output reg [63:0] result
);
    always @(*) begin
        if (direction == 0)
            result = value << distance;
        else
            result = value >> distance;
    end
endmodule

module shifter_testbench();
    reg [63:0] value;
    reg direction;
    reg [5:0] distance;
    wire [63:0] result;
    
    shifter dut(
        .value(value),
        .direction(direction),
        .distance(distance),
        .result(result)
    );
    
    initial begin
        value = 64'hDEADBEEFDECAFBAD;
        
        for (direction = 0; direction <= 1; direction = direction + 1) begin
            for (distance = 0; distance < 64; distance = distance + 1) begin
                #10;
                $display("Direction: %b, Distance: %d, Result: %h", direction, distance, result);
            end
        end
        
        ;
    end
endmodule