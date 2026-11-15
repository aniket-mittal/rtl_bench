module rtlpp_00613 (
    CLOCK,
    nRESET,
    CLKEN,
    ENABLE,
    RS,
    nWR,
    DI,
    DO,
    SD_CS0,
    SD_CS1,
    SD_WCS,
    SD_CLK,
    SD_MOSI,
    SD_MISO
);

input   CLOCK;
input   nRESET;
input   CLKEN;
input   ENABLE;
input   RS;
input   nWR;
input   [7:0] DI;
output  [7:0] DO;
output  SD_CS0;
output  SD_CS1;
output  SD_WCS;
output  SD_CLK;
output  SD_MOSI;
input   SD_MISO;

wire    [7:0] DO;
reg     SD_CS0;
reg     SD_CS1;
reg     SD_WCS;
reg     done;
wire    SD_CLK;
wire    SD_MOSI;
reg     [3:0] counter;
reg     [8:0] shift_reg;
reg     [7:0] in_reg;

assign DO = RS ? in_reg : {4'h5, SD_WCS, done, SD_CS1, SD_CS0};
assign SD_CLK = counter[0];
assign SD_MOSI = shift_reg[8];

always @(posedge CLOCK) begin
    if (nRESET == 1'b0) begin
        SD_CS0 <= 1'b1;
        SD_CS1 <= 1'b1;
        SD_WCS <= 1'b1;
    end else if (CLKEN == 1'b1) begin
        if (ENABLE == 1'b1 && RS == 1'b0 && nWR == 1'b0) begin
            SD_CS0 <= DI[0];
            SD_CS1 <= DI[1];
            SD_WCS <= DI[3];
        end
    end
end

always @(posedge CLOCK) begin
    if (nRESET == 1'b0) begin
        shift_reg <= 9'b111111111;
        in_reg <= 8'b11111111;
        counter <= 4'b1111;
        done <= 1'b0;
    end else if (CLKEN == 1'b1) begin
        if (counter == 4'b1111) begin
            in_reg <= shift_reg[7:0];
            done <= 1'b1;
            if (ENABLE == 1'b1 && RS == 1'b1) begin
                if (nWR == 1'b1) begin
                    shift_reg <= 9'b111111111;
                end else begin
                    shift_reg <= {DI, 1'b1};
                end
                done <= 1'b0;
                counter <= 4'b0000;
            end
        end else begin
            counter <= counter + 1;
            if (counter[0] == 1'b0) begin
                shift_reg[0] <= SD_MISO;
            end else begin
                shift_reg <= {shift_reg[7:0], 1'b1};
            end
        end
    end
end

endmodule