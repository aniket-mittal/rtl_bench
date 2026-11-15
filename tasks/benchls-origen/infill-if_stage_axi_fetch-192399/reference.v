module origen_192399(
    input           clk,
    input           rst,
    input           DSI_ID,
    input           IRWrite,
    input   [31:0]  PC_buffer,
    input           PC_AdEL,
    input           PC_abnormal,
    input   [31:0]  inst_sram_rdata,
    input           do_load,
    input           data_req,
    input           decode_allowin,

    output  [31:0]  PC_IF_ID,
    output  [31:0]  PC_add_4_IF_ID,
    output  [31:0]  IR_IF_ID,
    output          PC_AdEL_IF_ID,
    output          DSI_IF_ID,
    output          PC_fresh,

    output          fetch_axi_ar_valid,
    input           fetch_axi_ar_ready,
    output  [31:0]  fetch_axi_ar_addr,
    output  [7:0]   fetch_axi_ar_len,
    output  [2:0]   fetch_axi_ar_size,
    output  [1:0]   fetch_axi_ar_burst,
    output  [3:0]   fetch_axi_ar_cache,
    output  [2:0]   fetch_axi_ar_prot,

    input           fetch_axi_r_valid,
    output          fetch_axi_r_ready,
    input   [31:0]  fetch_axi_r_data,
    input           fetch_axi_r_last,

    output          data_rdata_ok
);

    reg     [31:0]  IR_buffer;
    reg     [31:0]  PC_IF_ID_reg;
    reg     [31:0]  PC_add_4_IF_ID_reg;
    reg             PC_AdEL_IF_ID_reg;
    reg             DSI_IF_ID_reg;
    reg             PC_fresh_reg;

    wire            fetch_axi_ar_valid_wire;
    wire    [31:0]  fetch_axi_ar_addr_wire;
    wire    [7:0]   fetch_axi_ar_len_wire;
    wire    [2:0]   fetch_axi_ar_size_wire;
    wire    [1:0]   fetch_axi_ar_burst_wire;
    wire    [3:0]   fetch_axi_ar_cache_wire;
    wire    [2:0]   fetch_axi_ar_prot_wire;

    wire            fetch_axi_r_ready_wire;

    // Instruction Fetch and Buffering
    assign fetch_axi_ar_valid = fetch_axi_ar_valid_wire;
    assign fetch_axi_ar_addr = fetch_axi_ar_addr_wire;
    assign fetch_axi_ar_len = fetch_axi_ar_len_wire;
    assign fetch_axi_ar_size = fetch_axi_ar_size_wire;
    assign fetch_axi_ar_burst = fetch_axi_ar_burst_wire;
    assign fetch_axi_ar_cache = fetch_axi_ar_cache_wire;
    assign fetch_axi_ar_prot = fetch_axi_ar_prot_wire;

    assign fetch_axi_r_ready = fetch_axi_r_ready_wire;

    // Program Counter (PC) Management
    assign PC_IF_ID = PC_IF_ID_reg;
    assign PC_add_4_IF_ID = PC_add_4_IF_ID_reg;
    assign PC_AdEL_IF_ID = PC_AdEL_IF_ID_reg;
    assign DSI_IF_ID = DSI_IF_ID_reg;
    assign PC_fresh = PC_fresh_reg;
    assign IR_IF_ID = IR_buffer;  // Assign the value of IR_buffer to the output port IR_IF_ID

    // Instruction and Data Hazard Handling
    always @(posedge clk) begin
        if (rst) begin
            IR_buffer <= 0;
            PC_IF_ID_reg <= 0;
            PC_add_4_IF_ID_reg <= 0;
            PC_AdEL_IF_ID_reg <= 0;
            DSI_IF_ID_reg <= 0;
            PC_fresh_reg <= 0;
        end else begin
            if (decode_allowin) begin
                PC_IF_ID_reg <= PC_buffer;
                PC_add_4_IF_ID_reg <= PC_buffer + 32'h4;
                PC_AdEL_IF_ID_reg <= PC_AdEL;
                DSI_IF_ID_reg <= DSI_ID;
                PC_fresh_reg <= 1;
            end else begin
                PC_fresh_reg <= 0;
            end

            if (fetch_axi_r_valid && fetch_axi_r_ready_wire) begin
                IR_buffer <= fetch_axi_r_data;
            end
        end
    end

    // AXI Interface Logic
    assign fetch_axi_ar_valid_wire = !decode_allowin;
    assign fetch_axi_ar_addr_wire = PC_buffer;
    assign fetch_axi_ar_len_wire = 8'h0;
    assign fetch_axi_ar_size_wire = 3'h2;
    assign fetch_axi_ar_burst_wire = 2'h1;
    assign fetch_axi_ar_cache_wire = 4'h0;
    assign fetch_axi_ar_prot_wire = 3'h0;

    assign fetch_axi_r_ready_wire = 1'b1;

    assign data_rdata_ok = fetch_axi_r_valid && fetch_axi_r_last;
endmodule