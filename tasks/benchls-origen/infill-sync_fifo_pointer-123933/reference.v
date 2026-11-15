module origen_123933 #(
    parameter DEPTH = 8,
    parameter WIDTH = 8
) (
    input wire sys_clk_i,
    input wire sys_reset_i,
    input wire [WIDTH-1:0] d_i,
    input wire we_i,
    output reg [WIDTH-1:0] q_o,
    output wire full_o,
    output wire empty_o,
    input wire wp_inc_i,
    input wire rp_inc_i
);

    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [$clog2(DEPTH)-1:0] wp, rp;
    reg [$clog2(DEPTH):0] count;

    assign full_o = (count == DEPTH);
    assign empty_o = (count == 0);

    always @(posedge sys_clk_i or posedge sys_reset_i) begin
        if (sys_reset_i) begin
            wp <= 0;
            rp <= 0;
            count <= 0;
        end else begin
            if (we_i && !full_o) begin
                mem[wp] <= d_i;
                wp <= (wp == DEPTH-1) ? 0 : wp + 1;
                count <= count + 1;
            end

            if (rp_inc_i && !empty_o) begin
                rp <= (rp == DEPTH-1) ? 0 : rp + 1;
                count <= count - 1;
            end

            if (wp_inc_i && !full_o) begin
                wp <= (wp == DEPTH-1) ? 0 : wp + 1;
                count <= count + 1;
            end
        end
    end

    always @(posedge sys_clk_i) begin
        if (!empty_o) begin
            q_o <= mem[rp];
        end
    end

endmodule

