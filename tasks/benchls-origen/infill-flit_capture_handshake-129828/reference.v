module origen_129828 (
    input wire clk,
    input wire rst,
    input wire mem_done_access,
    input wire v_d_flits_m,
    input wire [31:0] d_flits_m,
    output reg d_m_cstate,
    output reg [31:0] d_m_areg_flits
);

    // Internal registers
    reg [31:0] flits_reg;
    reg busy;

    // State definitions
    localparam IDLE = 1'b0;
    localparam BUSY = 1'b1;

    // State register
    reg state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            flits_reg <= 32'b0;
            busy <= 1'b0;
            d_m_cstate <= 1'b0;
            d_m_areg_flits <= 32'b0;
            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    if (v_d_flits_m) begin
                        flits_reg <= d_flits_m;
                        busy <= 1'b1;
                        d_m_cstate <= 1'b0;
                        d_m_areg_flits <= d_flits_m;
                        state <= BUSY;
                    end else begin
                        d_m_cstate <= 1'b1;
                    end
                end

                BUSY: begin
                    if (mem_done_access) begin
                        busy <= 1'b0;
                        d_m_cstate <= 1'b1;
                        state <= IDLE;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule