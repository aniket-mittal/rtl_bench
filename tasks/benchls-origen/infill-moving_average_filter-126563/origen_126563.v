module origen_126563 #(
    parameter COUNT_MAX = 255,
    parameter N = 8
)(
    input wire clk,
    input wire restart,
    input wire clken,
    input wire avg_on,
    output wire clr_fback,
    output wire ready,
    output wire wen,
    output wire avg_on_out,
    output wire [$clog2(COUNT_MAX)-1:0] address,
    output wire [$clog2(COUNT_MAX)+$clog2(N)-1:0] n_avg
);

    reg [$clog2(COUNT_MAX)-1:0] count;
    reg [$clog2(COUNT_MAX)+$clog2(N)-1:0] sum;
    reg [$clog2(COUNT_MAX)-1:0] memory [N-1:0];
    reg [$clog2(N)-1:0] write_ptr;
    reg avg_ready;

    assign address = count;
    assign clr_fback = (count == COUNT_MAX);
    assign wen = clken;
    assign avg_on_out = avg_on;
    assign ready = avg_ready;
    assign n_avg = sum >> $clog2(N);

    [MASKED]

endmodule

// Testbench
module tb_counter_with_average();
    reg clk, restart, clken, avg_on;
    wire clr_fback, ready, wen, avg_on_out;
    wire [7:0] address;
    wire [10:0] n_avg;

    counter_with_average #(
        .COUNT_MAX(255),
        .N(8)
    ) dut (
        .clk(clk),
        .restart(restart),
        .clken(clken),
        .avg_on(avg_on),
        .clr_fback(clr_fback),
        .ready(ready),
        .wen(wen),
        .avg_on_out(avg_on_out),
        .address(address),
        .n_avg(n_avg)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        restart = 1;
        clken = 0;
        avg_on = 0;
        #10 restart = 0;
        #10 clken = 1;
        #10 avg_on = 1;
        #2000 avg_on = 0;
        #100 ;
    end

    initial begin
        $monitor("Time=%0t, address=%d, n_avg=%d, ready=%b", $time, address, n_avg, ready);
    end

endmodule