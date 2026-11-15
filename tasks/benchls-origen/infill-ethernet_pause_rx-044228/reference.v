module origen_044228 (
    input wire rst,
    input wire in_clk,
    input wire [3:0] up_data_rx_ctrl,
    input wire in_par_en,
    input wire [31:0] in_data,
    input wire in_valid,
    input wire in_sop,
    input wire in_eop,
    input wire [1:0] in_mod,
    input wire [2:0] in_info,
    input wire [1:0] in_stat,
    input wire [3:0] in_snum,
    output reg pause_on
);

    // Control signals
    wire [3:0] rx_loop_en;
    wire rx_dump_en;
    wire rx_pause_en;
    assign rx_loop_en = up_data_rx_ctrl[3:0];
    assign rx_dump_en = up_data_rx_ctrl[1];
    assign rx_pause_en = 1'b1;

    // MAC address detection
    reg hereis_mac;
    reg [5:0] hereis_mac_cntr;
    
    // Pause frame detection
    reg pause_rx;
    reg [15:0] pause_time;
    reg [15:0] pause_time_reg;

    // State machine
    reg [2:0] state;
    localparam IDLE = 3'd0,
               MAC_DETECT = 3'd1,
               TYPE_DETECT = 3'd2,
               OPCODE_DETECT = 3'd3,
               TIME_EXTRACT = 3'd4;

    always @(posedge in_clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            hereis_mac <= 1'b0;
            hereis_mac_cntr <= 6'd0;
            pause_rx <= 1'b0;
            pause_time <= 16'd0;
            pause_time_reg <= 16'd0;
            pause_on <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (in_valid && in_sop) begin
                        state <= MAC_DETECT;
                        hereis_mac_cntr <= 6'd0;
                    end
                end
                
                MAC_DETECT: begin
                    if (in_valid) begin
                        hereis_mac_cntr <= hereis_mac_cntr + 1;
                        if (hereis_mac_cntr == 6'd5) begin
                            state <= TYPE_DETECT;
                            hereis_mac <= 1'b1;
                        end
                    end
                end
                
                TYPE_DETECT: begin
                    if (in_valid && in_data[31:16] == 16'h8808) begin
                        state <= OPCODE_DETECT;
                    end else if (in_valid) begin
                        state <= IDLE;
                    end
                end
                
                OPCODE_DETECT: begin
                    if (in_valid && in_data[31:16] == 16'h0001) begin
                        state <= TIME_EXTRACT;
                        pause_rx <= 1'b1;
                    end else if (in_valid) begin
                        state <= IDLE;
                    end
                end
                
                TIME_EXTRACT: begin
                    if (in_valid) begin
                        pause_time <= in_data[15:0];
                        state <= IDLE;
                    end
                end
                
                default: state <= IDLE;
            endcase

            // Pause time handling
            if (pause_time > 16'd0 && rx_pause_en) begin
                pause_time_reg <= pause_time;
                pause_on <= 1'b1;
            end else if (pause_time_reg > 16'd64) begin
                pause_time_reg <= pause_time_reg - 16'd64;
            end else begin
                pause_time_reg <= 16'd0;
                pause_on <= 1'b0;
            end
        end
    end

endmodule