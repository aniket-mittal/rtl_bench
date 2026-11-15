module origen_206968 (
    input clk,
    input penable,
    input reset,
    input stalled,
    input [31:0] din,
    input [4:0] shift,
    input dir,
    input set,
    input do_shift,
    output reg [31:0] dout,
    output [5:0] shift_count
);

reg [31:0] shift_reg;
reg [5:0] count;
reg [63:0] shift64;
reg [4:0] shift_val;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        shift_reg <= 0;
        count <= 32;
    end
    else if (penable && !stalled) begin
        if (set) begin
            shift_reg <= din;
            count <= 0;
        end
        else if (do_shift) begin
            if (shift == 0)
                shift_val = 32;
            else
                shift_val = shift;

            if (dir)
                shift64 = {shift_reg, 32'b0} >> shift_val;
            else
                shift64 = {32'b0, shift_reg} << shift_val;

            shift_reg <= shift64[31:0];
            count <= 32 - shift_val;
        end
    end
end

always @(*) begin
    if (do_shift)
        dout = shift64[31:0];
    else
        dout = shift_reg;
end

assign shift_count = count;

endmodule