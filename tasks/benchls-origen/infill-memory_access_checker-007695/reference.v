module origen_007695 (
    input [31:0] addr,
    input [1:0] num,
    input MemRead_i,
    input MemWrite_i,
    output reg MemRead_o,
    output reg MemWrite_o,
    output reg error_addressOverflow_o,
    output reg error_dataMisalign_o
);

always @(*) begin
    error_addressOverflow_o = 1'b0;
    error_dataMisalign_o = 1'b0;
    MemRead_o = MemRead_i;
    MemWrite_o = MemWrite_i;

    case (num)
        2'b11: begin // Word access (32-bit)
            if (addr > 1020 || addr[1:0] != 2'b00) begin
                error_addressOverflow_o = (addr > 1020);
                error_dataMisalign_o = (addr[1:0] != 2'b00);
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
            end
        end
        2'b10: begin // Half-word access (16-bit)
            if (addr > 1022 || addr[0] != 1'b0) begin
                error_addressOverflow_o = (addr > 1022);
                error_dataMisalign_o = (addr[0] != 1'b0);
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
            end
        end
        2'b01: begin // Byte access (8-bit)
            if (addr > 1023) begin
                error_addressOverflow_o = 1'b1;
                MemRead_o = 1'b0;
                MemWrite_o = 1'b0;
            end
        end
        default: begin // Invalid access type
            error_dataMisalign_o = 1'b1;
            MemRead_o = 1'b0;
            MemWrite_o = 1'b0;
        end
    endcase
end

endmodule