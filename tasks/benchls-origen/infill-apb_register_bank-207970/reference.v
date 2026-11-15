module origen_207970 #(
    parameter ADDR_BITS = 8,
    parameter DATA_BITS = 32,
    parameter RW_SIZE = 64,
    parameter RO_SIZE = 32,
    parameter RW_RESET_VAL = 0
)(
    input wire clk,
    input wire rst,
    output wire [RW_SIZE*DATA_BITS-1:0] mem_rw_values,
    input wire [RO_SIZE*DATA_BITS-1:0] mem_ro_values,
    input wire [ADDR_BITS-1:0] PADDR,
    input wire PSEL,
    input wire PENABLE,
    input wire PWRITE,
    input wire [DATA_BITS-1:0] PWDATA,
    output reg [DATA_BITS-1:0] PRDATA
);

localparam TOTAL_SIZE = RW_SIZE + RO_SIZE;
reg [DATA_BITS-1:0] mem [TOTAL_SIZE-1:0];

initial begin
    for (int i = 0; i < RW_SIZE; i++) begin
        mem[i] = RW_RESET_VAL;
    end
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        for (int i = 0; i < RW_SIZE; i++) begin
            mem[i] = RW_RESET_VAL;
        end
    end
    else if (PSEL && PENABLE) begin
        if (PWRITE && PADDR < RW_SIZE) begin
            mem[PADDR] <= PWDATA;
        end
        PRDATA <= (PADDR < TOTAL_SIZE) ? mem[PADDR] : 0;
    end
end

genvar i;
generate
    for (i = 0; i < RW_SIZE; i++) begin
        assign mem_rw_values[(i+1)*DATA_BITS-1:i*DATA_BITS] = mem[i];
    end
    for (i = 0; i < RO_SIZE; i++) begin
        assign mem_ro_values[(i+1)*DATA_BITS-1:i*DATA_BITS] = mem[RW_SIZE + i];
    end
endgenerate

endmodule