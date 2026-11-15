module origen_127896(
    input wire clk,
    input wire rst,
    input wire slow_input,
    input wire [7:0] data_input,
    output wire final_output
);

    wire rise, fall;
    wire [8:0] parity_output;
    
    // Edge detection module
    edge_detector ed (
        .clk(clk),
        .rst(rst),
        .input_signal(slow_input),
        .rise(rise),
        .fall(fall)
    );
    
    // Parity bit module
    parity_generator pg (
        .clk(clk),
        .rst(rst),
        .data_in(data_input),
        .parity_out(parity_output)
    );
    
    // Final output module
    final_output_generator fog (
        .clk(clk),
        .rst(rst),
        .parity_bit(parity_output[8]),
        .rise_edge(rise),
        .final_out(final_output)
    );

endmodule

module edge_detector(
    input wire clk,
    input wire rst,
    input wire input_signal,
    output reg rise,
    output reg fall
);

    reg prev_signal;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prev_signal <= 1'b0;
            rise <= 1'b0;
            fall <= 1'b0;
        end else begin
            prev_signal <= input_signal;
            rise <= (input_signal && !prev_signal);
            fall <= (!input_signal && prev_signal);
        end
    end

endmodule

module parity_generator(
    input wire clk,
    input wire rst,
    input wire [7:0] data_in,
    output reg [8:0] parity_out
);

    reg [7:0] shift_reg;
    reg parity;
    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 8'b0;
            parity <= 1'b0;
            parity_out <= 9'b0;
        end else begin
            shift_reg <= data_in;
            parity <= 1'b0;
            
            for (i = 0; i < 8; i = i + 1) begin
                parity <= parity ^ shift_reg[i];
            end
            
            parity_out <= {~parity, data_in};
        end
    end

endmodule

module final_output_generator(
    input wire clk,
    input wire rst,
    input wire parity_bit,
    input wire rise_edge,
    output reg final_out
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            final_out <= 1'b0;
        end else begin
            final_out <= parity_bit && rise_edge;
        end
    end

endmodule