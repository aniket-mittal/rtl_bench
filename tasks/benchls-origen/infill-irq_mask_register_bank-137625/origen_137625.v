module origen_137625 (
    input wire [1:0] address,
    input wire chipselect,
    input wire clk,
    input wire in_port,
    input wire reset_n,
    input wire write_n,
    input wire [31:0] writedata,
    output reg irq,
    output reg [31:0] readdata
);

    reg [31:0] data [3:0];
    reg [3:0] irq_mask;

    [MASKED]

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            irq <= 1'b0;
        end else if (chipselect) begin
            irq <= (irq_mask[address] & in_port);
        end
    end

endmodule