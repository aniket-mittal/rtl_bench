module origen_103858 #(
    parameter D7 = 0, D6 = 0, D5 = 0, D4 = 0,
    parameter D3 = 0, D2 = 0, D1 = 1, D0 = 1
)(
    input [3:0] data_7, data_6, data_5, data_4, data_3, data_2, data_1, data_0,
    input [2:0] counter,
    output reg [7:0] anodos,
    output reg [3:0] DIG
);

    always @(*) begin
        case(counter)
            3'b000: begin
                if (D0) begin
                    anodos = 8'b11111110;
                    DIG = data_0;
                end else begin
                    anodos = 8'b11111111;
                    DIG = 4'b0000;
                end
            end
            3'b001: begin
                if (D1) begin
                    anodos = 8'b11111101;
                    DIG = data_1;
                end else begin
                    anodos = 8'b11111111;
                    DIG = 4'b0000;
                end
            end
            3'b010: begin
                if (D2) begin
                    anodos = 8'b11111011;
                    DIG = data_2;
                end else begin
                    anodos = 8'b11111111;
                    DIG = 4'b0000;
                end
            end
            3'b011: begin
                if (D3) begin
                    anodos = 8'b11110111;
                    DIG = data_3;
                end else begin
                    anodos = 8'b11111111;
                    DIG = 4'b0000;
                end
            end
            3'b100: begin
                if (D4) begin
                    anodos = 8'b11101111;
                    DIG = data_4;
                end else begin
                    anodos = 8'b11111111;
                    DIG = 4'b0000;
                end
            end
            3'b101: begin
                if (D5) begin
                    anodos = 8'b11011111;
                    DIG = data_5;
                end else begin
                    anodos = 8'b11111111;
                    DIG = 4'b0000;
                end
            end
            3'b110: begin
                if (D6) begin
                    anodos = 8'b10111111;
                    DIG = data_6;
                end else begin
                    anodos = 8'b11111111;
                    DIG = 4'b0000;
                end
            end
            3'b111: begin
                if (D7) begin
                    anodos = 8'b01111111;
                    DIG = data_7;
                end else begin
                    anodos = 8'b11111111;
                    DIG = 4'b0000;
                end
            end
            default: begin
                anodos = 8'b11111111;
                DIG = 4'b0000;
            end
        endcase
    end

endmodule