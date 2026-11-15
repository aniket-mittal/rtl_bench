module origen_168275 (
    input clk_in,
    input rst_in,
    input [15:0] cpumc_a_in,
    input [7:0] cpumc_din_in,
    output [7:0] cpumc_dout_in,
    input cpu_r_nw_in,
    output active_out,
    output [15:0] cpumc_a_out,
    output [7:0] cpumc_d_out,
    output cpumc_r_nw_out
);

    reg [15:0] q_addr;
    reg [7:0] q_data;
    reg [1:0] state;
    parameter S_READY = 2'b00, S_ACTIVE = 2'b01, S_COOLDOWN = 2'b10;

    assign active_out = (state == S_ACTIVE);
    assign cpumc_a_out = q_addr;
    assign cpumc_d_out = q_data;
    assign cpumc_r_nw_out = (state == S_ACTIVE) ? 1'b0 : cpu_r_nw_in;

    always @(posedge clk_in or posedge rst_in) begin
        if (rst_in) begin
            state <= S_READY;
            q_addr <= 16'h0;
        end else begin
            case (state)
                S_READY: begin
                    if (cpumc_a_in == 16'h4014 && !cpu_r_nw_in) begin
                        q_addr <= cpumc_din_in;
                        state <= S_ACTIVE;
                    end
                end
                S_ACTIVE: begin
                    if (q_addr == 16'hFF) begin
                        state <= S_COOLDOWN;
                    end else begin
                        q_data <= cpumc_dout_in;
                        q_addr <= q_addr + 1;
                    end
                end
                S_COOLDOWN: begin
                    if (cpu_r_nw_in) begin
                        state <= S_READY;
                    end
                end
            endcase
        end
    end

endmodule