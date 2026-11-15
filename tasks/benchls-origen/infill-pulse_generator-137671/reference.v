module origen_137671 (
    input wire clk,
    input wire rst_n,
    input wire [7:0] preset_value,
    output wire pulse_out
);

    reg [7:0] counter;
    wire shift_out;

    // Counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 8'b0;
        end else if (counter == preset_value - 1) begin
            counter <= 8'b0;
        end else begin
            counter <= counter + 1'b1;
        end
    end

    // Shift Register
    shift_register #(
        .WIDTH(8)
    ) sr (
        .clk(clk),
        .rst_n(rst_n),
        .shift_in(1'b1),
        .shift_out(shift_out)
    );

    // Output pulse generation
    assign pulse_out = (counter == 8'b0) & shift_out;

endmodule

module shift_register #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    input wire shift_in,
    output wire shift_out
);

    reg [WIDTH-1:0] shift_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shift_reg <= {WIDTH{1'b0}};
        end else begin
            shift_reg <= {shift_reg[WIDTH-2:0], shift_in};
        end
    end

    assign shift_out = shift_reg[WIDTH-1];

endmodule