module origen_075049 #(
    parameter WRITE_LATENCY = 2
)(
    input wire i_clk,
    input wire i_rstn,
    input wire [12:0] i_bram_addr,
    input wire [31:0] i_bram_data,
    input wire i_bram_trig,
    output reg o_bram_done
);

    reg [31:0] latency_cnter;
    reg o_bram_done_pre;

    always @(posedge i_clk or negedge i_rstn) begin
        if (!i_rstn) begin
            o_bram_done_pre <= 1'b0;
            latency_cnter <= 32'd0;
        end else begin
            if (i_bram_trig) begin
                if (latency_cnter == WRITE_LATENCY) begin
                    o_bram_done_pre <= 1'b1;
                    ;
                end else begin
                    latency_cnter <= latency_cnter + 1;
                    o_bram_done_pre <= 1'b0;
                end
            end else begin
                o_bram_done_pre <= 1'b0;
                latency_cnter <= 32'd0;
            end
        end
    end

    [MASKED]

    function [31:0] return_bram_data;
        input [12:0] addr;
        begin
            case(addr)
                13'h0000: return_bram_data = 32'h12345678;
                13'h0001: return_bram_data = 32'h87654321;
                13'h0002: return_bram_data = 32'hABCDEF01;
                default: return_bram_data = 32'h00000000;
            endcase
        end
    endfunction

endmodule