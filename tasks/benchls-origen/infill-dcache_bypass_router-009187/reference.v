module origen_009187 (
    input wire no_dcache,
    
    // CPU interface
    input wire cpu_req,
    input wire cpu_we,
    input wire [1:0] cpu_size,
    input wire [31:0] cpu_addr,
    input wire [31:0] cpu_wdata,
    output wire [31:0] cpu_rdata,
    output wire cpu_addr_ack,
    output wire cpu_data_ack,
    
    // RAM interface
    output wire ram_req,
    output wire ram_we,
    output wire [1:0] ram_size,
    output wire [31:0] ram_addr,
    output wire [31:0] ram_wdata,
    input wire [31:0] ram_rdata,
    input wire ram_addr_ack,
    input wire ram_data_ack,
    
    // Configuration interface
    output wire cfg_req,
    output wire cfg_we,
    output wire [1:0] cfg_size,
    output wire [31:0] cfg_addr,
    output wire [31:0] cfg_wdata,
    input wire [31:0] cfg_rdata,
    input wire cfg_addr_ack,
    input wire cfg_data_ack
);

    // RAM interface connections
    assign ram_req = no_dcache ? 1'b0 : cpu_req;
    assign ram_we = no_dcache ? 1'b0 : cpu_we;
    assign ram_size = no_dcache ? 2'b00 : cpu_size;
    assign ram_addr = no_dcache ? 32'b0 : cpu_addr;
    assign ram_wdata = no_dcache ? 32'b0 : cpu_wdata;

    // Configuration interface connections
    assign cfg_req = no_dcache ? cpu_req : 1'b0;
    assign cfg_we = no_dcache ? cpu_we : 1'b0;
    assign cfg_size = no_dcache ? cpu_size : 2'b00;
    assign cfg_addr = no_dcache ? cpu_addr : 32'b0;
    assign cfg_wdata = no_dcache ? cpu_wdata : 32'b0;

    // CPU interface connections
    assign cpu_rdata = no_dcache ? cfg_rdata : ram_rdata;
    assign cpu_addr_ack = no_dcache ? cfg_addr_ack : ram_addr_ack;
    assign cpu_data_ack = no_dcache ? cfg_data_ack : ram_data_ack;

endmodule