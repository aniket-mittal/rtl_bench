module origen_080276 (
    input [1:0] addr,
    input [31:0] MF_RT_M,
    input [1:0] S_SEL,
    output reg [31:0] wdata,
    output reg [3:0] BE
);

    always @(*) begin
        case (S_SEL)
            2'b00: begin // WORD mode
                BE = 4'b1111;
                wdata = MF_RT_M;
            end
            2'b01: begin // H (Half-word) mode
                if (addr[1]) begin
                    BE = 4'b1100;
                    wdata = {MF_RT_M[15:0], 16'b0};
                end else begin
                    BE = 4'b0011;
                    wdata = {16'b0, MF_RT_M[15:0]};
                end
            end
            2'b10: begin // B (Byte) mode
                case (addr)
                    2'b00: begin
                        BE = 4'b0001;
                        wdata = {24'b0, MF_RT_M[7:0]};
                    end
                    2'b01: begin
                        BE = 4'b0010;
                        wdata = {16'b0, MF_RT_M[7:0], 8'b0};
                    end
                    2'b10: begin
                        BE = 4'b0100;
                        wdata = {8'b0, MF_RT_M[7:0], 16'b0};
                    end
                    2'b11: begin
                        BE = 4'b1000;
                        wdata = {MF_RT_M[7:0], 24'b0};
                    end
                endcase
            end
            default: begin // Undefined S_SEL values
                BE = BE;
                wdata = wdata;
            end
        endcase
    end

endmodule