module origen_117907 #(
    parameter DEPTH = 4,
    parameter WIDTH = 8,
    parameter ALMOST_FULL = 2
) (
    input wire clk,
    input wire reset,
    input wire valid_i,
    input wire ready_o,
    input wire [WIDTH-1:0] data_i,
    output wire ready_i,
    output reg valid_o,
    output reg [WIDTH-1:0] data_o
);

    localparam FIFO_SIZE = 1 << DEPTH;

    reg [WIDTH-1:0] data [0:FIFO_SIZE-1];
    reg [DEPTH-1:0] ptr_i, ptr_o;
    reg [DEPTH:0] fill;

    assign ready_i = (fill < FIFO_SIZE);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ptr_i <= 0;
            ptr_o <= 0;
            fill <= 0;
            valid_o <= 0;
            data_o <= 0;
        end else begin
            // Write operation
            if (valid_i && ready_i) begin
                data[ptr_i] <= data_i;
                ptr_i <= ptr_i + 1;
                fill <= fill + 1;
            end

            // Read operation
            if (valid_o && ready_o) begin
                ptr_o <= ptr_o + 1;
                fill <= fill - 1;
            end

            // Update output
            if (fill > 0) begin
                valid_o <= 1;
                data_o <= data[ptr_o];
            end else begin
                valid_o <= 0;
            end
        end
    end

endmodule