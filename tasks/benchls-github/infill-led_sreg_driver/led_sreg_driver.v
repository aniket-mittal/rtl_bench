module led_sreg_driver #(
    // number of LEDs
    parameter COUNT = 8,
    // invert output
    parameter INVERT = 0,
    // reverse order
    parameter REVERSE = 0,
    // interleave A and B inputs, otherwise only use A
    parameter INTERLEAVE = 0,
    // clock prescale
    parameter PRESCALE = 31
)
(
    input  wire             clk,
    input  wire             rst,

    input  wire [COUNT-1:0] led_a,
    input  wire [COUNT-1:0] led_b,

    output wire             sreg_d,
    output wire             sreg_ld,
    output wire             sreg_clk
);

localparam COUNT_INT = INTERLEAVE ? COUNT*2 : COUNT;
localparam CL_COUNT = $clog2(COUNT_INT+1);
localparam CL_PRESCALE = $clog2(PRESCALE+1);

reg [CL_COUNT-1:0] count_reg = 0;
reg [CL_PRESCALE-1:0] prescale_count_reg = 0;
reg enable_reg = 1'b0;
reg update_reg = 1'b1;
reg cycle_reg = 1'b0;

reg [COUNT_INT-1:0] led_sync_reg_1 = 0;
reg [COUNT_INT-1:0] led_sync_reg_2 = 0;
reg [COUNT_INT-1:0] led_reg = 0;

reg sreg_d_reg = 1'b0;
reg sreg_ld_reg = 1'b0;
reg sreg_clk_reg = 1'b0;

assign sreg_d = INVERT ? !sreg_d_reg : sreg_d_reg;
assign sreg_ld = sreg_ld_reg;
assign sreg_clk = sreg_clk_reg;

integer i;

[MASKED]

endmodule