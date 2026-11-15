module origen_175678(
    input HCLK,
    input HRESETn,
    input [31:0] HADDR,
    input [1:0] HTRANS,
    input HWRITE,
    input [2:0] HSIZE,
    input [2:0] HBURST,
    input [3:0] HPROT,
    input HREADY,
    input ACTIVE_Decoder,
    input HREADYOUT_Decoder,
    input [1:0] HRESP_Decoder,
    output reg HREADYOUT,
    output reg [1:0] HRESP,
    output reg [31:0] HADDR_Inputstage,
    output reg [1:0] HTRANS_Inputstage,
    output reg HWRITE_Inputstage,
    output reg [2:0] HSIZE_Inputstage,
    output reg [2:0] HBURST_Inputstage,
    output reg [3:0] HPROT_Inputstage,
    output reg TRANS_HOLD
);

    reg trans_req;
    reg trans_valid;
    reg [31:0] addr_reg;
    reg write_reg;
    reg [2:0] size_reg;
    reg [2:0] burst_reg;
    reg [3:0] prot_reg;
    reg trans_state;
    reg trans_pend;

    always @(posedge HCLK or negedge HRESETn) begin
        if (~HRESETn) begin
            trans_req <= 1'b0;
            trans_valid <= 1'b0;
            addr_reg <= 32'b0;
            write_reg <= 1'b0;
            size_reg <= 3'b0;
            burst_reg <= 3'b0;
            prot_reg <= 4'b0;
            trans_state <= 1'b0;
            trans_pend <= 1'b0;
        end else begin
            // Generate trans_req and trans_valid signals
            trans_req <= (HTRANS != 2'b0);
            trans_valid <= trans_req & HREADY;

            // Store transaction-related signals
            if (trans_valid) begin
                addr_reg <= HADDR;
                write_reg <= HWRITE;
                size_reg <= HSIZE;
                burst_reg <= HBURST;
                prot_reg <= HPROT;
            end

            // Update transaction state
            if (trans_valid) begin
                trans_state <= 1'b1;
            end else if (ACTIVE_Decoder & HREADYOUT_Decoder) begin
                trans_state <= 1'b0;
            end

            // Update transaction pending flag
            if (trans_valid) begin
                trans_pend <= 1'b1;
            end else if (ACTIVE_Decoder & HREADYOUT_Decoder) begin
                trans_pend <= 1'b0;
            end
        end
    end

    // Generate output signals
    assign TRANS_HOLD = trans_valid & trans_pend;
    assign HADDR_Inputstage = addr_reg;
    assign HTRANS_Inputstage = trans_req ? HTRANS : 2'b0;
    assign HWRITE_Inputstage = write_reg;
    assign HSIZE_Inputstage = size_reg;
    assign HBURST_Inputstage = burst_reg;
    assign HPROT_Inputstage = prot_reg;

    always @(*) begin
        if (trans_state) begin
            HREADYOUT = ACTIVE_Decoder & HREADYOUT_Decoder;
            HRESP = HRESP_Decoder;
        end else begin
            HREADYOUT = 1'b1;
            HRESP = 2'b0;
        end
    end

endmodule