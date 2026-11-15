module origen_058880(
    input clk_out_seg,
    input reset,
    input [3:0] BCD1,
    input [3:0] BCD2,
    output reg [7:0] An,
    output reg [6:0] Seg
);

reg [3:0] BCD;
reg [1:0] S;

always @(posedge clk_out_seg or negedge reset) begin
    if (!reset) begin
        S <= 2'b00;
    end else begin
        An[7:4] <= 4'b1111;
        case (S)
            2'b01: begin
                An[3:0] <= 4'b1011;
                BCD <= BCD2;
            end
            2'b10: begin
                An[3:0] <= 4'b1101;
                BCD <= BCD1;
            end
            default: begin
                An[3:0] <= 4'b1111;
                BCD <= 4'b0000;
            end
        endcase
        S <= S + 1;
    end
end

always @(*) begin
    case (BCD)
        4'b0000: Seg = 7'b1000000; // 0
        4'b0001: Seg = 7'b1111001; // 1
        4'b0010: Seg = 7'b0100100; // 2
        4'b0011: Seg = 7'b0110000; // 3
        4'b0100: Seg = 7'b0011001; // 4
        4'b0101: Seg = 7'b0010010; // 5
        4'b0110: Seg = 7'b0000010; // 6
        4'b0111: Seg = 7'b1111000; // 7
        4'b1000: Seg = 7'b0000000; // 8
        4'b1001: Seg = 7'b0010000; // 9
        default: Seg = 7'b1111111; // All segments off
    endcase
end

endmodule