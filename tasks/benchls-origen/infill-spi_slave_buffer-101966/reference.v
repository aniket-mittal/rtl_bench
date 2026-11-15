module origen_101966 #(
    parameter DATA_WIDTH = 8,
    parameter BUFFER_SIZE = 4
) (
    input wire i_SCK,
    input wire i_NRESET,
    input wire i_NCE,
    input wire i_MOSI,
    output reg o_MISO,
    input wire [DATA_WIDTH-1:0] i_WriteData,
    output reg [DATA_WIDTH-1:0] o_ReadData
);

    reg [DATA_WIDTH-1:0] s_DataBuffer [BUFFER_SIZE-1:0];
    reg [$clog2(DATA_WIDTH)-1:0] s_BitCounter;
    reg [$clog2(BUFFER_SIZE)-1:0] s_ByteCounter;
    integer i;

    always @(posedge i_SCK or negedge i_NRESET) begin
        if (!i_NRESET) begin
            s_BitCounter <= 0;
            s_ByteCounter <= 0;
            o_MISO <= 1'b0;
            for (i = 0; i < BUFFER_SIZE; i = i + 1) begin
                s_DataBuffer[i] <= {DATA_WIDTH{1'b0}};
            end
        end else if (!i_NCE) begin
            s_DataBuffer[s_ByteCounter][DATA_WIDTH-1-s_BitCounter] <= i_MOSI;
            o_MISO <= s_DataBuffer[s_ByteCounter][DATA_WIDTH-1-s_BitCounter];
            
            if (s_BitCounter == DATA_WIDTH-1) begin
                s_BitCounter <= 0;
                s_ByteCounter <= s_ByteCounter + 1;
                if (s_ByteCounter == BUFFER_SIZE-1) begin
                    s_ByteCounter <= 0;
                end
            end else begin
                s_BitCounter <= s_BitCounter + 1;
            end
        end else begin
            s_DataBuffer[s_ByteCounter] <= i_WriteData;
            o_ReadData <= s_DataBuffer[s_ByteCounter];
        end
    end

endmodule

module SPI_Slave_DDCA #(
    parameter DATA_WIDTH = 8,
    parameter BUFFER_SIZE = 4
) (
    input wire i_SCK,
    input wire i_NRESET,
    input wire i_NCE,
    input wire i_MOSI,
    output reg o_MISO,
    input wire [DATA_WIDTH-1:0] i_WriteData,
    output reg [DATA_WIDTH-1:0] o_ReadData,
    output reg o_NewByte
);

    reg [DATA_WIDTH-1:0] s_DataBuffer [BUFFER_SIZE-1:0];
    reg [$clog2(DATA_WIDTH)-1:0] s_BitCounter;
    reg [$clog2(BUFFER_SIZE)-1:0] s_ByteCounter;
    reg [DATA_WIDTH-1:0] s_ShiftReg;
    integer i;

    always @(posedge i_SCK or negedge i_NRESET) begin
        if (!i_NRESET) begin
            s_BitCounter <= 0;
            s_ByteCounter <= 0;
            o_MISO <= 1'b0;
            o_NewByte <= 1'b0;
            for (i = 0; i < BUFFER_SIZE; i = i + 1) begin
                s_DataBuffer[i] <= {DATA_WIDTH{1'b0}};
            end
            s_ShiftReg <= {DATA_WIDTH{1'b0}};
        end else if (!i_NCE) begin
            s_ShiftReg <= {s_ShiftReg[DATA_WIDTH-2:0], i_MOSI};
            
            if (s_BitCounter == DATA_WIDTH-1) begin
                s_DataBuffer[s_ByteCounter] <= s_ShiftReg;
                o_NewByte <= 1'b1;
                s_BitCounter <= 0;
                s_ByteCounter <= s_ByteCounter + 1;
                if (s_ByteCounter == BUFFER_SIZE-1) begin
                    s_ByteCounter <= 0;
                end
            end else begin
                s_BitCounter <= s_BitCounter + 1;
                o_NewByte <= 1'b0;
            end
        end
    end

    always @(negedge i_SCK) begin
        if (!i_NCE) begin
            o_MISO <= s_DataBuffer[s_ByteCounter][DATA_WIDTH-1-s_BitCounter];
        end
    end

    always @(posedge i_NCE) begin
        s_DataBuffer[s_ByteCounter] <= i_WriteData;
        o_ReadData <= s_DataBuffer[s_ByteCounter];
    end

endmodule