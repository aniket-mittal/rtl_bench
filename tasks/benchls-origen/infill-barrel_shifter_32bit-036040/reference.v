module origen_036040(
    input [31:0] A,
    input [31:0] B,
    input [1:0] ctrl,
    output [31:0] Shift_result
);

    wire [31:0] shift16_out, shift8_out, shift4_out, shift2_out;

    SHIFT_16 shift16(.a(B), .alufun(ctrl), .b(A[4]), .res(shift16_out));
    SHIFT_8  shift8 (.a(shift16_out), .alufun(ctrl), .b(A[3]), .res(shift8_out));
    SHIFT_4  shift4 (.a(shift8_out), .alufun(ctrl), .b(A[2]), .res(shift4_out));
    SHIFT_2  shift2 (.a(shift4_out), .alufun(ctrl), .b(A[1]), .res(shift2_out));
    SHIFT_1  shift1 (.a(shift2_out), .alufun(ctrl), .b(A[0]), .res(Shift_result));

endmodule

module SHIFT_16(
    input [31:0] a,
    input [1:0] alufun,
    input b,
    output reg [31:0] res
);

    always @(*) begin
        if (b) begin
            case (alufun)
                2'b00: res = {a[15:0], 16'b0};
                2'b01: res = {16'b0, a[31:16]};
                2'b11: res = {{16{a[31]}}, a[31:16]};
                default: res = a;
            endcase
        end else begin
            res = a;
        end
    end

endmodule

module SHIFT_8(
    input [31:0] a,
    input [1:0] alufun,
    input b,
    output reg [31:0] res
);

    always @(*) begin
        if (b) begin
            case (alufun)
                2'b00: res = {a[23:0], 8'b0};
                2'b01: res = {8'b0, a[31:8]};
                2'b11: res = {{8{a[31]}}, a[31:8]};
                default: res = a;
            endcase
        end else begin
            res = a;
        end
    end

endmodule

module SHIFT_4(
    input [31:0] a,
    input [1:0] alufun,
    input b,
    output reg [31:0] res
);

    always @(*) begin
        if (b) begin
            case (alufun)
                2'b00: res = {a[27:0], 4'b0};
                2'b01: res = {4'b0, a[31:4]};
                2'b11: res = {{4{a[31]}}, a[31:4]};
                default: res = a;
            endcase
        end else begin
            res = a;
        end
    end

endmodule

module SHIFT_2(
    input [31:0] a,
    input [1:0] alufun,
    input b,
    output reg [31:0] res
);

    always @(*) begin
        if (b) begin
            case (alufun)
                2'b00: res = {a[29:0], 2'b0};
                2'b01: res = {2'b0, a[31:2]};
                2'b11: res = {{2{a[31]}}, a[31:2]};
                default: res = a;
            endcase
        end else begin
            res = a;
        end
    end

endmodule

module SHIFT_1(
    input [31:0] a,
    input [1:0] alufun,
    input b,
    output reg [31:0] res
);

    always @(*) begin
        if (b) begin
            case (alufun)
                2'b00: res = {a[30:0], 1'b0};
                2'b01: res = {1'b0, a[31:1]};
                2'b11: res = {a[31], a[31:1]};
                default: res = a;
            endcase
        end else begin
            res = a;
        end
    end

endmodule