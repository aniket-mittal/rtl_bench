module origen_123933 #(
    parameter DEPTH = 8,
    parameter WIDTH = 8
) (
    input wire sys_clk_i,
    input wire sys_reset_i,
    input wire [WIDTH-1:0] d_i,
    input wire we_i,
    output reg [WIDTH-1:0] q_o,
    output wire full_o,
    output wire empty_o,
    input wire wp_inc_i,
    input wire rp_inc_i
);

    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [$clog2(DEPTH)-1:0] wp, rp;
    reg [$clog2(DEPTH):0] count;

    assign full_o = (count == DEPTH);
    assign empty_o = (count == 0);

    [MASKED]

    always @(posedge sys_clk_i) begin
        if (!empty_o) begin
            q_o <= mem[rp];
        end
    end

endmodule

module fifo_queue_tb;
    parameter DEPTH = 8;
    parameter WIDTH = 8;

    reg sys_clk_i;
    reg sys_reset_i;
    reg [WIDTH-1:0] d_i;
    reg we_i;
    wire [WIDTH-1:0] q_o;
    wire full_o;
    wire empty_o;
    reg wp_inc_i;
    reg rp_inc_i;

    fifo_queue #(
        .DEPTH(DEPTH),
        .WIDTH(WIDTH)
    ) dut (
        .sys_clk_i(sys_clk_i),
        .sys_reset_i(sys_reset_i),
        .d_i(d_i),
        .we_i(we_i),
        .q_o(q_o),
        .full_o(full_o),
        .empty_o(empty_o),
        .wp_inc_i(wp_inc_i),
        .rp_inc_i(rp_inc_i)
    );

    always #5 sys_clk_i = ~sys_clk_i;

    initial begin
        sys_clk_i = 0;
        sys_reset_i = 1;
        d_i = 0;
        we_i = 0;
        wp_inc_i = 0;
        rp_inc_i = 0;

        #10 sys_reset_i = 0;

        // Write data
        repeat (DEPTH) begin
            @(posedge sys_clk_i);
            d_i = $random;
            we_i = 1;
            #10;
        end
        we_i = 0;

        // Read data
        repeat (DEPTH) begin
            @(posedge sys_clk_i);
            rp_inc_i = 1;
            #10;
            rp_inc_i = 0;
            #10;
        end

        // Test full and empty conditions
        repeat (DEPTH+2) begin
            @(posedge sys_clk_i);
            d_i = $random;
            we_i = 1;
            #10;
        end
        we_i = 0;

        repeat (DEPTH+2) begin
            @(posedge sys_clk_i);
            rp_inc_i = 1;
            #10;
            rp_inc_i = 0;
            #10;
        end

        ;
    end

    initial begin
        $dumpfile("fifo_queue_tb.vcd");
        $dumpvars(0, fifo_queue_tb);
    end

endmodule