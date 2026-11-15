module origen_050199 (
    input wire clk,
    input wire reset,
    input wire Ta,
    input wire Tb,
    output reg green_a,
    output reg yellow_a,
    output reg red_a,
    output reg green_b,
    output reg yellow_b,
    output reg red_b
);

    // State encoding
    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100,
              S5 = 3'b101;

    reg [2:0] current_state, next_state;

    // State update block
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next state and output logic block
    [MASKED]

endmodule

module tb_TLC;
    reg clk, reset, Ta, Tb;
    wire green_a, yellow_a, red_a, green_b, yellow_b, red_b;

    TLC uut (
        .clk(clk),
        .reset(reset),
        .Ta(Ta),
        .Tb(Tb),
        .green_a(green_a),
        .yellow_a(yellow_a),
        .red_a(red_a),
        .green_b(green_b),
        .yellow_b(yellow_b),
        .red_b(red_b)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        reset = 1;
        Ta = 1;
        Tb = 1;
        #10 reset = 0;
        #100 Ta = 0;
        #50 Ta = 1;
        #100 Tb = 0;
        #50 Tb = 1;
        #100 ;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t, State=%b, Ta=%b, Tb=%b, Lights: A(%b%b%b), B(%b%b%b)",
                 $time, uut.current_state, Ta, Tb, green_a, yellow_a, red_a, green_b, yellow_b, red_b);
    end

endmodule