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

    always @(posedge clk_100MHz or posedge Rst) begin
        if (Rst) begin
            Measure_Cnt <= 0;
            Measure_Num_Cnt <= 0;
            Measure_Delta_Cnt <= 0;
            Signal_Pulse <= 0;
            Measure_Delta_Clear <= 0;
            Delta_Clear_Flag <= 0;
        end else begin
            if (ADC_Data > F_Gate) begin
                Signal_Pulse <= 1;
            end else begin
                Signal_Pulse <= 0;
            end

            if (Signal_Pulse) begin
                Measure_Cnt <= Measure_Cnt + 1;
                Measure_Delta_Cnt <= Measure_Delta_Cnt + 1;
            end

            if (Measure_Delta_Clear) begin
                Measure_Delta_Cnt <= 0;
                Delta_Clear_Flag <= 1;
            end else begin
                Delta_Clear_Flag <= 0;
            end

            if (Measure_Num_Cnt < 8'd200) begin
                Measure_Num_Cnt <= Measure_Num_Cnt + 1;
                Measure_Delta_Clear <= 0;
            end else begin
                Measure_Num_Cnt <= 0;
                Measure_Delta_Clear <= 1;
            end
        end
    end

    assign Period = (Measure_Cnt < 16'd200) ? 21'd1 :
                    (Measure_Cnt > 20'd1000000) ? 21'd5000 :
                    {1'b0, Measure_Cnt} / 16'd200;

endmodule