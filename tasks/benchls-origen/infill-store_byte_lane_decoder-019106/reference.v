module origen_019106 (
    input [31:0] RTin,
    input [31:0] alu_out,
    input [2:0] LdStCtrl,
    input [31:0] PCout_Y,
    output [11:0] mem_adr,
    output reg [3:0] we_i,
    output reg [3:0] we_d,
    output reg [3:0] we_isr,
    output reg [31:0] RTout
);

    assign mem_adr = alu_out[13:2];

    always @(*) begin
        we_i = 4'b0000;
        we_d = 4'b0000;
        we_isr = 4'b0000;
        RTout = RTin;

        case (LdStCtrl)
            3'b001: begin // Store byte
                if (alu_out[31:28] == 4'b0100 && PCout_Y[31:28] == 4'b0100)
                    we_i[alu_out[1:0]] = 1'b1;
                else if (alu_out[31:28] == 4'b0101)
                    we_d[alu_out[1:0]] = 1'b1;
                else if (alu_out[31:28] == 4'b0110)
                    we_isr[alu_out[1:0]] = 1'b1;
                RTout = {24'b0, RTin[7:0]};
            end
            3'b010: begin // Store halfword
                if (alu_out[31:28] == 4'b0100 && PCout_Y[31:28] == 4'b0100)
                    we_i[{alu_out[1], 1'b0}+:2] = 2'b11;
                else if (alu_out[31:28] == 4'b0101)
                    we_d[{alu_out[1], 1'b0}+:2] = 2'b11;
                else if (alu_out[31:28] == 4'b0110)
                    we_isr[{alu_out[1], 1'b0}+:2] = 2'b11;
                RTout = {16'b0, RTin[15:0]};
            end
            3'b011: begin // Store word
                if (alu_out[31:28] == 4'b0100 && PCout_Y[31:28] == 4'b0100)
                    we_i = 4'b1111;
                else if (alu_out[31:28] == 4'b0101)
                    we_d = 4'b1111;
                else if (alu_out[31:28] == 4'b0110)
                    we_isr = 4'b1111;
                RTout = RTin;
            end
            default: begin
                we_i = 4'b0000;
                we_d = 4'b0000;
                we_isr = 4'b0000;
                RTout = RTin;
            end
        endcase
    end
endmodule

module LoadLogic (
    input [31:0] word,
    input [2:0] LdStCtrl,
    input [1:0] byte_sel,
    output reg [31:0] word_out
);

    always @(*) begin
        case (LdStCtrl)
            3'b100: begin // Sign-extended byte load
                case (byte_sel)
                    2'b00: word_out = {{24{word[7]}}, word[7:0]};
                    2'b01: word_out = {{24{word[15]}}, word[15:8]};
                    2'b10: word_out = {{24{word[23]}}, word[23:16]};
                    2'b11: word_out = {{24{word[31]}}, word[31:24]};
                endcase
            end
            3'b101: begin // Sign-extended halfword load
                case (byte_sel[1])
                    1'b0: word_out = {{16{word[15]}}, word[15:0]};
                    1'b1: word_out = {{16{word[31]}}, word[31:16]};
                endcase
            end
            3'b110: begin // Word load
                word_out = word;
            end
            3'b111: begin // Zero-extended byte load
                case (byte_sel)
                    2'b00: word_out = {24'b0, word[7:0]};
                    2'b01: word_out = {24'b0, word[15:8]};
                    2'b10: word_out = {24'b0, word[23:16]};
                    2'b11: word_out = {24'b0, word[31:24]};
                endcase
            end
            3'b000: begin // Zero-extended halfword load
                case (byte_sel[1])
                    1'b0: word_out = {16'b0, word[15:0]};
                    1'b1: word_out = {16'b0, word[31:16]};
                endcase
            end
            default: word_out = 32'b0;
        endcase
    end
endmodule