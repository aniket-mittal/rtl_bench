module origen_002869 (
    input wire clk,
    input wire rst,
    input wire ena,
    input wire [3:0] d,
    output reg [3:0] q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 4'b0000;
        else if (ena)
            q <= d;
    end
endmodule

module BT (
    input wire [3:0] I,
    input wire EN,
    output wire [3:0] Y
);
    assign Y = EN ? I : 4'bz;
endmodule

module ALUU (
    input wire [3:0] ACCU,
    input wire [3:0] BUFFER,
    input wire [2:0] S,
    output reg [3:0] SAL,
    output wire C,
    output wire ZERO
);
    reg [4:0] OF;

    always @(*) begin
        case (S)
            3'b000: OF = {1'b0, ACCU};
            3'b001: OF = {1'b0, ACCU} - {1'b0, BUFFER};
            3'b010: OF = {1'b0, BUFFER};
            3'b011: OF = {1'b0, ACCU} + {1'b0, BUFFER};
            3'b100: OF = {1'b0, ~(ACCU | BUFFER)};
            default: OF = 5'b00000;
        endcase
        SAL = OF[3:0];
    end

    assign C = OF[4];
    assign ZERO = (SAL == 4'b0000);
endmodule

module operacional (
    input wire clk,
    input wire rst,
    input wire ENA,
    input wire ENB,
    input wire ENC,
    input wire [2:0] S,
    input wire [3:0] OPRND,
    output wire [3:0] SAL,
    output wire [3:0] BUFFER_OUT,
    output wire [3:0] ALU_OUT,
    output wire [3:0] ACCU_OUT,
    output wire C,
    output wire ZERO
);
    wire [3:0] accu_to_alu;
    wire [3:0] buffer_to_alu;
    wire [3:0] alu_to_accu;

    ACCUMULATOR accu (
        .clk(clk),
        .rst(rst),
        .ena(ENA),
        .d(alu_to_accu),
        .q(accu_to_alu)
    );

    BT buffer (
        .I(OPRND),
        .EN(ENB),
        .Y(buffer_to_alu)
    );

    ALUU alu (
        .ACCU(accu_to_alu),
        .BUFFER(buffer_to_alu),
        .S(S),
        .SAL(alu_to_accu),
        .C(C),
        .ZERO(ZERO)
    );

    BT output_buffer (
        .I(alu_to_accu),
        .EN(ENC),
        .Y(SAL)
    );

    assign BUFFER_OUT = buffer_to_alu;
    assign ALU_OUT = alu_to_accu;
    assign ACCU_OUT = accu_to_alu;
endmodule