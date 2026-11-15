module origen_007959 #(
    parameter p_paths = 2
) (
    input wire i_clk,
    input wire i_rst,
    
    input wire [p_paths-1:0][31:0] ar_dma_write_addr,
    input wire [p_paths-1:0][9:0] ar_dma_write_len,
    input wire [p_paths-1:0] ar_dma_write_pending,
    input wire [p_paths-1:0][127:0] ar_dma_write_data,
    input wire [p_paths-1:0] ar_dma_write_data_valid,
    
    output reg [p_paths-1:0] ar_dma_write_done,
    output reg [p_paths-1:0] ar_dma_write_data_ready,
    
    output reg [31:0] dma_write_addr,
    output reg [9:0] dma_write_len,
    output reg dma_write_pending,
    output reg dma_write_data_valid,
    output reg [127:0] dma_write_data,
    
    input wire dma_write_done,
    input wire dma_write_data_ready
);

    localparam IDLE = 2'b00;
    localparam ACTIVE = 2'b01;

    reg [1:0] r_state;
    reg [p_paths-1:0] r_last_path_mask;
    reg [$clog2(p_paths)-1:0] r_active_path;
    reg [9:0] r_cycle_count;

    always @(posedge i_clk or posedge i_rst) begin
        if (i_rst) begin
            r_state <= IDLE;
            r_last_path_mask <= {p_paths{1'b1}};
            r_active_path <= 0;
            r_cycle_count <= 0;
            ar_dma_write_done <= {p_paths{1'b0}};
            ar_dma_write_data_ready <= {p_paths{1'b0}};
            dma_write_addr <= 32'b0;
            dma_write_len <= 10'b0;
            dma_write_pending <= 1'b0;
            dma_write_data_valid <= 1'b0;
            dma_write_data <= 128'b0;
        end else begin
            case (r_state)
                IDLE: begin
                    if (|ar_dma_write_pending) begin
                        r_state <= ACTIVE;
                        r_active_path <= get_next_path(ar_dma_write_pending & r_last_path_mask);
                        r_cycle_count <= 0;
                    end
                end
                
                ACTIVE: begin
                    if (dma_write_done && r_cycle_count == ar_dma_write_len[r_active_path]) begin
                        ar_dma_write_done[r_active_path] <= 1'b1;
                        r_last_path_mask[r_active_path] <= 1'b0;
                        
                        if (|(ar_dma_write_pending & ~(1 << r_active_path))) begin
                            r_active_path <= get_next_path(ar_dma_write_pending & ~(1 << r_active_path));
                            r_cycle_count <= 0;
                        end else begin
                            r_state <= IDLE;
                            r_last_path_mask <= {p_paths{1'b1}};
                        end
                    end else if (dma_write_data_ready) begin
                        r_cycle_count <= r_cycle_count + 1;
                    end
                end
            endcase
        end
    end

    genvar i;
    generate
        for (i = 0; i < p_paths; i = i + 1) begin : path_select
            always @(*) begin
                if (r_active_path == i && r_state == ACTIVE) begin
                    dma_write_addr = ar_dma_write_addr[i];
                    dma_write_len = ar_dma_write_len[i];
                    dma_write_pending = ar_dma_write_pending[i];
                    dma_write_data_valid = ar_dma_write_data_valid[i];
                    dma_write_data = ar_dma_write_data[i];
                    ar_dma_write_data_ready[i] = dma_write_data_ready;
                end else begin
                    ar_dma_write_data_ready[i] = 1'b0;
                end
            end
        end
    endgenerate

    function [$clog2(p_paths)-1:0] get_next_path;
        input [p_paths-1:0] pending_paths;
        integer j;
        reg found;
        begin
            get_next_path = 0;
            found = 0;
            for (j = 0; j < p_paths; j = j + 1) begin
                if (pending_paths[j] && !found) begin
                    get_next_path = j;
                    found = 1;
                end
            end
        end
    endfunction

endmodule