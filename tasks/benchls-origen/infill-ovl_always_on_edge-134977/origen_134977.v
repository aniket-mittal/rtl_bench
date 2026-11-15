module origen_134977 (
    input wire clk,
    input wire rst,
    input wire enable,
    input wire sampling_event,
    input wire test_expr,
    input wire prevConfigInvalid,
    output wire out
);

    // Implement the functionality of ovl_always_on_edge_wrapped
    reg out_reg;
    assign out = out_reg;

    [MASKED]

endmodule

// Testbench
module tb_always_on_edge_wrapper;
    reg clk, rst, enable, sampling_event, test_expr, prevConfigInvalid;
    wire out;

    // Instantiate the wrapper module
    always_on_edge_wrapper dut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .sampling_event(sampling_event),
        .test_expr(test_expr),
        .prevConfigInvalid(prevConfigInvalid),
        .out(out)
    );

    // Initialize inputs
    initial begin
        clk = 0;
        rst = 1;
        enable = 0;
        sampling_event = 0;
        test_expr = 0;
        prevConfigInvalid = 0;
    end

    // Clock generation
    always #5 clk = ~clk;

    // Reset generation
    initial begin
        #1 rst = 0;
    end

    // Enable generation
    initial begin
        #10 enable = 1;
    end

    // Stimulus
    initial begin
        // Wait for reset and enable to settle
        #15;

        // Test case 1
        sampling_event = 1;
        test_expr = 1;
        #10;
        sampling_event = 0;
        #20;

        // Test case 2
        sampling_event = 1;
        test_expr = 0;
        #10;
        sampling_event = 0;
        #20;

        // Test case 3
        prevConfigInvalid = 1;
        sampling_event = 1;
        test_expr = 1;
        #10;
        sampling_event = 0;
        prevConfigInvalid = 0;
        #20;

        ;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t clk=%b rst=%b enable=%b sampling_event=%b test_expr=%b prevConfigInvalid=%b out=%b",
                 $time, clk, rst, enable, sampling_event, test_expr, prevConfigInvalid, out);
    end

endmodule