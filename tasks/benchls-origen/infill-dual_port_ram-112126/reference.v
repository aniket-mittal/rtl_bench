module origen_112126 #(
    parameter DATA_WIDTH = 32,
    parameter RAM_DEPTH = 8,
    parameter BASE_ADDR = 0,
    parameter RAM_FILE = ""
) (
    input wire clk,
    input wire n_rst,
    
    // Read port
    input wire i_ram_rd_en,
    input wire [$clog2(RAM_DEPTH)-1:0] i_ram_rd_addr,
    output reg [DATA_WIDTH-1:0] o_ram_rd_data,
    
    // Write port
    input wire i_ram_wr_en,
    input wire [(DATA_WIDTH/8)-1:0] i_ram_wr_byte_en,
    input wire [$clog2(RAM_DEPTH)-1:0] i_ram_wr_addr,
    input wire [DATA_WIDTH-1:0] i_ram_wr_data
);

    localparam ADDR_WIDTH = $clog2(RAM_DEPTH);
    localparam NUM_BYTES = DATA_WIDTH / 8;

    reg [7:0] ram [RAM_DEPTH*NUM_BYTES-1:0];

    integer i;
    
    initial begin
        if (RAM_FILE != "") begin
            $readmemh(RAM_FILE, ram);
        end
    end

    // Asynchronous read
    always @(*) begin
        if (n_rst && i_ram_rd_en) begin
            for (i = 0; i < NUM_BYTES; i = i + 1) begin
                o_ram_rd_data[i*8 +: 8] = ram[i_ram_rd_addr * NUM_BYTES + i];
            end
        end else begin
            o_ram_rd_data = {DATA_WIDTH{1'b0}};
        end
    end

    // Synchronous write
    always @(posedge clk) begin
        if (n_rst && i_ram_wr_en) begin
            for (i = 0; i < NUM_BYTES; i = i + 1) begin
                if (i_ram_wr_byte_en[i]) begin
                    ram[i_ram_wr_addr * NUM_BYTES + i] <= i_ram_wr_data[i*8 +: 8];
                end
            end
        end
    end

endmodule