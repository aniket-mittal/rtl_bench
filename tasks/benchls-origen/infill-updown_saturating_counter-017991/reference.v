module origen_017991 #(
    parameter WIDTH = 20
) (
    input wire reset_i,
    input wire clear_i,
    input wire fpga_clk_i,
    input wire [1:0] count_instr_i,
    output wire signed [WIDTH-1:0] counter_val_o
);

    // Counter operation modes
    localparam [1:0] DISABLE = 2'b00;
    localparam [1:0] COUNT_UP = 2'b01;
    localparam [1:0] COUNT_DOWN = 2'b10;

    // Counter limits
    localparam [WIDTH-1:0] MAXVAL = {1'b0, {WIDTH-1{1'b1}}};
    localparam [WIDTH-1:0] MINVAL = {1'b1, 1'b0, {WIDTH-2{1'b0}}};

    // Internal registers
    reg signed [WIDTH-1:0] count_r;
    reg signed [WIDTH-1:0] next_count_r;
    reg signed [WIDTH-1:0] count_inc_r;

    // Counter logic
    always @(*) begin
        case (count_instr_i)
            DISABLE: count_inc_r = 'd0;
            COUNT_UP: count_inc_r = 'd1;
            COUNT_DOWN: count_inc_r = {WIDTH{1'b1}}; // -1 in 2's complement
            default: count_inc_r = 'd0;
        endcase

        next_count_r = count_r + count_inc_r;

        // Overflow/Underflow protection
        if (count_r == MAXVAL && count_instr_i == COUNT_UP) begin
            next_count_r = MAXVAL;
        end else if (count_r == MINVAL && count_instr_i == COUNT_DOWN) begin
            next_count_r = MINVAL;
        end
    end

    // Synchronous logic
    always @(posedge fpga_clk_i or posedge reset_i) begin
        if (reset_i) begin
            count_r <= 'd0;
        end else if (clear_i) begin
            count_r <= 'd0;
        end else begin
            count_r <= next_count_r;
        end
    end

    // Output assignment
    assign counter_val_o = count_r;

endmodule