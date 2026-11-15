module origen_100094 #(
    parameter USER_WIDTH = 8,
    parameter WAY_NUM = 4,
    parameter WAY_WIDTH = $clog2(WAY_NUM),
    parameter INDEX_WIDTH = 10
) (
    input wire clk,
    input wire rst_n,
    input wire cke,
    input wire clear_start,
    output reg clear_busy,
    input wire [USER_WIDTH-1:0] s_user,
    input wire [INDEX_WIDTH-1:0] s_index,
    input wire s_strb,
    input wire s_valid,
    output reg [USER_WIDTH-1:0] m_user,
    output reg [INDEX_WIDTH-1:0] m_index,
    output reg [WAY_WIDTH-1:0] m_way,
    output reg m_hit,
    output reg m_strb,
    output reg m_valid
);

    reg [WAY_NUM-1:0] reg_cache_valid;
    reg [INDEX_WIDTH-1:0] reg_cache_index [WAY_NUM-1:0];
    reg [WAY_WIDTH-1:0] reg_cache_way [WAY_NUM-1:0];

    wire [WAY_NUM-1:0] hit;
    wire [WAY_WIDTH-1:0] hit_position;

    integer i;

    // Generate hit signals
    genvar g;
    generate
        for (g = 0; g < WAY_NUM; g = g + 1) begin : gen_hit
            assign hit[g] = reg_cache_valid[g] && (reg_cache_index[g] == s_index);
        end
    endgenerate

    // Encode hit position
    assign hit_position = (hit[0]) ? 0 :
                          (hit[1]) ? 1 :
                          (hit[2]) ? 2 :
                          (hit[3]) ? 3 : 0;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            reg_cache_valid <= 0;
            for (i = 0; i < WAY_NUM; i = i + 1) begin
                reg_cache_way[i] <= WAY_NUM - 1 - i;
            end
            clear_busy <= 0;
            m_user <= 0;
            m_index <= 0;
            m_way <= 0;
            m_hit <= 0;
            m_strb <= 0;
            m_valid <= 0;
        end else if (cke) begin
            if (clear_start) begin
                reg_cache_valid <= 0;
                clear_busy <= 1;
            end else if (clear_busy) begin
                clear_busy <= 0;
            end else if (s_valid && s_strb) begin
                // Cache update
                if (|hit) begin
                    // Hit case
                    for (i = 0; i < WAY_NUM; i = i + 1) begin
                        if (i < hit_position) begin
                            reg_cache_way[i] <= reg_cache_way[i+1];
                        end else if (i == hit_position) begin
                            reg_cache_way[i] <= 0;
                        end
                    end
                end else begin
                    // Miss case
                    reg_cache_valid[reg_cache_way[WAY_NUM-1]] <= 1;
                    reg_cache_index[reg_cache_way[WAY_NUM-1]] <= s_index;
                    for (i = WAY_NUM-1; i > 0; i = i - 1) begin
                        reg_cache_way[i] <= reg_cache_way[i-1];
                    end
                    reg_cache_way[0] <= reg_cache_way[WAY_NUM-1];
                end

                // Output generation
                m_user <= s_user;
                m_index <= s_index;
                m_way <= (|hit) ? hit_position : reg_cache_way[WAY_NUM-1];
                m_hit <= |hit;
                m_strb <= 1;
                m_valid <= 1;
            end else begin
                m_strb <= 0;
                m_valid <= 0;
            end
        end
    end

endmodule