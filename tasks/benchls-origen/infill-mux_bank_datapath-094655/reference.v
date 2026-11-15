module origen_094655 (
    input wire [15:0] IN0, IN1, IN2,
    input wire [1:0] SELECT,
    output reg [15:0] OUT
);
    always @* begin
        case (SELECT)
            2'b00: OUT = IN0;
            2'b01: OUT = IN1;
            2'b10: OUT = IN2;
            default: OUT = 16'b0;
        endcase
    end
endmodule

module DR_MUX (
    input wire [2:0] IN,
    input wire SELECT,
    output reg [2:0] OUT
);
    always @* begin
        OUT = SELECT ? 3'b111 : IN;
    end
endmodule

module SR1_MUX (
    input wire [2:0] IN0, IN1,
    input wire SELECT,
    output reg [2:0] OUT
);
    always @* begin
        OUT = SELECT ? IN1 : IN0;
    end
endmodule

module SR2_MUX (
    input wire [15:0] IN0, IN1,
    input wire SELECT,
    output reg [15:0] OUT
);
    always @* begin
        OUT = SELECT ? IN1 : IN0;
    end
endmodule

module ADDR1_MUX (
    input wire [15:0] IN0, IN1,
    input wire SELECT,
    output reg [15:0] OUT
);
    always @* begin
        OUT = SELECT ? IN1 : IN0;
    end
endmodule

module ADDR2_MUX (
    input wire [15:0] IN0, IN1, IN2,
    input wire [1:0] SELECT,
    output reg [15:0] OUT
);
    always @* begin
        case (SELECT)
            2'b00: OUT = IN0;
            2'b01: OUT = IN1;
            2'b10: OUT = IN2;
            default: OUT = 16'b0;
        endcase
    end
endmodule

module GATE_MUX (
    input wire [15:0] IN0, IN1, IN2, IN3,
    input wire [3:0] SELECT,
    output reg [15:0] OUT
);
    always @* begin
        case (SELECT)
            4'b0001: OUT = IN0;
            4'b0010: OUT = IN1;
            4'b0100: OUT = IN2;
            4'b1000: OUT = IN3;
            default: OUT = 16'b0;
        endcase
    end
endmodule

module MDR_MUX (
    input wire [15:0] IN0, IN1,
    input wire SELECT,
    output reg [15:0] OUT
);
    always @* begin
        OUT = SELECT ? IN1 : IN0;
    end
endmodule