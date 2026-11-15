module origen_139479(
    input wire clk,
    input wire rst,
    input wire slow_signal,
    input wire [2:0] select,
    input wire [3:0] data_in0, data_in1, data_in2, data_in3, data_in4, data_in5,
    output wire [3:0] final_output
);

    wire rising_edge, falling_edge;
    wire [3:0] mux_output;

    // Edge detection module
    edge_detector ed (
        .clk(clk),
        .rst(rst),
        .signal(slow_signal),
        .rising_edge(rising_edge),
        .falling_edge(falling_edge)
    );

    // Multiplexer
    mux_6to1 mux (
        .select(select),
        .data_in0(data_in0),
        .data_in1(data_in1),
        .data_in2(data_in2),
        .data_in3(data_in3),
        .data_in4(data_in4),
        .data_in5(data_in5),
        .data_out(mux_output)
    );

    // Additional functional module
    edge_mux_combiner combiner (
        .rising_edge(rising_edge),
        .falling_edge(falling_edge),
        .mux_data(mux_output),
        .final_output(final_output)
    );

endmodule

module edge_detector(
    input wire clk,
    input wire rst,
    input wire signal,
    output wire rising_edge,
    output wire falling_edge
);

    reg signal_delay, signal_delay2;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            signal_delay <= 1'b0;
            signal_delay2 <= 1'b0;
        end else begin
            signal_delay <= signal;
            signal_delay2 <= signal_delay;
        end
    end

    assign rising_edge = signal & ~signal_delay;
    assign falling_edge = ~signal & signal_delay;

endmodule

module mux_6to1(
    input wire [2:0] select,
    input wire [3:0] data_in0, data_in1, data_in2, data_in3, data_in4, data_in5,
    output reg [3:0] data_out
);

    always @(*) begin
        case(select)
            3'b000: data_out = data_in0;
            3'b001: data_out = data_in1;
            3'b010: data_out = data_in2;
            3'b011: data_out = data_in3;
            3'b100: data_out = data_in4;
            3'b101: data_out = data_in5;
            default: data_out = 4'b0000;
        endcase
    end

endmodule

module edge_mux_combiner(
    input wire rising_edge,
    input wire falling_edge,
    input wire [3:0] mux_data,
    output reg [3:0] final_output
);

    always @(*) begin
        if (rising_edge | falling_edge) begin
            final_output = mux_data;
        end else begin
            final_output = 4'b0000;
        end
    end

endmodule