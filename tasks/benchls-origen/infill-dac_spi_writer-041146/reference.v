module origen_041146 (
    input wire clk_DAC,
    input wire DAC_En,
    input wire [7:0] DAC_Data,
    output reg DAC_Din,
    output reg DAC_Sync
);

reg [4:0] DAC_Cnt;

always @(posedge clk_DAC) begin
    if (!DAC_En) begin
        DAC_Din <= 1'b0;
        DAC_Sync <= 1'b0;
        DAC_Cnt <= 5'd0;
    end else begin
        case (DAC_Cnt)
            5'd0: begin
                DAC_Din <= 1'b0;
                DAC_Sync <= 1'b0;
            end
            5'd1: DAC_Din <= DAC_Data[7];
            5'd2: DAC_Din <= DAC_Data[6];
            5'd3: DAC_Din <= DAC_Data[5];
            5'd4: DAC_Din <= DAC_Data[4];
            5'd5: DAC_Din <= DAC_Data[3];
            5'd6: DAC_Din <= DAC_Data[2];
            5'd7: DAC_Din <= DAC_Data[1];
            5'd8: DAC_Din <= DAC_Data[0];
            5'd9, 5'd10, 5'd11, 5'd12, 5'd13, 5'd14: DAC_Din <= 1'b0;
            5'd15: begin
                DAC_Din <= 1'b0;
                DAC_Sync <= 1'b1;
            end
            5'd16, 5'd17, 5'd18: begin
                DAC_Din <= 1'b0;
                DAC_Sync <= 1'b1;
            end
            5'd19: begin
                DAC_Din <= 1'b0;
                DAC_Sync <= 1'b0;
            end
        endcase

        if (DAC_Cnt == 5'd19)
            DAC_Cnt <= 5'd0;
        else
            DAC_Cnt <= DAC_Cnt + 1'b1;
    end
end

endmodule