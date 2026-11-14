module origen_159737(
    input wire clk_100MHz,
    input wire Rst,
    input wire [7:0] ADC_Data,
    input wire [7:0] F_Gate,
    output wire [20:0] Period
);

    reg [15:0] Measure_Cnt;
    reg [7:0] Measure_Num_Cnt;
    reg [15:0] Measure_Delta_Cnt;
    reg Signal_Pulse;
    reg Measure_Delta_Clear;
    reg Delta_Clear_Flag;

    [MASKED]

    assign Period = (Measure_Cnt < 16'd200) ? 21'd1 :
                    (Measure_Cnt > 20'd1000000) ? 21'd5000 :
                    {1'b0, Measure_Cnt} / 16'd200;

endmodule