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

    always @(posedge clk) begin
        if (restart) begin
            count <= 0;
            sum <= 0;
            write_ptr <= 0;
            avg_ready <= 0;
        end else if (clken) begin
            if (count == COUNT_MAX) begin
                count <= 0;
            end else begin
                count <= count + 1;
            end

            if (avg_on) begin
                sum <= sum - memory[write_ptr] + count;
                memory[write_ptr] <= count;
                write_ptr <= write_ptr + 1;
                avg_ready <= (write_ptr == N-1);
            end else begin
                sum <= 0;
                write_ptr <= 0;
                avg_ready <= 0;
            end
        end
    end

endmodule

// Testbench
