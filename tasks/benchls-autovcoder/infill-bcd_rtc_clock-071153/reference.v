module autovcoder_071153(
    input            rst,
    input            clk,
    input            cen,   // 1024 Hz clock enable
    input      [7:0] din,
    input      [2:0] we,    // overwrite hour, min, sec
    output reg [7:0] sec, min, hour // BCD
);

reg [9:0] cnt;

always @(posedge clk, posedge rst) begin
    if( rst ) begin
        { hour, min, sec } <= `ifndef JTFRAME_SIM_RTC 0 `else `JTFRAME_SIM_RTC `endif;
        cnt <= 0;
    end else begin
        if( cen ) begin
            cnt <= cnt+10'd1;
            if( cnt==0 ) begin
                sec[3:0] <= sec[3:0]+4'd1;
                if( sec[3:0]==9 ) begin // 9 seconds
                    sec[3:0] <= 0;
                    sec[7:4] <= sec[7:4]+4'd1;
                    if( sec[7:4]==5 ) begin // 59 seconds
                        sec[7:4] <= 0;
                        min[3:0] <= min[3:0]+4'd1;
                        if( min[3:0]==9 ) begin // 9 minutes
                            min[3:0] <= 0;
                            min[7:4] <= min[7:4]+4'd1;
                            if( min[7:4]==5 ) begin // 59 minutes
                                min[7:4] <= 0;
                                hour[3:0] <= hour[3:0]+4'd1;
                                if( hour[3:0]==9 || hour==8'h23 ) begin // 9 or 23 hours
                                    hour[3:0] <= 0;
                                    hour[7:4] <= hour==8'h23 ? 4'd0 : hour[7:4]+4'd1;
                                end
                            end
                        end
                    end
                end
            end
        end
        if( we[0] ) sec  <= din;
        if( we[1] ) min  <= din;
        if( we[2] ) hour <= din;
    end
end

endmodule
