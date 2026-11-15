module origen_129386 (
    input wire clk,
    input wire rst,
    input wire [3:0] input_a,
    input wire [3:0] input_b,
    input wire input_select,
    input wire shift_enable,
    input wire shift_direction,
    input wire [7:0] bit_select,
    output wire result
);

    reg [3:0] selected_input;
    reg [3:0] shifted_value;
    reg [7:0] mux_select;
    wire [3:0] adder_output;

    // Input selection
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            selected_input <= 4'b0000;
        end else begin
            selected_input <= input_select ? input_b : input_a;
        end
    end

    // 4-bit adder
    assign adder_output = selected_input + 4'b0001;

    // Barrel shifter
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shifted_value <= 4'b0000;
        end else if (shift_enable) begin
            if (shift_direction)
                shifted_value <= {adder_output[2:0], adder_output[3]};
            else
                shifted_value <= {adder_output[0], adder_output[3:1]};
        end else begin
            shifted_value <= adder_output;
        end
    end

    // 256-to-1 multiplexer select logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            mux_select <= 8'b00000000;
        end else begin
            mux_select <= bit_select;
        end
    end

    // 256-to-1 multiplexer
    assign result = shifted_value[mux_select[1:0]];

endmodule