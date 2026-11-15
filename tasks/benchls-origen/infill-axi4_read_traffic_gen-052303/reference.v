module origen_052303
        #(
            parameter   SEED_RAND   = 0,
            
            parameter   AXI4_ID_WIDTH    = 6,
            parameter   AXI4_ADDR_WIDTH  = 32,
            parameter   AXI4_DATA_WIDTH  = 64,
            parameter   AXI4_STRB_WIDTH  = (AXI4_DATA_WIDTH / 8),
            parameter   AXI4_LEN_WIDTH   = 8,
            parameter   AXI4_QOS_WIDTH   = 4,
            
            parameter   ARID        = {AXI4_ID_WIDTH{1'b0}},
            parameter   ARSIZE      = $clog2(AXI4_STRB_WIDTH),
            parameter   ARBURST     = 2'b01,
            parameter   ARLOCK      = 1'b0,
            parameter   ARCACHE     = 4'b0001,
            parameter   ARPROT      = 3'b000,
            parameter   ARQOS       = {AXI4_QOS_WIDTH{1'b0}},
            parameter   ARREGION    = 4'b0000,
            parameter   ARUSER      = 1'b0,
            
            parameter   RATE_AR     = 50,
            parameter   RATE_R      = 50
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            
            output  wire    [AXI4_ID_WIDTH-1:0]     arid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]   araddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]    arlen,
            output  wire    [2:0]                   arsize,
            output  wire    [1:0]                   arburst,
            output  wire                            arlock,
            output  wire    [3:0]                   arcache,
            output  wire    [2:0]                   arprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]    arqos,
            output  wire    [3:0]                   arregion,
            output  wire                            aruser,
            output  reg                             arvalid,
            input   wire                            arready,
            
            input   wire    [AXI4_ID_WIDTH-1:0]     rid,
            input   wire    [AXI4_DATA_WIDTH-1:0]   rdata,
            input   wire    [1:0]                   rresp,
            input   wire                            rlast,
            input   wire                            ruser,
            input   wire                            rvalid,
            output  reg                             rready
        );
    
    reg     [31:0]      rand_seed;
    
    initial begin
        rand_seed = SEED_RAND;
    end
    
    function [31:0] get_random;
        input [31:0] seed;
    begin
        get_random = {seed[2:0], seed[31:3]} ^ (seed + seed[31:28] + 32'h12345678);
    end
    endfunction
    
    reg     [AXI4_LEN_WIDTH-1:0]    reg_arlen;
    reg                             reg_arvalid;
    reg                             reg_rready;
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            rand_seed   <= SEED_RAND;
            reg_arlen   <= {AXI4_LEN_WIDTH{1'b0}};
            reg_arvalid <= 1'b0;
            reg_rready  <= 1'b0;
        end
        else begin
            rand_seed <= get_random(rand_seed);
            
            // AR
            if ( !reg_arvalid || arready ) begin
                reg_arvalid <= (rand_seed[7:0] < ((RATE_AR*256)/100));
                reg_arlen   <= rand_seed[AXI4_LEN_WIDTH-1:0];
            end
            
            // R
            reg_rready <= (rand_seed[15:8] < ((RATE_R*256)/100));
        end
    end
    
    assign arid     = ARID;
    assign araddr   = {AXI4_ADDR_WIDTH{1'b0}};
    assign arlen    = reg_arlen;
    assign arsize   = ARSIZE;
    assign arburst  = ARBURST;
    assign arlock   = ARLOCK;
    assign arcache  = ARCACHE;
    assign arprot   = ARPROT;
    assign arqos    = ARQOS;
    assign arregion = ARREGION;
    assign aruser   = ARUSER;
    
    always @* begin
        arvalid = reg_arvalid;
        rready  = reg_rready;
    end
    
endmodule