module origen_059920(
    input [1:0] A,
    input [31:0] Dout,
    input [2:0] op,
    input [31:0] PrRD,
    input [31:0] addr,
    output reg [31:0] Doutext
);

    always @(*) begin
        Doutext = 32'b0;

        if (addr == 32'h7f00 || addr == 32'h7f04 || addr == 32'h7f08 ||
            addr == 32'h7f10 || addr == 32'h7f14 || addr == 32'h7f18) begin
            Doutext = PrRD;
        end else begin
            case (op)
                3'b000: Doutext = Dout;
                3'b001: begin
                    case (A)
                        2'b00: Doutext = {24'b0, Dout[7:0]};
                        2'b01: Doutext = {24'b0, Dout[15:8]};
                        2'b10: Doutext = {24'b0, Dout[23:16]};
                        2'b11: Doutext = {24'b0, Dout[31:24]};
                    endcase
                end
                3'b010: begin
                    case (A)
                        2'b00: Doutext = {{24{Dout[7]}}, Dout[7:0]};
                        2'b01: Doutext = {{24{Dout[15]}}, Dout[15:8]};
                        2'b10: Doutext = {{24{Dout[23]}}, Dout[23:16]};
                        2'b11: Doutext = {{24{Dout[31]}}, Dout[31:24]};
                    endcase
                end
                3'b011: begin
                    case (A[1])
                        1'b0: Doutext = {16'b0, Dout[15:0]};
                        1'b1: Doutext = {16'b0, Dout[31:16]};
                    endcase
                end
                3'b100: begin
                    case (A[1])
                        1'b0: Doutext = {{16{Dout[15]}}, Dout[15:0]};
                        1'b1: Doutext = {{16{Dout[31]}}, Dout[31:16]};
                    endcase
                end
                default: Doutext = Dout;
            endcase
        end
    end

endmodule