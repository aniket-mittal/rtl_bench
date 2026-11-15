module origen_132101 (
    output reg [1:0] cp_controller_cpstate,
    output reg cop_out_ready,
    output reg cop_dut_enable,
    input wire strobe_reg_cop_in_strobe_reg,
    input wire IPCORE_CLK,
    input wire AR,
    input wire write_reg_axi_enable
);

    // Internal signals
    reg cp_controller_cpstate_0;
    reg cp_controller_cpstate_1;
    reg cp_controller_cpstate_reg_0;
    reg cp_controller_cpstate_reg_1;
    reg cp_controller_cpstate_1_i_1_n_0;
    reg data_pipeline_tmp_14_15_i_1;
    reg read_reg_cop_out_ready_i_1;

    // State definitions
    localparam IDLE = 2'b00;
    localparam READY = 2'b01;
    localparam PROCESSING = 2'b10;
    localparam DONE = 2'b11;

    // State update logic
    always @(posedge IPCORE_CLK or posedge AR) begin
        if (AR) begin
            cp_controller_cpstate <= IDLE;
            cp_controller_cpstate_reg_0 <= 1'b0;
            cp_controller_cpstate_reg_1 <= 1'b0;
        end else begin
            cp_controller_cpstate_reg_0 <= cp_controller_cpstate[0];
            cp_controller_cpstate_reg_1 <= cp_controller_cpstate[1];
            
            case (cp_controller_cpstate)
                IDLE: begin
                    if (write_reg_axi_enable)
                        cp_controller_cpstate <= READY;
                end
                READY: begin
                    if (strobe_reg_cop_in_strobe_reg)
                        cp_controller_cpstate <= PROCESSING;
                end
                PROCESSING: begin
                    if (data_pipeline_tmp_14_15_i_1)
                        cp_controller_cpstate <= DONE;
                end
                DONE: begin
                    cp_controller_cpstate <= IDLE;
                end
            endcase
        end
    end

    // Output logic
    always @(*) begin
        case (cp_controller_cpstate)
            IDLE: begin
                cop_out_ready = 1'b0;
                cop_dut_enable = 1'b0;
            end
            READY: begin
                cop_out_ready = 1'b1;
                cop_dut_enable = 1'b0;
            end
            PROCESSING: begin
                cop_out_ready = 1'b0;
                cop_dut_enable = 1'b1;
            end
            DONE: begin
                cop_out_ready = 1'b1;
                cop_dut_enable = 1'b0;
            end
        endcase
    end

    // Additional internal signal logic
    always @(posedge IPCORE_CLK or posedge AR) begin
        if (AR) begin
            cp_controller_cpstate_0 <= 1'b0;
            cp_controller_cpstate_1 <= 1'b0;
            cp_controller_cpstate_1_i_1_n_0 <= 1'b0;
            data_pipeline_tmp_14_15_i_1 <= 1'b0;
            read_reg_cop_out_ready_i_1 <= 1'b0;
        end else begin
            cp_controller_cpstate_0 <= cp_controller_cpstate[0];
            cp_controller_cpstate_1 <= cp_controller_cpstate[1];
            cp_controller_cpstate_1_i_1_n_0 <= (cp_controller_cpstate == PROCESSING);
            data_pipeline_tmp_14_15_i_1 <= (cp_controller_cpstate == PROCESSING) && !cop_dut_enable;
            read_reg_cop_out_ready_i_1 <= cop_out_ready;
        end
    end

endmodule