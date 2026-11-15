module origen_126740 (
    input wire wb_clk_i,
    input wire wb_rst_i,
    input wire [15:0] wb_adr_i,
    input wire [15:0] wb_dat_i,
    input wire [1:0] wb_sel_i,
    input wire wb_we_i,
    input wire wb_stb_i,
    input wire wb_cyc_i,
    output reg [15:0] wb_dat_o,
    output reg wb_ack_o,
    output reg [7:0] leds_,
    input wire [7:0] sw_
);

    [MASKED]

endmodule

// Testbench
module tb_wishbone_slave();
    reg wb_clk_i;
    reg wb_rst_i;
    reg [15:0] wb_adr_i;
    reg [15:0] wb_dat_i;
    reg [1:0] wb_sel_i;
    reg wb_we_i;
    reg wb_stb_i;
    reg wb_cyc_i;
    wire [15:0] wb_dat_o;
    wire wb_ack_o;
    wire [7:0] leds_;
    reg [7:0] sw_;

    wishbone_slave dut (
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i),
        .wb_adr_i(wb_adr_i),
        .wb_dat_i(wb_dat_i),
        .wb_sel_i(wb_sel_i),
        .wb_we_i(wb_we_i),
        .wb_stb_i(wb_stb_i),
        .wb_cyc_i(wb_cyc_i),
        .wb_dat_o(wb_dat_o),
        .wb_ack_o(wb_ack_o),
        .leds_(leds_),
        .sw_(sw_)
    );

    // Clock generation
    always #5 wb_clk_i = ~wb_clk_i;

    initial begin
        // Initialize inputs
        wb_clk_i = 0;
        wb_rst_i = 1;
        wb_adr_i = 0;
        wb_dat_i = 0;
        wb_sel_i = 0;
        wb_we_i = 0;
        wb_stb_i = 0;
        wb_cyc_i = 0;
        sw_ = 8'hA5;

        // Reset
        #20 wb_rst_i = 0;

        // Test 1: Read switches
        #10 wb_adr_i = 16'h0000;
        wb_cyc_i = 1;
        wb_stb_i = 1;
        #10 wb_cyc_i = 0;
        wb_stb_i = 0;

        // Test 2: Write to LEDs
        #10 wb_adr_i = 16'h0001;
        wb_dat_i = 16'h00FF;
        wb_we_i = 1;
        wb_cyc_i = 1;
        wb_stb_i = 1;
        #10 wb_cyc_i = 0;
        wb_stb_i = 0;
        wb_we_i = 0;

        // Test 3: Read LEDs
        #10 wb_adr_i = 16'h0001;
        wb_cyc_i = 1;
        wb_stb_i = 1;
        #10 wb_cyc_i = 0;
        wb_stb_i = 0;

        // End simulation
        #10 ;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t wb_ack_o=%b wb_dat_o=%h leds_=%h", $time, wb_ack_o, wb_dat_o, leds_);
    end

endmodule