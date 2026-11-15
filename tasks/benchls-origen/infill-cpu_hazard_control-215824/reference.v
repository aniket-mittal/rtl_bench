module origen_215824(
    input clk,
    input [15:0] ir,
    input [15:0] rf_d2,
    input [111:0] reg_data_form_id_112,
    output reg [2:0] reg_index_la_sa,
    output reg [2:0] reg_index_lm_sm,
    output reg freeze,
    output reg reg_or_mem_enable,
    output reg [15:0] mem_data_for_sa_sm,
    output reg nop_mux_select
);

    // Initialize output signals
    initial begin
        reg_index_la_sa = 3'b000;
        reg_index_lm_sm = 3'b000;
        freeze = 1'b0;
        reg_or_mem_enable = 1'b0;
        mem_data_for_sa_sm = 16'b0;
        nop_mux_select = 1'b0;
    end

    always @(posedge clk) begin
        // Check instruction type and update signals
        case (ir[15:12])
            4'b0100: begin // LA (Load Address)
                freeze = 1'b1;
                reg_or_mem_enable = 1'b1;
                mem_data_for_sa_sm = rf_d2;
            end
            4'b0101: begin // SA (Store Address)
                freeze = 1'b1;
                reg_or_mem_enable = 1'b0;
                mem_data_for_sa_sm = rf_d2;
            end
            4'b1100: begin // LM (Load Multi-block)
                freeze = 1'b1;
                reg_or_mem_enable = 1'b1;
                mem_data_for_sa_sm = reg_data_form_id_112[15:0];
            end
            4'b1101: begin // SM (Store Multi-block)
                freeze = 1'b1;
                reg_or_mem_enable = 1'b0;
                mem_data_for_sa_sm = reg_data_form_id_112[15:0];
            end
            default: begin
                freeze = 1'b0;
                reg_or_mem_enable = 1'b0;
                mem_data_for_sa_sm = 16'b0;
            end
        endcase
    end

    always @(ir[15:12]) begin
        // Set nop_mux_select signal
        case (ir[15:12])
            4'b0100, 4'b0101, 4'b1100, 4'b1101: nop_mux_select = 1'b1;
            default: nop_mux_select = 1'b0;
        endcase
    end

    always @(posedge clk) begin
        // Manage reg_index_la_sa and reg_index_lm_sm signals
        case (ir[15:12])
            4'b0100: begin // LA
                if (reg_index_la_sa == 3'b111)
                    reg_index_la_sa = 3'b000;
                else
                    reg_index_la_sa = reg_index_la_sa + 1;
            end
            4'b0101: begin // SA
                if (reg_index_la_sa == 3'b111)
                    reg_index_la_sa = 3'b000;
                else
                    reg_index_la_sa = reg_index_la_sa + 1;
            end
            4'b1100: begin // LM
                if (reg_index_lm_sm == 3'b111)
                    reg_index_lm_sm = 3'b000;
                else
                    reg_index_lm_sm = reg_index_lm_sm + 1;
            end
            4'b1101: begin // SM
                if (reg_index_lm_sm == 3'b111)
                    reg_index_lm_sm = 3'b000;
                else
                    reg_index_lm_sm = reg_index_lm_sm + 1;
            end
            default: begin
                reg_index_la_sa = 3'b000;
                reg_index_lm_sm = 3'b000;
            end
        endcase
    end

endmodule