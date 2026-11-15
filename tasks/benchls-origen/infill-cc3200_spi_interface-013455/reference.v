module origen_013455 (
    input wire CC3200_SPI_CLK,
    input wire CC3200_SPI_CS,
    output reg CC3200_SPI_DIN,
    input wire CC3200_SPI_DOUT,
    input wire Envelop,
    output reg Enable,
    output reg [7:0] Line_Num,
    output reg [1:0] Zoom,
    output reg [5:0] Gain,
    input wire [7:0] Trans_Data,
    output reg [8:0] Trans_Addr
);

    reg [15:0] Config_Data_Shift;
    reg [3:0] SPI_Counter;
    reg [7:0] Shift_Data;

    // Configuration Data Reception
    always @(posedge CC3200_SPI_CLK or negedge CC3200_SPI_CS) begin
        if (!CC3200_SPI_CS) begin
            Line_Num <= Config_Data_Shift[7:0];
            Zoom <= Config_Data_Shift[9:8];
            Gain <= Config_Data_Shift[15:10];
        end else begin
            Config_Data_Shift <= {Config_Data_Shift[14:0], CC3200_SPI_DOUT};
        end
    end

    // Data Transmission to CC3200
    always @(negedge CC3200_SPI_CLK or negedge CC3200_SPI_CS) begin
        if (!CC3200_SPI_CS) begin
            SPI_Counter <= 4'b0000;
            Shift_Data <= Trans_Data;
        end else if (!Envelop) begin
            SPI_Counter <= SPI_Counter + 1;
            CC3200_SPI_DIN <= Shift_Data[7];
            Shift_Data <= {Shift_Data[6:0], 1'b0};
        end
    end

    // Address Management
    always @(posedge CC3200_SPI_CS or posedge Envelop) begin
        if (Envelop) begin
            Trans_Addr <= 9'b0;
        end else begin
            Trans_Addr <= Trans_Addr + 1;
        end
    end

    // Enable signal (assuming it's active when CS is low)
    always @(*) begin
        Enable = !CC3200_SPI_CS;
    end

endmodule