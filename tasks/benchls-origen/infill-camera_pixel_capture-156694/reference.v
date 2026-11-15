module origen_156694(
    input RES,
    input CLK,
    input [7:0] D,
    input HREF,
    input VSYNC,
    input [14:0] x_in,
    input [14:0] y_in,
    output reg [7:0] PIXEL,
    output reg SAMP_RDY,
    output reg [14:0] x_out,
    output reg [14:0] y_out
);

reg [15:0] TEMP;
reg reg_valid;
reg [15:0] count_bit;

always @(posedge CLK or negedge RES) begin
    if (!RES) begin
        TEMP <= 16'b0;
        reg_valid <= 1'b0;
        count_bit <= 16'b0;
        x_out <= 15'b0;
        y_out <= 15'b0;
    end
    else begin
        if (VSYNC) begin
            x_out <= 15'b0;
            y_out <= 15'b0;
            count_bit <= 16'b0;
        end
        else if (!HREF) begin
            y_out <= y_out + 15'b1;
            x_out <= 15'b0;
        end
        else begin
            if (count_bit[0]) begin
                TEMP[15:8] <= D;
                PIXEL <= {TEMP[15:13], TEMP[10:9], TEMP[4:2]};
                SAMP_RDY <= 1'b1;
                reg_valid <= 1'b1;
                x_out <= x_out + 15'b1;
            end
            else begin
                TEMP[7:0] <= D;
            end
            count_bit <= count_bit + 16'b1;
        end
    end
end

endmodule