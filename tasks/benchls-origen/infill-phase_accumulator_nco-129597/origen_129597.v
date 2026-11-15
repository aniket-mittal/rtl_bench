module origen_129597 #(
    parameter WIDTH = 32,
    parameter INITIAL_PHASE = 0,
    parameter INITIAL_PHASE_STEP = 0
) (
    input wire clk,
    input wire rst,
    
    input wire [WIDTH-1:0] input_phase_tdata,
    input wire input_phase_tvalid,
    output wire input_phase_tready,
    
    input wire [WIDTH-1:0] input_phase_step_tdata,
    input wire input_phase_step_tvalid,
    output wire input_phase_step_tready,
    
    output reg [WIDTH-1:0] output_phase_tdata,
    output reg output_phase_tvalid,
    input wire output_phase_tready
);

reg [WIDTH-1:0] phase_reg;
reg [WIDTH-1:0] phase_step_reg;

assign input_phase_tready = 1'b1;
assign input_phase_step_tready = 1'b1;

[MASKED]

endmodule

// Testbench
module tb_phase_accumulator();

parameter WIDTH = 32;
parameter INITIAL_PHASE = 0;
parameter INITIAL_PHASE_STEP = 1;

reg clk;
reg rst;
reg [WIDTH-1:0] input_phase_tdata;
reg input_phase_tvalid;
wire input_phase_tready;
reg [WIDTH-1:0] input_phase_step_tdata;
reg input_phase_step_tvalid;
wire input_phase_step_tready;
wire [WIDTH-1:0] output_phase_tdata;
wire output_phase_tvalid;
reg output_phase_tready;

phase_accumulator #(
    .WIDTH(WIDTH),
    .INITIAL_PHASE(INITIAL_PHASE),
    .INITIAL_PHASE_STEP(INITIAL_PHASE_STEP)
) dut (
    .clk(clk),
    .rst(rst),
    .input_phase_tdata(input_phase_tdata),
    .input_phase_tvalid(input_phase_tvalid),
    .input_phase_tready(input_phase_tready),
    .input_phase_step_tdata(input_phase_step_tdata),
    .input_phase_step_tvalid(input_phase_step_tvalid),
    .input_phase_step_tready(input_phase_step_tready),
    .output_phase_tdata(output_phase_tdata),
    .output_phase_tvalid(output_phase_tvalid),
    .output_phase_tready(output_phase_tready)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    input_phase_tdata = 0;
    input_phase_tvalid = 0;
    input_phase_step_tdata = 0;
    input_phase_step_tvalid = 0;
    output_phase_tready = 1;
    
    #10 rst = 0;
    
    // Test initial phase and phase step
    #10 if (output_phase_tdata != INITIAL_PHASE) $display("Test 1 failed");
    
    // Test phase step update
    #10 input_phase_step_tdata = 5;
    input_phase_step_tvalid = 1;
    #10 input_phase_step_tvalid = 0;
    #10 if (output_phase_tdata != INITIAL_PHASE + 5) $display("Test 2 failed");
    
    // Test phase update
    #10 input_phase_tdata = 100;
    input_phase_tvalid = 1;
    #10 input_phase_tvalid = 0;
    #10 if (output_phase_tdata != 105) $display("Test 3 failed");
    
    // Test multiple accumulations
    #50 if (output_phase_tdata != 130) $display("Test 4 failed");
    
    $display("All tests completed");
    ;
end

endmodule