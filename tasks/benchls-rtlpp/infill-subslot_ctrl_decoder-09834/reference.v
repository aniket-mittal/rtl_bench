module rtlpp_09834 (
    input wire         clk,
    input wire         reset,
    input wire         rx_byte_start,
    input wire         rx_byte_stop,
    input wire         rx_byte_rdy,
    input wire [7:0]   rx_byte_d,
    output reg  [8:0]  subslot_ctrl
);

    reg [3:0]     byte_cnt;
    reg [31:0]    dword_sr;
    reg           rx_byte_rdy_p1;
    reg           rx_byte_rdy_p2;
    reg           rx_byte_rdy_p3;
    reg           rx_byte_stop_p1;
    reg           rx_byte_stop_p2;
    reg           rx_byte_stop_p3;

    always @ (posedge clk) begin
        rx_byte_rdy_p1  <= rx_byte_rdy;
        rx_byte_rdy_p2  <= rx_byte_rdy_p1;
        rx_byte_rdy_p3  <= rx_byte_rdy_p2;
        rx_byte_stop_p1 <= rx_byte_stop;
        rx_byte_stop_p2 <= rx_byte_stop_p1;
        rx_byte_stop_p3 <= rx_byte_stop_p2;

        if (rx_byte_start == 1) begin
            byte_cnt <= 4'd0;
        end else if (rx_byte_rdy == 1) begin 
            if (byte_cnt != 4'd4) begin
                byte_cnt <= byte_cnt + 1; 
            end
        end 

        if (rx_byte_rdy == 1) begin 
            dword_sr[31:0] <= { dword_sr[23:0], rx_byte_d[7:0] };
        end

        subslot_ctrl[8] <= 0;
        
        if (rx_byte_rdy_p2 == 1 && byte_cnt[3:0] == 4'd3) begin
            if (dword_sr[31:16] == 16'hF000 || dword_sr[31:16] == 16'hF0FF) begin
                if (dword_sr[7:0] == 8'h00) begin
                    subslot_ctrl <= { 1'b1, dword_sr[15:8] };
                end
            end
        end

        if (reset == 1) begin
            byte_cnt <= 4'd0;
        end
    end 
endmodule