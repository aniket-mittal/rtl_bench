module origen_035976(
    input BTN,
    input CLK,
    output [7:0] DISP1
);

    parameter N = 50_000_000;

    reg [31:0] cnt;
    reg [3:0] count;
    reg [7:0] DISP2;

    always @(posedge CLK or posedge BTN) begin
        if (BTN) begin
            cnt <= 0;
            count <= 0;
        end else begin
            if (cnt == N - 1) begin
                cnt <= 0;
                if (count == 15)
                    count <= 0;
                else
                    count <= count + 1;
            end else begin
                cnt <= cnt + 1;
            end
        end
    end

    always @(*) begin
        case (count)
            4'h0: DISP2 = 8'b11000000; // 0
            4'h1: DISP2 = 8'b11111001; // 1
            4'h2: DISP2 = 8'b10100100; // 2
            4'h3: DISP2 = 8'b10110000; // 3
            4'h4: DISP2 = 8'b10011001; // 4
            4'h5: DISP2 = 8'b10010010; // 5
            4'h6: DISP2 = 8'b10000010; // 6
            4'h7: DISP2 = 8'b11111000; // 7
            4'h8: DISP2 = 8'b10000000; // 8
            4'h9: DISP2 = 8'b10010000; // 9
            4'ha: DISP2 = 8'b10001000; // A
            4'hb: DISP2 = 8'b10000011; // b
            4'hc: DISP2 = 8'b11000110; // C
            4'hd: DISP2 = 8'b10100001; // d
            4'he: DISP2 = 8'b10000110; // E
            4'hf: DISP2 = 8'b10001110; // F
            default: DISP2 = 8'b11111111; // All segments off
        endcase
    end

    assign DISP1 = DISP2;

endmodule