module origen_129029 (
    input wire i_clk,
    input wire i_rst,
    input wire i_new_pc,
    input wire i_clear_cache,
    input wire i_stall_n,
    input wire [31:0] i_pc,
    input wire i_wb_ack,
    input wire i_wb_stall,
    input wire i_wb_err,
    input wire [31:0] i_wb_data,
    
    output reg [31:0] o_i,
    output reg [31:0] o_pc,
    output reg o_v,
    output reg o_wb_cyc,
    output reg o_wb_stb,
    output reg o_wb_we,
    output reg [31:0] o_wb_addr,
    output reg [31:0] o_wb_data,
    output reg o_illegal
);

    // Cache lines
    reg [31:0] cache_line0;
    reg [31:0] cache_line1;
    reg [31:0] cache_tag0;
    reg [31:0] cache_tag1;
    reg valid0;
    reg valid1;

    // Cache state
    reg [1:0] state;
    localparam IDLE = 2'b00;
    localparam FETCH = 2'b01;
    localparam WRITE = 2'b10;

    // Cache control signals
    reg cache_hit;
    reg [31:0] selected_line;
    reg [31:0] selected_tag;
    reg selected_valid;

    always @(posedge i_clk or posedge i_rst) begin
        if (i_rst) begin
            state <= IDLE;
            cache_line0 <= 32'b0;
            cache_line1 <= 32'b0;
            cache_tag0 <= 32'b0;
            cache_tag1 <= 32'b0;
            valid0 <= 1'b0;
            valid1 <= 1'b0;
            o_i <= 32'b0;
            o_pc <= 32'b0;
            o_v <= 1'b0;
            o_wb_cyc <= 1'b0;
            o_wb_stb <= 1'b0;
            o_wb_we <= 1'b0;
            o_wb_addr <= 32'b0;
            o_wb_data <= 32'b0;
            o_illegal <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (i_clear_cache) begin
                        valid0 <= 1'b0;
                        valid1 <= 1'b0;
                    end else if (i_new_pc && i_stall_n) begin
                        o_pc <= i_pc;
                        cache_hit <= (i_pc[31:1] == cache_tag0[31:1] && valid0) || 
                                     (i_pc[31:1] == cache_tag1[31:1] && valid1);
                        selected_line <= (i_pc[31:1] == cache_tag0[31:1]) ? cache_line0 : cache_line1;
                        selected_tag <= (i_pc[31:1] == cache_tag0[31:1]) ? cache_tag0 : cache_tag1;
                        selected_valid <= (i_pc[31:1] == cache_tag0[31:1]) ? valid0 : valid1;
                        
                        if (cache_hit) begin
                            o_i <= selected_line;
                            o_v <= 1'b1;
                        end else begin
                            state <= FETCH;
                            o_wb_cyc <= 1'b1;
                            o_wb_stb <= 1'b1;
                            o_wb_we <= 1'b0;
                            o_wb_addr <= i_pc;
                        end
                    end
                end
                
                FETCH: begin
                    if (i_wb_ack && !i_wb_stall) begin
                        if (i_wb_err) begin
                            o_illegal <= 1'b1;
                            state <= IDLE;
                        end else begin
                            if (i_pc[1]) begin
                                cache_line1 <= i_wb_data;
                                cache_tag1 <= i_pc;
                                valid1 <= 1'b1;
                            end else begin
                                cache_line0 <= i_wb_data;
                                cache_tag0 <= i_pc;
                                valid0 <= 1'b1;
                            end
                            o_i <= i_wb_data;
                            o_v <= 1'b1;
                            state <= IDLE;
                            o_wb_cyc <= 1'b0;
                            o_wb_stb <= 1'b0;
                        end
                    end
                end
                
                default: state <= IDLE;
            endcase
        end
    end

endmodule