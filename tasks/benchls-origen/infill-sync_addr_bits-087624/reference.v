`timescale 1ns / 1ps

module origen_087624 #(
    parameter FIFO_ADDR_BITS = 8
) (
    input wire clk,
    input wire aclr_n,
    input wire cfg_inc_sync,
    input wire cfg_sync_mode,
    input wire [FIFO_ADDR_BITS-1:0] async_input,
    output wire [FIFO_ADDR_BITS-1:0] sync_output
);

`ifdef RTL_SIMULATION_ONLY
    reg [FIFO_ADDR_BITS-1:0] sync1, sync2, sync3;

    always @(posedge clk or negedge aclr_n) begin
        if (!aclr_n) begin
            sync1 <= {FIFO_ADDR_BITS{1'b0}};
            sync2 <= {FIFO_ADDR_BITS{1'b0}};
            sync3 <= {FIFO_ADDR_BITS{1'b0}};
        end else begin
            sync1 <= async_input;
            sync2 <= sync1;
            sync3 <= sync2;
        end
    end

    assign sync_output = cfg_sync_mode ? async_input :
                         (cfg_inc_sync ? sync3 : sync2);

`else
    genvar i;
    generate
        for (i = 0; i < FIFO_ADDR_BITS; i = i + 1) begin : sync_bit
            reg sync1, sync2, sync3;
            wire mux1_out, mux2_out;

            always @(posedge clk or negedge aclr_n) begin
                if (!aclr_n) begin
                    sync1 <= 1'b0;
                    sync2 <= 1'b0;
                    sync3 <= 1'b0;
                end else begin
                    sync1 <= async_input[i];
                    sync2 <= sync1;
                    sync3 <= sync2;
                end
            end

            assign mux1_out = cfg_inc_sync ? sync3 : sync2;
            assign mux2_out = cfg_sync_mode ? async_input[i] : mux1_out;
            assign sync_output[i] = mux2_out;
        end
    endgenerate
`endif

endmodule