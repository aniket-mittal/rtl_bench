module origen_209396(
    input wire in_data,
    input wire clk,
    input wire rst,
    output wire fullclk
);

reg [15:0] cnt;
reg last_data;
reg [15:0] cntsaved [49:0];
reg [15:0] mincnt [49:0];
wire [15:0] period;
wire [15:0] position;
reg [15:0] clkcnt;
reg [15:0] period_saved;

always @(posedge clk) begin
    if(rst) begin
        cnt <= 16'd0;
        last_data <= 1'b0;
        for(int i = 0; i < 50; i++) begin
            cntsaved[i] <= 16'd0;
            mincnt[i] <= 16'd0;
        end
        period_saved <= 16'd0;
        clkcnt <= 16'd0;
    end else begin
        last_data <= in_data;
        if(in_data != last_data) begin
            // Shift the values in the cntsaved and mincnt arrays
            for (int i = 49; i > 0; i--) begin
                cntsaved[i] <= cntsaved[i-1];
                mincnt[i] <= mincnt[i-1];
            end
            cntsaved[0] <= cnt;
            mincnt[0] <= cnt;
            cnt <= 16'd0;
        end else begin
            cnt <= cnt + 16'd1;
        end
        if(period_saved != period) begin
            clkcnt <= 16'd0;
        end else begin
            clkcnt <= clkcnt + 16'd1;
        end
        period_saved <= period;
    end
end

assign period = mincnt[0];
assign position = period / 2;
assign fullclk = (clkcnt == 16'd0) | (clkcnt == position);

endmodule