module origen_132544 (
    input wire clk,
    input wire rst,
    input wire [31:0] data_in,
    input wire slow_signal,
    input wire select,
    output wire [33:0] final_output
);

    wire [31:0] reversed_bytes;
    wire rising_edge, falling_edge;
    reg [1:0] state;
    reg enable_byte_reverse, enable_edge_detect;

    // Byte reversal module
    byte_reverse br (
        .clk(clk),
        .rst(rst),
        .enable(enable_byte_reverse),
        .data_in(data_in),
        .data_out(reversed_bytes)
    );

    // Edge detection module
    edge_detect ed (
        .clk(clk),
        .rst(rst),
        .enable(enable_edge_detect),
        .signal_in(slow_signal),
        .rising_edge(rising_edge),
        .falling_edge(falling_edge)
    );

    // Control logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 2'b00;
            enable_byte_reverse <= 0;
            enable_edge_detect <= 0;
        end else begin
            case (state)
                2'b00: begin
                    if (select) begin
                        state <= 2'b01;
                        enable_byte_reverse <= 1;
                        enable_edge_detect <= 0;
                    end else begin
                        state <= 2'b10;
                        enable_byte_reverse <= 0;
                        enable_edge_detect <= 1;
                    end
                end
                2'b01: begin
                    state <= 2'b11;
                    enable_byte_reverse <= 0;
                end
                2'b10: begin
                    state <= 2'b11;
                    enable_edge_detect <= 0;
                end
                2'b11: begin
                    state <= 2'b00;
                end
            endcase
        end
    end

    // Final output
    assign final_output = {reversed_bytes, rising_edge, falling_edge};

endmodule

module byte_reverse (
    input wire clk,
    input wire rst,
    input wire enable,
    input wire [31:0] data_in,
    output reg [31:0] data_out
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 32'b0;
        end else if (enable) begin
            data_out <= {data_in[7:0], data_in[15:8], data_in[23:16], data_in[31:24]};
        end
    end

endmodule

module edge_detect (
    input wire clk,
    input wire rst,
    input wire enable,
    input wire signal_in,
    output reg rising_edge,
    output reg falling_edge
);

    reg prev_signal;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prev_signal <= 1'b0;
            rising_edge <= 1'b0;
            falling_edge <= 1'b0;
        end else if (enable) begin
            prev_signal <= signal_in;
            rising_edge <= (signal_in & ~prev_signal);
            falling_edge <= (~signal_in & prev_signal);
        end else begin
            rising_edge <= 1'b0;
            falling_edge <= 1'b0;
        end
    end

endmodule