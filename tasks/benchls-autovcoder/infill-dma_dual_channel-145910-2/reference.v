module autovcoder_145910 (
    input clk,
    input reset,
    // Channel 0 signals
    input start_ch0,
    input stop_ch0,
    input [7:0] src_addr_ch0,
    input [7:0] dest_addr_ch0,
    input [7:0] data_in_ch0,
    output reg [7:0] data_out_ch0,
    output reg busy_ch0,
    // Channel 1 signals
    input start_ch1,
    input stop_ch1,
    input [7:0] src_addr_ch1,
    input [7:0] dest_addr_ch1,
    input [7:0] data_in_ch1,
    output reg [7:0] data_out_ch1,
    output reg busy_ch1
);
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            busy_ch0 <= 0;
            busy_ch1 <= 0;
            data_out_ch0 <= 0;
            data_out_ch1 <= 0;
        end else begin
            // Channel 0 operation
            if (start_ch0 && !busy_ch0) begin
                busy_ch0 <= 1;
                data_out_ch0 <= data_in_ch0; // Simulate data transfer
            end
            if (stop_ch0) begin
                busy_ch0 <= 0;
            end
            
            // Channel 1 operation
            if (start_ch1 && !busy_ch1) begin
                busy_ch1 <= 1;
                data_out_ch1 <= data_in_ch1; // Simulate data transfer
            end
            if (stop_ch1) begin
                busy_ch1 <= 0;
            end
        end
    end
endmodule