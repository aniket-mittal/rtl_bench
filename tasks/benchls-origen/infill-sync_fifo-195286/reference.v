module origen_195286 #(
    parameter MEM_DEPTH = 16,
    parameter DATA_WIDTH = 8
) (
    // Clock and Reset Signals
    input                  in_clk,
    input                  out_clk,
    input                  rst,

    // Status Signals
    output                 full,
    output                 empty,

    // Input Data and Control Signals
    input      [DATA_WIDTH-1:0] i_in_data,
    input                       i_in_stb,

    // Output Data and Control Signals
    output reg [DATA_WIDTH-1:0] o_out_data,
    input                       i_out_stb
);

    localparam MEM_SIZE = 2 ** $clog2(MEM_DEPTH);

    // FIFO Memory
    reg [DATA_WIDTH-1:0] mem [0:MEM_SIZE-1];

    // FIFO Pointers
    reg [$clog2(MEM_SIZE)-1:0] r_in_pointer;
    reg [$clog2(MEM_SIZE)-1:0] r_out_pointer;

    // FIFO Status Signals
    wire w_empty;
    assign empty = w_empty;
    assign full = (r_in_pointer == r_out_pointer) && !w_empty;

    // Write Logic
    always @(posedge in_clk or posedge rst) begin
        if (rst) begin
            r_in_pointer <= 0;
        end else if (i_in_stb && !full) begin
            mem[r_in_pointer] <= i_in_data;
            r_in_pointer <= r_in_pointer + 1;
        end
    end

    // Read Logic
    always @(posedge out_clk or posedge rst) begin
        if (rst) begin
            r_out_pointer <= 0;
        end else if (i_out_stb && !w_empty) begin
            r_out_pointer <= r_out_pointer + 1;
        end
    end

    // Output Data Assignment
    assign o_out_data = mem[r_out_pointer];

    // Empty Condition
    assign w_empty = (r_in_pointer == r_out_pointer);

endmodule