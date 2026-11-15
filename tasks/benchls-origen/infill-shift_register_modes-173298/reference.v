module origen_173298(
    input CLK,
    input ENB,
    input DIR,
    input S_IN,
    input [1:0] MODO,
    input [3:0] D,
    output reg [3:0] Q,
    output reg S_OUT
);

    reg [1:0] MODO_TEMP;

    initial begin
        Q = 4'b0000;
    end

    always @(posedge CLK) begin
        if (ENB) begin
            MODO_TEMP <= MODO;
        end

        case (MODO_TEMP)
            2'b00: begin
                if (DIR) begin
                    Q <= {S_IN, Q[3:1]};
                    S_OUT <= Q[0];
                end else begin
                    Q <= {Q[2:0], S_IN};
                    S_OUT <= Q[3];
                end
            end
            2'b01: begin
                if (DIR) begin
                    Q <= {Q[0], Q[3:1]};
                    S_OUT <= Q[0];
                end else begin
                    Q <= {Q[2:0], Q[3]};
                    S_OUT <= Q[0];
                end
            end
            2'b10: begin
                Q <= D;
                S_OUT <= 1'b0;
            end
            default: begin
                Q <= Q;
                S_OUT <= 1'b0;
            end
        endcase
    end

endmodule