module origen_073740(
    input wire w,
    input wire clk,
    input wire aclr,
    output reg z
);

    // State encoding
    localparam A = 4'b0000, B = 4'b0001, C = 4'b0010, D = 4'b0011,
               E = 4'b0100, F = 4'b0101, G = 4'b0110, H = 4'b0111,
               I = 4'b1000;

    reg [3:0] y_Q, Y_D;

    // State transition logic
    always @(*) begin
        case (y_Q)
            A: Y_D = w ? F : B;
            B: Y_D = w ? F : C;
            C: Y_D = w ? F : D;
            D: Y_D = w ? F : E;
            E: Y_D = E;
            F: Y_D = w ? G : A;
            G: Y_D = w ? H : A;
            H: Y_D = w ? I : A;
            I: Y_D = I;
            default: Y_D = A;
        endcase
    end

    // State register with asynchronous clear
    always @(posedge clk or negedge aclr) begin
        if (!aclr)
            y_Q <= A;
        else
            y_Q <= Y_D;
    end

    // Output logic
    always @(*) begin
        z = (y_Q == E) || (y_Q == I);
    end

endmodule

module PS5_ZAD6(
    input wire [1:0] SW,
    input wire [0:0] KEY,
    output wire [9:9] LEDR
);

    FSM_user_coding fsm_inst(
        .w(SW[1]),
        .clk(KEY[0]),
        .aclr(SW[0]),
        .z(LEDR[9])
    );

endmodule