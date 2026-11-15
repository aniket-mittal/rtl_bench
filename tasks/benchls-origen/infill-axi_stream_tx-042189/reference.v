module origen_042189 #(
    parameter BUS_WIDTH = 16
) (
    input wire i_clk,
    input wire i_aresetn,
    input wire i_enable,
    output wire o_idle,
    input wire [BUS_WIDTH-1:0] i_data_to_transmit,
    input wire [(BUS_WIDTH/8)-1:0] i_tkeep,
    input wire [31:0] i_tdest,
    input wire i_tlast,
    input wire [31:0] i_core_TID,
    output reg o_tvalid,
    output reg [BUS_WIDTH-1:0] o_tdata,
    output reg [(BUS_WIDTH/8)-1:0] o_tkeep,
    output reg [7:0] o_tdest,
    output wire [7:0] o_tid,
    output reg o_tlast,
    input wire i_tready
);

    reg r_idle;
    
    assign o_idle = r_idle;
    assign o_tid = i_core_TID[7:0];

    always @(posedge i_clk or negedge i_aresetn) begin
        if (!i_aresetn) begin
            r_idle <= 1'b1;
            o_tvalid <= 1'b0;
            o_tdata <= {BUS_WIDTH{1'b0}};
            o_tkeep <= {(BUS_WIDTH/8){1'b0}};
            o_tdest <= 8'b0;
            o_tlast <= 1'b0;
        end else begin
            if (r_idle) begin
                if (i_enable) begin
                    r_idle <= 1'b0;
                    o_tvalid <= 1'b1;
                    o_tdata <= i_data_to_transmit;
                    o_tkeep <= i_tkeep;
                    o_tdest <= i_tdest[7:0];
                    o_tlast <= i_tlast;
                end
            end else begin
                if (i_tready) begin
                    r_idle <= 1'b1;
                    o_tvalid <= 1'b0;
                end
            end
        end
    end

endmodule