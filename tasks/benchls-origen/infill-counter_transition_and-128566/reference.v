module origen_128566 (
    input wire clk,
    input wire rst,
    input wire load,
    input wire up_down,
    input wire [15:0] parallel_in,
    input wire [31:0] transition_in,
    output wire [7:0] final_output
);

    wire [15:0] counter_out;
    wire [31:0] transition_out;

    // 4-digit up/down counter with parallel load
    counter_4digit counter (
        .clk(clk),
        .rst(rst),
        .load(load),
        .up_down(up_down),
        .parallel_in(parallel_in),
        .q(counter_out)
    );

    // Transition detector
    transition_detector detector (
        .clk(clk),
        .rst(rst),
        .in(transition_in),
        .out(transition_out)
    );

    // Functional module for bitwise AND
    functional_module func_mod (
        .counter_in(counter_out),
        .transition_in(transition_out),
        .final_out(final_output)
    );

endmodule

module counter_4digit (
    input wire clk,
    input wire rst,
    input wire load,
    input wire up_down,
    input wire [15:0] parallel_in,
    output reg [15:0] q
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 16'b0;
        end else if (load) begin
            q <= parallel_in;
        end else begin
            if (up_down) begin
                if (q == 16'h9999)
                    q <= 16'h0000;
                else if (q[3:0] == 4'h9)
                    {q[7:4], q[3:0]} <= {q[7:4] + 1'b1, 4'h0};
                else if (q[7:4] == 4'h9 && q[3:0] == 4'h9)
                    {q[11:8], q[7:4], q[3:0]} <= {q[11:8] + 1'b1, 8'h00};
                else if (q[11:8] == 4'h9 && q[7:4] == 4'h9 && q[3:0] == 4'h9)
                    {q[15:12], q[11:8], q[7:4], q[3:0]} <= {q[15:12] + 1'b1, 12'h000};
                else
                    q[3:0] <= q[3:0] + 1'b1;
            end else begin
                if (q == 16'h0000)
                    q <= 16'h9999;
                else if (q[3:0] == 4'h0)
                    {q[7:4], q[3:0]} <= {q[7:4] - 1'b1, 4'h9};
                else if (q[7:4] == 4'h0 && q[3:0] == 4'h0)
                    {q[11:8], q[7:4], q[3:0]} <= {q[11:8] - 1'b1, 8'h99};
                else if (q[11:8] == 4'h0 && q[7:4] == 4'h0 && q[3:0] == 4'h0)
                    {q[15:12], q[11:8], q[7:4], q[3:0]} <= {q[15:12] - 1'b1, 12'h999};
                else
                    q[3:0] <= q[3:0] - 1'b1;
            end
        end
    end

endmodule

module transition_detector (
    input wire clk,
    input wire rst,
    input wire [31:0] in,
    output reg [31:0] out
);

    reg [31:0] prev_state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prev_state <= 32'b0;
            out <= 32'b0;
        end else begin
            out <= in ^ prev_state;
            prev_state <= in;
        end
    end

endmodule

module functional_module (
    input wire [15:0] counter_in,
    input wire [31:0] transition_in,
    output wire [7:0] final_out
);

    assign final_out = {counter_in[7:0] & transition_in[7:0]};

endmodule