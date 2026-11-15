module origen_138836 (
    input wire clk,
    input wire clk_ena,
    input wire [7:0] in_stream,
    input wire reset,
    output reg [7:0] pipeline_reg_0,
    output reg [7:0] pipeline_reg_1,
    output reg [7:0] pipeline_reg_2,
    output reg [7:0] pipeline_reg_3,
    output reg [7:0] pipeline_reg_4,
    output reg [7:0] pipeline_reg_5,
    output reg [7:0] pipeline_reg_6,
    output reg [7:0] pipeline_reg_7,
    output reg [7:0] pipeline_reg_8,
    output reg [7:0] pipeline_reg_9,
    output reg [7:0] pipeline_reg_10,
    output reg [7:0] pipeline_reg_11,
    output reg [7:0] pipeline_reg_12,
    output reg [7:0] pipeline_reg_13,
    output reg [7:0] pipeline_reg_14,
    output reg [7:0] pipeline_reg_15,
    output reg [7:0] pipeline_reg_16,
    output reg [7:0] pipeline_reg_17
);

[MASKED]

endmodule

// Testbench
module tb_input_pipeline();
    reg clk;
    reg clk_ena;
    reg [7:0] in_stream;
    reg reset;
    wire [7:0] pipeline_reg_0, pipeline_reg_1, pipeline_reg_2, pipeline_reg_3;
    wire [7:0] pipeline_reg_4, pipeline_reg_5, pipeline_reg_6, pipeline_reg_7;
    wire [7:0] pipeline_reg_8, pipeline_reg_9, pipeline_reg_10, pipeline_reg_11;
    wire [7:0] pipeline_reg_12, pipeline_reg_13, pipeline_reg_14, pipeline_reg_15;
    wire [7:0] pipeline_reg_16, pipeline_reg_17;

    input_pipeline dut (
        .clk(clk),
        .clk_ena(clk_ena),
        .in_stream(in_stream),
        .reset(reset),
        .pipeline_reg_0(pipeline_reg_0),
        .pipeline_reg_1(pipeline_reg_1),
        .pipeline_reg_2(pipeline_reg_2),
        .pipeline_reg_3(pipeline_reg_3),
        .pipeline_reg_4(pipeline_reg_4),
        .pipeline_reg_5(pipeline_reg_5),
        .pipeline_reg_6(pipeline_reg_6),
        .pipeline_reg_7(pipeline_reg_7),
        .pipeline_reg_8(pipeline_reg_8),
        .pipeline_reg_9(pipeline_reg_9),
        .pipeline_reg_10(pipeline_reg_10),
        .pipeline_reg_11(pipeline_reg_11),
        .pipeline_reg_12(pipeline_reg_12),
        .pipeline_reg_13(pipeline_reg_13),
        .pipeline_reg_14(pipeline_reg_14),
        .pipeline_reg_15(pipeline_reg_15),
        .pipeline_reg_16(pipeline_reg_16),
        .pipeline_reg_17(pipeline_reg_17)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        clk_ena = 0;
        in_stream = 8'h00;
        #10 reset = 0;
        clk_ena = 1;
        
        // Test data shifting
        #10 in_stream = 8'h01;
        #10 in_stream = 8'h02;
        #10 in_stream = 8'h03;
        #10 in_stream = 8'h04;
        
        // Test clock enable
        #10 clk_ena = 0;
        #20 in_stream = 8'h05;
        #10 clk_ena = 1;
        
        // More test data
        #10 in_stream = 8'h06;
        #10 in_stream = 8'h07;
        #10 in_stream = 8'h08;
        
        #100 ;
    end

    initial begin
        $monitor("Time=%0t reset=%b clk_ena=%b in_stream=%h reg0=%h reg1=%h reg2=%h ... reg16=%h reg17=%h",
                 $time, reset, clk_ena, in_stream, pipeline_reg_0, pipeline_reg_1, pipeline_reg_2,
                 pipeline_reg_16, pipeline_reg_17);
    end

endmodule