module origen_086337 #(
    parameter ADDR_WIDTH = 9,
    parameter DATA_WIDTH = 32,
    parameter DATA_BYTES = DATA_WIDTH / 8
) (
    input wire clk,
    input wire reset,
    input wire [DATA_BYTES-1:0] we_a,
    input wire [ADDR_WIDTH-1:0] addr_a,
    input wire [DATA_WIDTH-1:0] wdata_a,
    output reg [DATA_WIDTH-1:0] rdata_a,
    input wire [ADDR_WIDTH-1:0] addr_b,
    output reg [DATA_WIDTH-1:0] rdata_b
);

    // Memory array
    reg [DATA_WIDTH-1:0] mem [0:(2**ADDR_WIDTH)-1];

    integer i;

    // Port A: Read-Write
    always @(posedge clk) begin
        if (reset) begin
            rdata_a <= {DATA_WIDTH{1'b0}};
        end else begin
            rdata_a <= mem[addr_a];
            for (i = 0; i < DATA_BYTES; i = i + 1) begin
                if (we_a[i]) begin
                    mem[addr_a][i*8 +: 8] <= wdata_a[i*8 +: 8];
                end
            end
        end
    end

    // Port B: Read-Only
    always @(posedge clk) begin
        if (reset) begin
            rdata_b <= {DATA_WIDTH{1'b0}};
        end else begin
            rdata_b <= mem[addr_b];
        end
    end

    // Simulation support for Icarus Verilog
    `ifdef ICARUS
    genvar j;
    generate
        for (j = 0; j < 2**ADDR_WIDTH; j = j + 1) begin : gen_mem
            wire [DATA_WIDTH-1:0] mem_array;
            assign mem_array = mem[j];
        end
    endgenerate
    `endif

endmodule