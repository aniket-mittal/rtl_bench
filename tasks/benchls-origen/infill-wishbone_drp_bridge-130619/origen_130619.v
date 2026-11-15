module origen_130619 #(
    parameter ADDR_WIDTH = 8
) (
    input wire clk,
    input wire rst,
    input wire [ADDR_WIDTH-1:0] wb_adr_i,
    input wire [15:0] wb_dat_i,
    input wire wb_we_i,
    input wire wb_stb_i,
    input wire wb_cyc_i,
    output reg [15:0] wb_dat_o,
    output reg wb_ack_o,
    output reg [ADDR_WIDTH-1:0] drp_addr,
    output reg [15:0] drp_do,
    output reg drp_en,
    output reg drp_we,
    input wire drp_rdy,
    input wire [15:0] drp_di
);

    localparam IDLE = 2'b00;
    localparam WAIT_DRP = 2'b01;
    localparam COMPLETE = 2'b10;

    reg [1:0] state, next_state;
    reg wb_cycle_active;

    [MASKED]

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (wb_cyc_i && wb_stb_i) begin
                    next_state = WAIT_DRP;
                end
            end
            WAIT_DRP: begin
                if (drp_rdy) begin
                    next_state = COMPLETE;
                end
            end
            COMPLETE: begin
                if (!wb_cyc_i || !wb_stb_i) begin
                    next_state = IDLE;
                end
            end
            default: next_state = IDLE;
        endcase
    end

    always @(posedge clk) begin
        if (wb_cycle_active) begin
            drp_addr <= wb_adr_i;
            if (wb_we_i) begin
                drp_do <= wb_dat_i;
            end
        end
    end

    always @(posedge clk) begin
        if (state == COMPLETE) begin
            wb_dat_o <= drp_di;
        end
    end

endmodule