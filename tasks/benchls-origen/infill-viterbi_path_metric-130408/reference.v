module origen_130408(
    input [3:0] pm0, pm1, pm2, pm3,
    output d0, d1
);

    wire nor1_out, nor2_out, nor3_out, nor4_out;
    wire and1_out;
    wire aoi1_out, aoi2_out;
    wire or1_out;
    wire mux1_out;
    wire inv1_out;
    
    wire nand1_out, nand2_out;
    wire and2_out;
    wire aoi3_out;
    wire inv2_out;
    wire mux2_out;
    wire or2_out;
    wire inv3_out;

    // NOR gates
    nor #(1) nor1(nor1_out, pm0[0], pm1[0]);
    nor #(1) nor2(nor2_out, pm2[0], pm3[0]);
    nor #(1) nor3(nor3_out, pm0[1], pm1[1]);
    nor #(1) nor4(nor4_out, pm2[1], pm3[1]);

    // AND gate for d0
    and #(1) and1(and1_out, nor1_out, nor2_out);

    // AOI gates for d0
    assign aoi1_out = ~((pm0[2] & pm1[2]) | pm2[2]);
    assign aoi2_out = ~((pm1[3] & pm2[3]) | pm3[3]);

    // OR gate for d0
    or #(1) or1(or1_out, aoi1_out, aoi2_out);

    // 2-to-1 MUX for d0
    assign mux1_out = pm0[3] ? or1_out : and1_out;

    // Inverter for d0
    not #(1) inv1(d0, mux1_out);

    // NAND gates for d1
    nand #(1) nand1(nand1_out, nor1_out, nor3_out);
    nand #(1) nand2(nand2_out, nor2_out, nor4_out);

    // AND gate for d1
    and #(1) and2(and2_out, nand1_out, nand2_out);

    // Inverter for d1
    not #(1) inv2(inv2_out, pm1[2]);

    // 2-to-1 MUX for d1
    assign mux2_out = pm2[2] ? inv2_out : and2_out;

    // AOI gate for d1
    assign aoi3_out = ~((pm0[3] & pm1[3]) | pm2[3]);

    // OR gate for d1
    or #(1) or2(or2_out, mux2_out, aoi3_out);

    // Inverter for d1
    not #(1) inv3(d1, or2_out);

endmodule