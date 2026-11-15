module origen_132111 (
    input wire mem_clk,
    input wire hreset_n,
    input wire crt_req,
    input wire cpu_rd_req,
    input wire cpu_wr_req,
    input wire a_empty,
    input wire b_empty,
    input wire a_full_done,
    input wire b_full_done,
    input wire sync_crt_line_end,
    output reg crt_gnt,
    output reg cpu_wr_gnt,
    output reg cpu_rd_gnt
);

    // State encoding
    localparam ARB_STATE0 = 3'b000;
    localparam ARB_STATE2 = 3'b010;
    localparam ARB_STATE3 = 3'b011;
    localparam ARB_STATE4 = 3'b100;
    localparam ARB_STATE5 = 3'b101;
    localparam ARB_STATE6 = 3'b110;

    reg [2:0] current_state, next_state;

    // State register
    always @(posedge mem_clk or negedge hreset_n) begin
        if (!hreset_n)
            current_state <= ARB_STATE0;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            ARB_STATE0: begin
                if (crt_req)
                    next_state = ARB_STATE2;
                else if (cpu_wr_req)
                    next_state = ARB_STATE3;
                else if (cpu_rd_req)
                    next_state = ARB_STATE4;
                else
                    next_state = ARB_STATE0;
            end
            ARB_STATE2: begin
                if (a_empty)
                    next_state = ARB_STATE5;
                else if (b_empty)
                    next_state = ARB_STATE6;
                else
                    next_state = ARB_STATE2;
            end
            ARB_STATE3: begin
                if (!cpu_wr_req)
                    next_state = ARB_STATE0;
                else
                    next_state = ARB_STATE3;
            end
            ARB_STATE4: begin
                if (!cpu_rd_req)
                    next_state = ARB_STATE0;
                else
                    next_state = ARB_STATE4;
            end
            ARB_STATE5: begin
                if (a_full_done)
                    next_state = ARB_STATE0;
                else
                    next_state = ARB_STATE5;
            end
            ARB_STATE6: begin
                if (b_full_done)
                    next_state = ARB_STATE0;
                else
                    next_state = ARB_STATE6;
            end
            default: next_state = ARB_STATE0;
        endcase

        if (sync_crt_line_end)
            next_state = ARB_STATE0;
    end

    // Output logic
    always @(*) begin
        crt_gnt = 1'b0;
        cpu_wr_gnt = 1'b0;
        cpu_rd_gnt = 1'b0;

        case (current_state)
            ARB_STATE3: cpu_wr_gnt = 1'b1;
            ARB_STATE4: cpu_rd_gnt = 1'b1;
            ARB_STATE5, ARB_STATE6: crt_gnt = 1'b1;
            default: begin
                crt_gnt = 1'b0;
                cpu_wr_gnt = 1'b0;
                cpu_rd_gnt = 1'b0;
            end
        endcase
    end

endmodule