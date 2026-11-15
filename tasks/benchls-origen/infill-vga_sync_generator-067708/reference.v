module origen_067708 (
    input wire clock,
    input wire resetn,
    output reg hsync,
    output reg vsync,
    output reg enable,
    input wire [11:0] rd_fifo_cnt,
    input wire [11:0] H_PIXELS,
    input wire [11:0] H_SYNCSTART,
    input wire [11:0] H_SYNCEND,
    input wire [11:0] H_PERIOD,
    input wire [11:0] V_LINES,
    input wire [11:0] V_SYNCSTART,
    input wire [11:0] V_SYNCEND,
    input wire [11:0] V_PERIOD
);

    reg [11:0] hcnt;
    reg [11:0] vcnt;
    reg hsyncint;
    reg vsyncint;
    reg vsvalid;
    reg de_valid;

    // Horizontal counter
    always @(posedge clock or negedge resetn) begin
        if (!resetn)
            hcnt <= 12'd0;
        else if (hcnt == H_PERIOD - 1)
            hcnt <= 12'd0;
        else
            hcnt <= hcnt + 1'b1;
    end

    // Horizontal sync
    always @(posedge clock or negedge resetn) begin
        if (!resetn)
            hsyncint <= 1'b0;
        else
            hsyncint <= (hcnt >= H_SYNCSTART && hcnt < H_SYNCEND);
    end

    // Vertical counter
    always @(posedge clock or negedge resetn) begin
        if (!resetn)
            vcnt <= 12'd0;
        else if (hcnt == H_PERIOD - 1) begin
            if (vcnt == V_PERIOD - 1)
                vcnt <= 12'd0;
            else
                vcnt <= vcnt + 1'b1;
        end
    end

    // Vertical sync
    always @(posedge clock or negedge resetn) begin
        if (!resetn)
            vsyncint <= 1'b0;
        else
            vsyncint <= (vcnt >= V_SYNCSTART && vcnt < V_SYNCEND);
    end

    // Vertical valid signal
    always @(posedge clock or negedge resetn) begin
        if (!resetn)
            vsvalid <= 1'b0;
        else
            vsvalid <= (vcnt >= V_LINES && vcnt < V_PERIOD);
    end

    // Data enable signal
    always @(posedge clock or negedge resetn) begin
        if (!resetn)
            enable <= 1'b0;
        else
            enable <= (hcnt >= H_PIXELS && hcnt < H_PERIOD) && vsvalid;
    end

    // FIFO validation
    always @(posedge clock or negedge resetn) begin
        if (!resetn)
            de_valid <= 1'b0;
        else
            de_valid <= vsync && (rd_fifo_cnt >= 12'd4096);
    end

    // Output assignments
    always @(posedge clock or negedge resetn) begin
        if (!resetn) begin
            hsync <= 1'b0;
            vsync <= 1'b0;
        end else begin
            hsync <= hsyncint;
            vsync <= vsyncint;
        end
    end

endmodule