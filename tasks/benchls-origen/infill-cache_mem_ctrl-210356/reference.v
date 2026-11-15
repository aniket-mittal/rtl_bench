module origen_210356 #(
    parameter BOOT_MEM_PATH = ""
) (
    input  i_clk,
    input  i_rst,
    input  i_read_i,
    input  [31:0] i_addr_i,
    input  i_read_d,
    input  i_write_d,
    input  [3:0] i_byte_sel_d,
    input  [31:0] i_addr_d,
    input  [31:0] i_data_d,
    output [31:0] o_data_i,
    output [31:0] o_data_d
);

reg [31:0] data_i;
reg [31:0] data_d;
reg [7:0] cache_mem [0:255];

wire [31:0] data_i_wire;
wire [31:0] data_d_wire;

assign data_i_wire = {cache_mem[i_addr_i[9:2] * 4 + 3], cache_mem[i_addr_i[9:2] * 4 + 2], cache_mem[i_addr_i[9:2] * 4 + 1], cache_mem[i_addr_i[9:2] * 4]};
assign data_d_wire = {cache_mem[i_addr_d[9:2] * 4 + 3], cache_mem[i_addr_d[9:2] * 4 + 2], cache_mem[i_addr_d[9:2] * 4 + 1], cache_mem[i_addr_d[9:2] * 4]};

always @(posedge i_clk) begin
    if (i_rst) begin
        data_i <= 0;
        data_d <= 0;
    end
    else begin
        if (i_read_i) begin
            data_i <= data_i_wire;
        end
        if (i_read_d) begin
            data_d <= data_d_wire;
        end
        if (i_write_d) begin
            if (i_byte_sel_d[0]) cache_mem[i_addr_d[9:2] * 4] <= i_data_d[7:0];
            if (i_byte_sel_d[1]) cache_mem[i_addr_d[9:2] * 4 + 1] <= i_data_d[15:8];
            if (i_byte_sel_d[2]) cache_mem[i_addr_d[9:2] * 4 + 2] <= i_data_d[23:16];
            if (i_byte_sel_d[3]) cache_mem[i_addr_d[9:2] * 4 + 3] <= i_data_d[31:24];
        end
    end
end

initial begin
    if (BOOT_MEM_PATH != "") begin
        $readmemh(BOOT_MEM_PATH, cache_mem);
    end
end

assign o_data_i = data_i;
assign o_data_d = data_d;

endmodule