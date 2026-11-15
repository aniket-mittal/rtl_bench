module origen_113087 (
    input wire clk,
    input wire reset,
    input wire start,
    input wire signed [15:0] num,
    input wire signed [15:0] den,
    output reg signed [15:0] result,
    output reg done
);

    localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
    reg [1:0] state, next_state;
    reg signed [25:0] temp_num, temp_den;
    reg num_sign, den_sign;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            result <= 16'b0;
            done <= 1'b0;
        end else begin
            state <= next_state;
            case (state)
                S0: begin
                    if (start) begin
                        num_sign <= num[15];
                        den_sign <= den[15];
                        temp_num <= num_sign ? (~num + 1'b1) : num;
                        temp_den <= den_sign ? (~den + 1'b1) : den;
                    end
                    done <= 1'b0;
                end
                S1: begin
                    result <= temp_num[25:10] / temp_den[20:5];
                    done <= 1'b1;
                end
                S2: begin
                    result <= ~(temp_num[25:10] / temp_den[20:5]) + 1'b1;
                    done <= 1'b1;
                end
            endcase
        end
    end

    always @(*) begin
        case (state)
            S0: next_state = start ? (num_sign ^ den_sign ? S2 : S1) : S0;
            S1, S2: next_state = start ? state : S0;
            default: next_state = S0;
        endcase
    end

endmodule