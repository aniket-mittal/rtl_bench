module origen_162495 #(
    parameter CONF_TYPE = 2'b00,
    parameter CONF_ID = 4'b0001,
    parameter CONF_ID_WIDTH = 4,
    parameter CONF_WIDTH = 8
)(
    input clk,
    input rst,
    input [1:0] conf_in_valid,
    input [CONF_WIDTH-1:0] conf_in_data,
    output reg conf_out_valid,
    output reg [CONF_WIDTH-1:0] conf_out_data,
    output reg conf_reset_out
);

reg [1:0] fsm_conf_rec;
localparam INIT = 2'b00, CLEAR_RESET = 2'b01, SET_VALID = 2'b10;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        fsm_conf_rec <= INIT;
        conf_out_valid <= 1'b0;
        conf_reset_out <= 1'b0;
    end
    else begin
        case (fsm_conf_rec)
            INIT: begin
                if (conf_in_valid == CONF_TYPE && conf_in_data[CONF_ID_WIDTH-1:0] == CONF_ID) begin
                    conf_out_data <= conf_in_data;
                    conf_reset_out <= 1'b1;
                    fsm_conf_rec <= CLEAR_RESET;
                end
                else begin
                    conf_reset_out <= 1'b0;
                    fsm_conf_rec <= INIT;
                end
            end
            CLEAR_RESET: begin
                conf_reset_out <= 1'b0;
                fsm_conf_rec <= SET_VALID;
            end
            SET_VALID: begin
                conf_out_valid <= 1'b1;
                fsm_conf_rec <= INIT;
            end
            default: fsm_conf_rec <= INIT;
        endcase
    end
end

endmodule