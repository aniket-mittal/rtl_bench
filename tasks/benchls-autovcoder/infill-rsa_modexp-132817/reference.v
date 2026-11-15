module autovcoder_132817 (
    input clk,
    input rst,
    input [31:0] plaintext,
    input [31:0] e,
    input [31:0] n,
    output reg [31:0] ciphertext
);
    reg [31:0] result;
    reg [31:0] base;
    reg [31:0] exp;
    reg [31:0] mod;
    reg [4:0] state;

    parameter IDLE = 0, CALC = 1, DONE = 2;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            result <= 1;
            base <= plaintext;
            exp <= e;
            mod <= n;
            ciphertext <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (exp > 0) begin
                        state <= CALC;
                    end else begin
                        ciphertext <= 0;
                        state <= DONE;
                    end
                end
                CALC: begin
                    if (exp[0] == 1) begin
                        result <= (result * base) % mod;
                    end
                    base <= (base * base) % mod;
                    exp <= exp >> 1;
                    
                    if (exp == 0) begin
                        state <= DONE;
                    end
                end
                DONE: begin
                    ciphertext <= result;
                    state <= IDLE; // Reset to idle for next operation
                end
            endcase
        end
    end
endmodule