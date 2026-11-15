module origen_018409(
    input [24:0] DI,
    input [4:0] sel,
    output [24:0] DO
);

    wire [24:0] stage0, stage1, stage2, stage3;

    shiftleftby16 s4(.DI(DI), .sel(sel[4]), .DO(stage3));
    shiftleftby8  s3(.DI(stage3), .sel(sel[3]), .DO(stage2));
    shiftleftby4  s2(.DI(stage2), .sel(sel[2]), .DO(stage1));
    shiftleftby2  s1(.DI(stage1), .sel(sel[1]), .DO(stage0));
    shiftleftby1  s0(.DI(stage0), .sel(sel[0]), .DO(DO));

endmodule

module shiftleftby16(
    input [24:0] DI,
    input sel,
    output [24:0] DO
);

    assign DO = sel ? {DI[8:0], 16'b0} : DI;

endmodule

module shiftleftby8(
    input [24:0] DI,
    input sel,
    output [24:0] DO
);

    assign DO = sel ? {DI[16:0], 8'b0} : DI;

endmodule

module shiftleftby4(
    input [24:0] DI,
    input sel,
    output [24:0] DO
);

    assign DO = sel ? {DI[20:0], 4'b0} : DI;

endmodule

module shiftleftby2(
    input [24:0] DI,
    input sel,
    output [24:0] DO
);

    assign DO = sel ? {DI[22:0], 2'b0} : DI;

endmodule

module shiftleftby1(
    input [24:0] DI,
    input sel,
    output [24:0] DO
);

    assign DO = sel ? {DI[23:0], 1'b0} : DI;

endmodule