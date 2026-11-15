module origen_204674 (
    input [2:0] select,
    output reg AC, AR, IR, PC, R, DR, TR, Write
);

parameter ac = 3'b000;
parameter ar = 3'b001;
parameter dr = 3'b010;
parameter ir = 3'b011;
parameter pc = 3'b100;
parameter r = 3'b101;
parameter tr = 3'b110;
parameter ra = 3'b111;

[MASKED]

assign Write = (select == ac) || (select == ar) || (select == dr) || (select == ir) || (select == pc) || (select == r) || (select == tr) || (select == ra);

endmodule