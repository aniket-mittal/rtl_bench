module origen_128875 (
    input wire clk,
    input wire rst_n,
    input wire [7:0] data_in,
    input wire in_valid,
    output wire in_ready,
    output wire [9:0] data_out,
    output wire out_valid,
    input wire out_ready
);

    reg [9:0] accumulator;
    reg [1:0] counter;
    reg [7:0] input_reg;
    reg out_valid_reg;
    reg in_ready_reg;

    wire accumulate;
    wire output_data;

    assign accumulate = in_valid && in_ready;
    assign output_data = (counter == 2'b11) && accumulate;
    assign in_ready = in_ready_reg;
    assign out_valid = out_valid_reg;
    assign data_out = accumulator;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            accumulator <= 10'b0;
            counter <= 2'b0;
            input_reg <= 8'b0;
            out_valid_reg <= 1'b0;
            in_ready_reg <= 1'b1;
        end else begin
            if (accumulate) begin
                input_reg <= data_in;
                accumulator <= (counter == 2'b00) ? {2'b00, data_in} : (accumulator + {2'b00, data_in});
                counter <= counter + 1'b1;
            end

            if (output_data) begin
                out_valid_reg <= 1'b1;
                in_ready_reg <= 1'b0;
            end

            if (out_valid && out_ready) begin
                out_valid_reg <= 1'b0;
                in_ready_reg <= 1'b1;
                accumulator <= 10'b0;
                counter <= 2'b0;
            end
        end
    end

endmodule