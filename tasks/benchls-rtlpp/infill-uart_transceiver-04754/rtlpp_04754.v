module rtlpp_04754 (
    input reset,
    input clk,
    input [7:0] baud_div,
    input rx_in,
    output reg tx_out,
    input tx_latch,
    input [7:0] tx_data,
    output reg tx_empty,
    output reg [7:0] rx_data,
    output reg rx_latch
);

parameter NUM_SYNC = 5;

reg [7:0] tx_reg;
reg [3:0] tx_cnt;
reg [3:0] rx_cnt;
reg [15:0] rx_sample_cnt;
reg [15:0] tx_sample_cnt;
reg rx_d1;
reg [NUM_SYNC-1:0] rx_sync;
wire rx_d = rx_sync[NUM_SYNC-1];
reg rx_busy;

always @ (posedge reset or posedge clk) begin
    if (reset) begin
        rx_data       <= 0; 
        rx_sample_cnt <= 0;
        rx_cnt        <= 0;
        rx_latch      <= 0;
        rx_d1         <= 1;
        rx_busy       <= 0;
        rx_sync       <= {NUM_SYNC{1'b1}};
    end else begin
        rx_sync[0] <= rx_in;
        rx_sync[NUM_SYNC-1:1] <= rx_sync[NUM_SYNC-2:0];
        rx_latch <= 0;
        
        if (!rx_busy && !rx_d) begin
            rx_busy       <= 1;
            rx_sample_cnt <= 1;
            rx_cnt        <= 0;
        end
        
        if (rx_busy) begin
            rx_sample_cnt <= rx_sample_cnt + 1;
            
            if (rx_sample_cnt == baud_div[7:1]) begin
                if ((rx_d == 1) && (rx_cnt == 0)) begin
                    rx_busy <= 0;
                end else begin
                    rx_cnt <= rx_cnt + 1; 
                    
                    if (rx_cnt > 0 && rx_cnt < 9) begin
                        rx_data[rx_cnt - 1] <= rx_d;
                    end
                    if (rx_cnt == 9) begin
                        rx_busy <= 0;
                        
                        if (rx_d == 1) begin
                            rx_latch <= 1;
                        end
                    end
                end
            end else if(rx_sample_cnt == baud_div-1) begin
                rx_sample_cnt <= 0;
            end
        end 
    end
end


[MASKED]

endmodule