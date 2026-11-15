module origen_065824 (
    input CLK_1Hz,
    input reset,
    input select_enable,
    input [2:0] select,
    input [3:0] num,
    input change1, change2, change3,
    output reg [3:0] second_d, second_g,
    output reg [3:0] minute_d, minute_g,
    output reg [3:0] hour_d, hour_g
);

reg [3:0] second_d_next, second_g_next;
reg [3:0] minute_d_next, minute_g_next;
reg [3:0] hour_d_next, hour_g_next;
reg cout_s, cout_m;
reg format_24;

always @(posedge CLK_1Hz or negedge reset) begin
    if (!reset) begin
        {hour_g, hour_d, minute_g, minute_d, second_g, second_d} <= 24'h015905;
        format_24 <= 1'b1;
    end else begin
        second_d <= second_d_next;
        second_g <= second_g_next;
        minute_d <= minute_d_next;
        minute_g <= minute_g_next;
        hour_d <= hour_d_next;
        hour_g <= hour_g_next;
        
        if (change2) format_24 <= ~format_24;
    end
end

[MASKED]

endmodule