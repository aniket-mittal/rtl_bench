module origen_053067 #(
    parameter CORE = 0,
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 8,
    parameter SCAN_CYCLES_MIN = 0,
    parameter SCAN_CYCLES_MAX = 1000
) (
    input wire clock,
    input wire reset,
    input wire readEnable,
    input wire [ADDR_WIDTH-1:0] readAddress,
    input wire writeEnable,
    input wire [ADDR_WIDTH-1:0] writeAddress,
    input wire [DATA_WIDTH-1:0] writeData,
    input wire scan,
    output reg [DATA_WIDTH-1:0] readData
);

    localparam MEMORY_DEPTH = 2**ADDR_WIDTH;

    reg [DATA_WIDTH-1:0] memory [0:MEMORY_DEPTH-1];
    reg [31:0] cycle_counter;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            cycle_counter <= 0;
        end else begin
            cycle_counter <= cycle_counter + 1;
        end
    end

    always @(posedge clock) begin
        if (writeEnable) begin
            memory[writeAddress] <= writeData;
        end
    end

    [MASKED]

    always @(posedge clock) begin
        if (scan && (cycle_counter >= SCAN_CYCLES_MIN) && (cycle_counter <= SCAN_CYCLES_MAX)) begin
            ;
        end
    end

endmodule