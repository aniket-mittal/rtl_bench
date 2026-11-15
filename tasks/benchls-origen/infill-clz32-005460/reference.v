module origen_005460(
    input [1:0] a,
    output reg [1:0] z
);
    always @(*) begin
        case(a)
            2'b00: z = 2'd2;
            2'b01: z = 2'd1;
            default: z = 2'd0;
        endcase
    end
endmodule

module clz4(
    input [3:0] a,
    output [5:0] z
);
    wire [1:0] upper, lower;
    
    clz2 upper_clz(.a(a[3:2]), .z(upper));
    clz2 lower_clz(.a(a[1:0]), .z(lower));
    
    assign z = (upper == 2'd2) ? {4'b0, upper + lower} : {4'b0, upper};
endmodule

module clz8(
    input [7:0] a,
    output [5:0] z
);
    wire [5:0] upper, lower;
    
    clz4 upper_clz(.a(a[7:4]), .z(upper));
    clz4 lower_clz(.a(a[3:0]), .z(lower));
    
    assign z = (upper == 6'd4) ? upper + lower : upper;
endmodule

module clz16(
    input [15:0] a,
    output [5:0] z
);
    wire [5:0] upper, lower;
    
    clz8 upper_clz(.a(a[15:8]), .z(upper));
    clz8 lower_clz(.a(a[7:0]), .z(lower));
    
    assign z = (upper == 6'd8) ? upper + lower : upper;
endmodule

module clz32(
    input [31:0] a,
    output [5:0] z
);
    wire [5:0] upper, lower;
    
    clz16 upper_clz(.a(a[31:16]), .z(upper));
    clz16 lower_clz(.a(a[15:0]), .z(lower));
    
    assign z = (upper == 6'd16) ? upper + lower : upper;
endmodule