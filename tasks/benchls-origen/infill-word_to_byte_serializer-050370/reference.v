module origen_050370 (
    input wire ClkEngress,
    input wire ARst,
    input wire [31:0] WriteData,
    input wire WriteDataValid,
    output reg [7:0] Data,
    output reg DataValid,
    output reg Ready
);

    reg [1:0] byteNum;
    reg [31:0] writeDataSave;

    always @(posedge ClkEngress or posedge ARst) begin
        if (ARst) begin
            byteNum <= 2'b00;
            DataValid <= 1'b0;
            Ready <= 1'b1;
            writeDataSave <= 32'b0;
        end else begin
            if (Ready && WriteDataValid) begin
                writeDataSave <= WriteData;
                Ready <= 1'b0;
                DataValid <= 1'b1;
                byteNum <= 2'b00;
            end else if (!Ready || byteNum != 2'b00) begin
                case (byteNum)
                    2'b00: begin
                        Data <= writeDataSave[7:0];
                        byteNum <= 2'b01;
                    end
                    2'b01: begin
                        Data <= writeDataSave[15:8];
                        byteNum <= 2'b10;
                    end
                    2'b10: begin
                        Data <= writeDataSave[23:16];
                        byteNum <= 2'b11;
                        Ready <= 1'b1;
                    end
                    2'b11: begin
                        Data <= writeDataSave[31:24];
                        byteNum <= 2'b00;
                        DataValid <= 1'b0;
                    end
                endcase
            end else begin
                DataValid <= 1'b0;
            end
        end
    end

endmodule