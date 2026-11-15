module origen_170644(
    input [3:0] INX,
    output reg [15:0] DISPLAY_NUM,
    output reg [10:0] TO
);

reg [11:0] CODE;
reg [3:0] H;

always @(*) begin
    case (INX)
        4'b0000: begin
            TO = 11'h7ff;
            CODE = 12'h000;
            H = 4'h0;
        end
        4'b0001: begin
            TO = 11'h089;
            CODE = 12'h001;
            H = 4'h0;
        end
        4'b0010: begin
            TO = 11'h10a;
            CODE = 12'h002;
            H = 4'h0;
        end
        4'b0011: begin
            TO = 11'h14b;
            CODE = 12'h003;
            H = 4'h0;
        end
        4'b0100: begin
            TO = 11'h18c;
            CODE = 12'h004;
            H = 4'h0;
        end
        4'b0101: begin
            TO = 11'h1cd;
            CODE = 12'h005;
            H = 4'h0;
        end
        4'b0110: begin
            TO = 11'h20e;
            CODE = 12'h006;
            H = 4'h0;
        end
        4'b0111: begin
            TO = 11'h24f;
            CODE = 12'h007;
            H = 4'h0;
        end
        4'b1000: begin
            TO = 11'h290;
            CODE = 12'h008;
            H = 4'h0;
        end
        4'b1001: begin
            TO = 11'h2d1;
            CODE = 12'h009;
            H = 4'h0;
        end
        4'b1010: begin
            TO = 11'h312;
            CODE = 12'h00a;
            H = 4'h1;
        end
        4'b1011: begin
            TO = 11'h353;
            CODE = 12'h00b;
            H = 4'h1;
        end
        4'b1100: begin
            TO = 11'h394;
            CODE = 12'h00c;
            H = 4'h1;
        end
        4'b1101: begin
            TO = 11'h3d5;
            CODE = 12'h00d;
            H = 4'h1;
        end
        4'b1110: begin
            TO = 11'h416;
            CODE = 12'h00e;
            H = 4'h1;
        end
        4'b1111: begin
            TO = 11'h457;
            CODE = 12'h00f;
            H = 4'h1;
        end
    endcase

    DISPLAY_NUM = {H, CODE};
end

endmodule