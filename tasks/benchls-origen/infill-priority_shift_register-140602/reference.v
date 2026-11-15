module origen_140602 (
    input wire clk,
    input wire rst_n,
    input wire enable,
    input wire load,
    input wire [3:0] data_in,
    input wire [3:0] priority_in,
    output reg [3:0] final_output
);

    // Priority Encoder
    wire [3:0] priority_out;
    assign priority_out[3] = priority_in[3];
    assign priority_out[2] = ~priority_in[3] & priority_in[2];
    assign priority_out[1] = ~priority_in[3] & ~priority_in[2] & priority_in[1];
    assign priority_out[0] = ~priority_in[3] & ~priority_in[2] & ~priority_in[1] & priority_in[0];

    // Shift Register
    reg [3:0] shift_reg;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shift_reg <= 4'b0000;
        end else if (load) begin
            shift_reg <= data_in;
        end else if (enable) begin
            shift_reg <= {shift_reg[2:0], 1'b0};
        end
    end

    // Bitwise OR operation
    wire [3:0] or_output;
    assign or_output = priority_out | shift_reg;

    // Count high bits
    function [3:0] count_high_bits;
        input [3:0] data;
        integer i;
        begin
            count_high_bits = 4'b0000;
            for (i = 0; i < 4; i = i + 1) begin
                if (data[i]) count_high_bits = count_high_bits + 1;
            end
        end
    endfunction

    // Final output
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            final_output <= 4'b0000;
        end else begin
            final_output <= count_high_bits(or_output);
        end
    end

endmodule