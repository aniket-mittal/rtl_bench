module origen_012159 (
    input EN,
    input [15:0] IN1,
    input [15:0] IN2,
    output [15:0] Q
);
    assign Q = EN ? IN1 : IN2;
endmodule

module switch (
    input EN,
    input IN,
    output Q1,
    output Q2
);
    assign Q1 = EN ? IN : 1'b0;
    assign Q2 = EN ? ~IN : 1'b0;
endmodule

module switch_321 (
    input [1:0] IN,
    output reg Q1,
    output reg Q2,
    output reg Q3
);
    always @(*) begin
        case (IN)
            2'b00: {Q1, Q2, Q3} = 3'b100;
            2'b01: {Q1, Q2, Q3} = 3'b010;
            2'b10: {Q1, Q2, Q3} = 3'b001;
            2'b11: {Q1, Q2, Q3} = 3'b000;
        endcase
    end
endmodule

module switch_323 (
    input [1:0] IN,
    input [15:0] DATA1,
    input [15:0] DATA2,
    input [31:0] DATA3,
    output reg [31:0] OUT
);
    always @(*) begin
        case (IN)
            2'b00: OUT = {16'b0, DATA1};
            2'b01: OUT = {16'b0, DATA2};
            2'b10: OUT = DATA3;
            2'b11: OUT = 32'b0;
        endcase
    end
endmodule