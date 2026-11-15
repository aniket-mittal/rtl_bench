module origen_046344
    #(
        parameter   USER_WIDTH  = 1,
        parameter   ADDR_WIDTH  = 32,
        parameter   TAG_WIDTH   = 4,
        parameter   TAG_NUM     = (1 << TAG_WIDTH)
    )
    (
        input   wire                        clk,
        input   wire                        reset,
        
        input   wire                        clear_start,
        output  wire                        clear_busy,
        
        input   wire    [USER_WIDTH-1:0]    s_user,
        input   wire                        s_enable,
        input   wire    [ADDR_WIDTH-1:0]    s_addr,
        input   wire                        s_valid,
        
        output  wire    [USER_WIDTH-1:0]    m_user,
        output  wire                        m_enable,
        output  wire    [ADDR_WIDTH-1:0]    m_addr,
        output  wire    [TAG_WIDTH-1:0]     m_tag,
        output  wire                        m_hit,
        output  wire                        m_valid
    );
    
    reg     [ADDR_WIDTH-1:0]    tag_addr    [0:TAG_NUM-1];
    reg                         tag_valid   [0:TAG_NUM-1];
    reg     [TAG_WIDTH-1:0]     clear_count;
    reg                         clear_busy_reg;
    
    wire    [TAG_NUM-1:0]       hit;
    reg     [TAG_WIDTH-1:0]     hit_tag;
    wire                        hit_any;
    
    integer i;
    
    // Clear operation
    always @(posedge clk) begin
        if (reset) begin
            clear_busy_reg <= 1'b0;
            clear_count <= TAG_NUM - 1;
        end
        else if (clear_start) begin
            clear_busy_reg <= 1'b1;
            clear_count <= TAG_NUM - 1;
        end
        else if (clear_busy_reg) begin
            if (clear_count == 0) begin
                clear_busy_reg <= 1'b0;
            end
            else begin
                clear_count <= clear_count - 1;
            end
        end
    end
    
    // Tag comparison and update
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < TAG_NUM; i = i + 1) begin
                tag_valid[i] <= 1'b0;
            end
        end
        else if (clear_busy_reg) begin
            tag_valid[clear_count] <= 1'b0;
        end
        else if (s_enable && s_valid) begin
            if (hit_any) begin
                // Move hit tag to front
                for (i = TAG_NUM-1; i > 0; i = i - 1) begin
                    if (i > hit_tag) begin
                        tag_addr[i] <= tag_addr[i-1];
                        tag_valid[i] <= tag_valid[i-1];
                    end
                    else if (i == hit_tag) begin
                        tag_addr[0] <= tag_addr[i];
                        tag_valid[0] <= 1'b1;
                    end
                end
            end
            else begin
                // Shift tags and insert new one at front
                for (i = TAG_NUM-1; i > 0; i = i - 1) begin
                    tag_addr[i] <= tag_addr[i-1];
                    tag_valid[i] <= tag_valid[i-1];
                end
                tag_addr[0] <= s_addr;
                tag_valid[0] <= 1'b1;
            end
        end
    end
    
    // Hit detection
    genvar j;
    generate
        for (j = 0; j < TAG_NUM; j = j + 1) begin : hit_gen
            assign hit[j] = tag_valid[j] && (tag_addr[j] == s_addr);
        end
    endgenerate
    
    assign hit_any = |hit;
    
    // Priority encoder for hit tag
    integer k;
    always @(*) begin
        hit_tag = 0;
        for (k = TAG_NUM-1; k >= 0; k = k - 1) begin
            if (hit[k]) hit_tag = k[TAG_WIDTH-1:0];
        end
    end
    
    // Output assignments
    assign clear_busy = clear_busy_reg;
    assign m_user = s_user;
    assign m_enable = s_enable;
    assign m_addr = tag_addr[0];
    assign m_tag = hit_any ? hit_tag : 0;
    assign m_hit = hit_any;
    assign m_valid = s_valid;
    
endmodule