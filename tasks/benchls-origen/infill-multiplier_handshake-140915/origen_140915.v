`timescale 1ns / 1ps

module origen_140915 (
    input wire ap_clk,
    input wire ap_rst,
    input wire ap_start,
    output wire ap_done,
    output wire ap_idle,
    output wire ap_ready,
    input wire vld_i,
    input wire [31:0] x_i_V,
    input wire [31:0] rat_i_V,
    output wire vld_o,
    output wire [31:0] y_o_V
);

    reg [31:0] y_reg;
    reg done_reg, idle_reg, ready_reg, vld_o_reg;

    [MASKED]

    assign y_o_V = y_reg;
    assign ap_done = done_reg;
    assign ap_idle = idle_reg;
    assign ap_ready = ready_reg;
    assign vld_o = vld_o_reg;

endmodule

module tb_multiSRC();

  // Parameters
  parameter CLK_PERIOD = 10;

  // Signals
  reg ap_clk;
  reg ap_rst;
  reg ap_start;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  reg vld_i;
  reg [31:0] x_i_V;
  reg [31:0] rat_i_V;
  wire vld_o;
  wire [31:0] y_o_V;

  reg test_done;
  reg test_pass;

  // Instantiate the Unit Under Test (UUT)
  multiSRC uut (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .vld_i(vld_i),
    .x_i_V(x_i_V),
    .rat_i_V(rat_i_V),
    .vld_o(vld_o),
    .y_o_V(y_o_V)
  );

  // Clock generation
  always begin
    ap_clk = 0;
    #(CLK_PERIOD/2);
    ap_clk = 1;
    #(CLK_PERIOD/2);
  end

  // Test procedure
  initial begin
    // Initialize inputs
    ap_rst = 1;
    ap_start = 0;
    vld_i = 0;
    x_i_V = 0;
    rat_i_V = 0;
    test_done = 0;
    test_pass = 1;

    // Reset
    #(CLK_PERIOD * 5);
    ap_rst = 0;

    // Wait for module to become idle
    wait(ap_idle);

    // Test case 1
    x_i_V = 32'd100;
    rat_i_V = 32'd2;
    vld_i = 1;
    ap_start = 1;
    #CLK_PERIOD;
    ap_start = 0;
    vld_i = 0;

    wait(ap_done);
    if (y_o_V !== 32'd200) begin
      $display("Test case 1 failed. Expected 200, got %d", y_o_V);
      test_pass = 0;
    end

    // Test case 2
    wait(ap_idle);
    x_i_V = 32'd50;
    rat_i_V = 32'd3;
    vld_i = 1;
    ap_start = 1;
    #CLK_PERIOD;
    ap_start = 0;
    vld_i = 0;

    wait(ap_done);
    if (y_o_V !== 32'd150) begin
      $display("Test case 2 failed. Expected 150, got %d", y_o_V);
      test_pass = 0;
    end

    // Test case 3
    wait(ap_idle);
    x_i_V = 32'd200;
    rat_i_V = 32'd1;
    vld_i = 1;
    ap_start = 1;
    #CLK_PERIOD;
    ap_start = 0;
    vld_i = 0;

    wait(ap_done);
    if (y_o_V !== 32'd200) begin
      $display("Test case 3 failed. Expected 200, got %d", y_o_V);
      test_pass = 0;
    end

    // End simulation
    #(CLK_PERIOD * 5);
    test_done = 1;
    if (test_pass) begin
      $display("All tests passed!");
    end else begin
      $display("Some tests failed.");
    end
    ;
  end

endmodule