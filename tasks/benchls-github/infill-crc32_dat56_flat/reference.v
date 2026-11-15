module crc32_dat56_flat (crc_in,dat_in,crc_out);
input [31:0] crc_in;
input [55:0] dat_in;
output [31:0] crc_out;

wire [31:0] crc_out;

wire x23, x22, x21, x20, x19, x18, x17, 
       x16, x15, x14, x13, x12, x11, x10, x9, 
       x8, x7, x6, x5, x4, x3, x2, x1, 
       x0, x31, x30, x29, x28, x27, x26, x25, 
       x24;

assign crc_out = {x31,x30,x29,x28,x27,x26,x25,x24,x23,x22,x21,x20,x19,x18,x17,
        x16,x15,x14,x13,x12,x11,x10,x9,x8,x7,x6,x5,x4,x3,x2,x1,
        x0};

wire d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,
    d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,
    d31,d32,d33,d34,d35,d36,d37,d38,d39,d40,d41,d42,d43,d44,d45,d46,
    d47,d48,d49,d50,d51,d52,d53,d54,d55;

assign { d55,d54,d53,d52,d51,d50,d49,d48,d47,d46,d45,d44,d43,d42,d41,
        d40,d39,d38,d37,d36,d35,d34,d33,d32,d31,d30,d29,d28,d27,d26,d25,
        d24,d23,d22,d21,d20,d19,d18,d17,d16,d15,d14,d13,d12,d11,d10,d9,
        d8,d7,d6,d5,d4,d3,d2,d1,d0} = dat_in [55:0];

wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,
    c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,
    c31;

assign { c31,c30,c29,c28,c27,c26,c25,c24,c23,c22,c21,c20,c19,c18,c17,
        c16,c15,c14,c13,c12,c11,c10,c9,c8,c7,c6,c5,c4,c3,c2,c1,
        c0} = crc_in [31:0];

    assign x23 = d29 ^ d47 ^ c7 ^ c26 ^ c11 ^ d13 ^ d17 ^ c25 ^ c18 ^ 
        d49 ^ c10 ^ d38 ^ d54 ^ d55 ^ c12 ^ d50 ^ d20 ^ d36 ^ d39 ^ 
        d34 ^ d6 ^ d16 ^ d9 ^ d0 ^ d19 ^ c30 ^ c22 ^ c3 ^ c14 ^ 
        c15 ^ c5 ^ d1 ^ d31 ^ d15 ^ c23 ^ d46 ^ d42 ^ c2 ^ c31 ^ 
        d26 ^ d35 ^ d27;  // 42 ins 1 outs

    assign x22 = c24 ^ d44 ^ c21 ^ c20 ^ d36 ^ d43 ^ d19 ^ d16 ^ d9 ^ 
        d55 ^ c19 ^ d14 ^ c3 ^ d52 ^ d41 ^ d18 ^ c2 ^ c12 ^ c28 ^ 
        c31 ^ d11 ^ c0 ^ c7 ^ c10 ^ c13 ^ c11 ^ d38 ^ d45 ^ c23 ^ 
        d35 ^ c14 ^ d0 ^ c17 ^ d31 ^ d26 ^ d37 ^ d23 ^ d27 ^ d47 ^ 
        d29 ^ d48 ^ d24 ^ c5 ^ d12 ^ d34;  // 45 ins 1 outs

    assign x21 = d34 ^ d9 ^ d5 ^ d17 ^ d40 ^ c25 ^ c2 ^ d29 ^ d35 ^ 
        c16 ^ d51 ^ d22 ^ d18 ^ d52 ^ d53 ^ d24 ^ d31 ^ d42 ^ c28 ^ 
        c5 ^ c0 ^ c10 ^ d37 ^ c7 ^ d49 ^ c18 ^ c29 ^ c11 ^ c13 ^ 
        c27 ^ d13 ^ d10 ^ c3 ^ d26 ^ d27;  // 35 ins 1 outs

    assign x20 = d39 ^ d30 ^ d36 ^ d33 ^ c15 ^ d50 ^ c24 ^ d28 ^ c31 ^ 
        d16 ^ d9 ^ c28 ^ c26 ^ d34 ^ d41 ^ d52 ^ d26 ^ c17 ^ c12 ^ 
        c2 ^ c6 ^ d25 ^ d8 ^ d55 ^ c10 ^ d48 ^ c1 ^ c4 ^ c27 ^ 
        d17 ^ d21 ^ d23 ^ c9 ^ d51 ^ d4 ^ d12;  // 36 ins 1 outs

    assign x19 = c30 ^ c8 ^ d54 ^ d29 ^ d32 ^ d11 ^ c23 ^ c9 ^ d50 ^ 
        c14 ^ d33 ^ d16 ^ d35 ^ c27 ^ d47 ^ d27 ^ c16 ^ c3 ^ d51 ^ 
        d40 ^ d22 ^ d15 ^ d38 ^ c11 ^ d49 ^ d7 ^ d3 ^ d20 ^ c25 ^ 
        c5 ^ c26 ^ d25 ^ c1 ^ d24 ^ c0 ^ d8;  // 36 ins 1 outs

    assign x18 = d46 ^ d39 ^ d34 ^ d53 ^ d32 ^ c10 ^ d31 ^ d10 ^ d15 ^ 
        c8 ^ d37 ^ d48 ^ c4 ^ c7 ^ d6 ^ d26 ^ d7 ^ d50 ^ c24 ^ 
        d24 ^ c29 ^ d14 ^ d2 ^ c13 ^ c2 ^ c15 ^ d49 ^ c0 ^ d19 ^ 
        c26 ^ c25 ^ d28 ^ c22 ^ d21 ^ d23;  // 35 ins 1 outs

    assign x17 = d1 ^ c14 ^ d38 ^ d13 ^ d25 ^ d23 ^ d36 ^ d18 ^ d27 ^ 
        d49 ^ d47 ^ c1 ^ d52 ^ d14 ^ d45 ^ c12 ^ d5 ^ d9 ^ d48 ^ 
        c9 ^ c23 ^ c28 ^ c6 ^ d33 ^ c3 ^ d30 ^ c7 ^ d20 ^ c24 ^ 
        d6 ^ c21 ^ d22 ^ c25 ^ d31;  // 34 ins 1 outs

    assign x16 = d37 ^ d47 ^ c5 ^ c11 ^ c2 ^ d19 ^ c22 ^ d4 ^ c0 ^ 
        d21 ^ d0 ^ d30 ^ d44 ^ d22 ^ d26 ^ c23 ^ d32 ^ d29 ^ c20 ^ 
        c24 ^ c6 ^ c27 ^ c8 ^ d35 ^ d48 ^ d51 ^ d13 ^ d17 ^ d24 ^ 
        d8 ^ c13 ^ d12 ^ d5 ^ d46;  // 34 ins 1 outs

    assign x15 = d34 ^ d33 ^ d3 ^ c26 ^ d54 ^ d30 ^ c20 ^ d12 ^ d15 ^ 
        d4 ^ d7 ^ c31 ^ d55 ^ d18 ^ c29 ^ c30 ^ d50 ^ d20 ^ d21 ^ 
        d9 ^ d27 ^ c28 ^ c0 ^ d8 ^ d5 ^ d24 ^ c3 ^ d45 ^ c6 ^ 
        d44 ^ c9 ^ d49 ^ c25 ^ c21 ^ c10 ^ d16 ^ d52 ^ d53;  // 38 ins 1 outs

    assign x14 = d32 ^ d26 ^ d14 ^ d7 ^ d33 ^ d55 ^ d44 ^ d17 ^ c30 ^ 
        c27 ^ c24 ^ d49 ^ d8 ^ d54 ^ c20 ^ d2 ^ d4 ^ c28 ^ c25 ^ 
        d20 ^ c29 ^ d6 ^ d15 ^ d3 ^ c8 ^ d43 ^ c2 ^ d11 ^ c9 ^ 
        d53 ^ c19 ^ d51 ^ d19 ^ d29 ^ d48 ^ d23 ^ c5 ^ c31 ^ d52;  // 39 ins 1 outs

    assign x13 = c28 ^ d19 ^ d31 ^ c27 ^ d13 ^ d53 ^ d55 ^ c1 ^ d1 ^ 
        d48 ^ c23 ^ d2 ^ d14 ^ d7 ^ d54 ^ d52 ^ c18 ^ d3 ^ d22 ^ 
        d51 ^ d47 ^ d43 ^ d18 ^ c7 ^ c19 ^ c24 ^ c31 ^ c8 ^ d50 ^ 
        d32 ^ c4 ^ c26 ^ d5 ^ d42 ^ c30 ^ d6 ^ c29 ^ d16 ^ d28 ^ 
        d25 ^ d10;  // 41 ins 1 outs

    assign x12 = c0 ^ d54 ^ c29 ^ c6 ^ d13 ^ d21 ^ d50 ^ c25 ^ d15 ^ 
        d27 ^ c27 ^ d41 ^ c17 ^ d51 ^ d2 ^ d6 ^ d5 ^ d24 ^ d49 ^ 
        c3 ^ d12 ^ c22 ^ d9 ^ d52 ^ c30 ^ d0 ^ c26 ^ d4 ^ d46 ^ 
        d18 ^ d30 ^ d42 ^ d53 ^ c28 ^ c7 ^ d17 ^ d1 ^ d31 ^ d47 ^ 
        c18 ^ c23;  // 41 ins 1 outs

    assign x11 = d51 ^ d12 ^ c4 ^ d50 ^ c19 ^ d43 ^ d33 ^ d54 ^ c3 ^ 
        c16 ^ c20 ^ d48 ^ d27 ^ d17 ^ c9 ^ d9 ^ c21 ^ d20 ^ d40 ^ 
        d41 ^ d44 ^ d28 ^ c31 ^ d15 ^ c27 ^ d1 ^ d3 ^ d16 ^ d31 ^ 
        d25 ^ d26 ^ c26 ^ c7 ^ d47 ^ c17 ^ d24 ^ d36 ^ c30 ^ c23 ^ 
        c2 ^ c12 ^ c0 ^ d45 ^ d14 ^ c24 ^ c1 ^ d55 ^ d0 ^ d4;  // 49 ins 1 outs

    assign x10 = d36 ^ c2 ^ d3 ^ c12 ^ d42 ^ d31 ^ c4 ^ c8 ^ c31 ^ 
        d5 ^ d16 ^ c15 ^ c11 ^ d50 ^ c5 ^ d52 ^ d26 ^ c28 ^ c26 ^ 
        d2 ^ c7 ^ d40 ^ d19 ^ d32 ^ d29 ^ d35 ^ d28 ^ c9 ^ d9 ^ 
        d55 ^ d0 ^ d13 ^ d14 ^ d33 ^ c18 ^ d39 ^ c16;  // 37 ins 1 outs

    assign x9 = d47 ^ c23 ^ d35 ^ c17 ^ d4 ^ d53 ^ d29 ^ c31 ^ d52 ^ 
        c8 ^ d18 ^ c9 ^ c15 ^ d33 ^ d32 ^ c29 ^ c27 ^ c5 ^ d39 ^ 
        c22 ^ d34 ^ c10 ^ d38 ^ d46 ^ c14 ^ d13 ^ d24 ^ d41 ^ c28 ^ 
        c0 ^ d23 ^ d44 ^ d51 ^ d43 ^ c12 ^ c11 ^ d11 ^ c20 ^ d12 ^ 
        d55 ^ d5 ^ d2 ^ c19 ^ d1 ^ d36 ^ d9;  // 46 ins 1 outs

    assign x8 = d31 ^ d54 ^ d0 ^ d51 ^ d40 ^ c16 ^ d52 ^ d37 ^ d17 ^ 
        c30 ^ d3 ^ d45 ^ d32 ^ c13 ^ d12 ^ d33 ^ c8 ^ d46 ^ d35 ^ 
        c4 ^ d34 ^ c18 ^ d50 ^ d23 ^ d43 ^ c22 ^ d8 ^ c26 ^ d22 ^ 
        c7 ^ c21 ^ d28 ^ d10 ^ c28 ^ d42 ^ c27 ^ c10 ^ c14 ^ c9 ^ 
        d4 ^ d38 ^ c11 ^ d11 ^ c19 ^ d1;  // 45 ins 1 outs

    assign x7 = d37 ^ d16 ^ c10 ^ d47 ^ d8 ^ d39 ^ d54 ^ c0 ^ c1 ^ 
        d3 ^ d51 ^ c26 ^ c19 ^ d43 ^ d42 ^ c27 ^ c4 ^ d24 ^ d7 ^ 
        c8 ^ c17 ^ c22 ^ d45 ^ d0 ^ d46 ^ d25 ^ c18 ^ d29 ^ d50 ^ 
        c21 ^ d21 ^ d10 ^ d2 ^ d23 ^ d5 ^ c30 ^ d15 ^ c23 ^ c28 ^ 
        c15 ^ c5 ^ d32 ^ d41 ^ d22 ^ c13 ^ d34 ^ d52 ^ d28;  // 48 ins 1 outs

    assign x6 = c21 ^ d50 ^ c6 ^ c1 ^ c30 ^ d52 ^ c31 ^ d25 ^ d42 ^ 
        d47 ^ d8 ^ c5 ^ d11 ^ d41 ^ c17 ^ d21 ^ d2 ^ c26 ^ d4 ^ 
        d30 ^ c23 ^ d38 ^ d29 ^ d22 ^ c28 ^ c27 ^ d40 ^ d7 ^ c18 ^ 
        d54 ^ c14 ^ d5 ^ d6 ^ d51 ^ d45 ^ d14 ^ d55 ^ d20 ^ d1 ^ 
        c16 ^ c19 ^ d43;  // 42 ins 1 outs

    assign x5 = c25 ^ d29 ^ c31 ^ d55 ^ c26 ^ d24 ^ d46 ^ c20 ^ d49 ^ 
        c22 ^ d41 ^ d40 ^ d4 ^ d50 ^ c27 ^ d5 ^ c29 ^ d53 ^ d20 ^ 
        c16 ^ d21 ^ d19 ^ d28 ^ d6 ^ c4 ^ c18 ^ d37 ^ c30 ^ d1 ^ 
        d39 ^ d0 ^ d54 ^ d13 ^ d7 ^ c15 ^ c17 ^ d51 ^ d3 ^ c5 ^ 
        d10 ^ c0 ^ c13 ^ d44 ^ d42;  // 44 ins 1 outs

    assign x4 = d24 ^ d48 ^ d29 ^ d47 ^ d6 ^ d18 ^ c26 ^ d8 ^ d19 ^ 
        d15 ^ c7 ^ d44 ^ c0 ^ d4 ^ d0 ^ d38 ^ d40 ^ c16 ^ d12 ^ 
        c24 ^ d50 ^ d33 ^ c6 ^ c1 ^ d3 ^ d46 ^ d20 ^ d11 ^ c15 ^ 
        d45 ^ d39 ^ c5 ^ c22 ^ d2 ^ d31 ^ c9 ^ d25 ^ d30 ^ c20 ^ 
        c17 ^ c21 ^ c23 ^ c14 ^ d41;  // 44 ins 1 outs

    assign x3 = d10 ^ d32 ^ d31 ^ c3 ^ d33 ^ c8 ^ d2 ^ d52 ^ d17 ^ 
        c7 ^ d38 ^ d14 ^ d7 ^ d3 ^ d27 ^ d54 ^ d19 ^ d15 ^ d40 ^ 
        d45 ^ c1 ^ c16 ^ d1 ^ c13 ^ c15 ^ d39 ^ c12 ^ c30 ^ d37 ^ 
        d8 ^ d36 ^ d53 ^ c9 ^ c14 ^ d25 ^ c21 ^ d9 ^ c28 ^ c29 ^ 
        d18;  // 40 ins 1 outs

    assign x2 = d26 ^ c31 ^ c11 ^ d32 ^ d51 ^ d30 ^ d6 ^ d24 ^ c29 ^ 
        c0 ^ c7 ^ d16 ^ c2 ^ d53 ^ d1 ^ d36 ^ d39 ^ c6 ^ d14 ^ 
        c13 ^ c20 ^ c15 ^ d9 ^ d35 ^ d55 ^ d37 ^ d2 ^ c12 ^ d17 ^ 
        d44 ^ d38 ^ c28 ^ d7 ^ c8 ^ d18 ^ c14 ^ d52 ^ d13 ^ c27 ^ 
        d31 ^ d8 ^ d0;  // 42 ins 1 outs

    assign x1 = d44 ^ d37 ^ d16 ^ d1 ^ d0 ^ c27 ^ d27 ^ d11 ^ c11 ^ 
        c13 ^ d51 ^ d13 ^ c14 ^ d7 ^ d38 ^ d12 ^ d17 ^ d50 ^ c26 ^ 
        d35 ^ d24 ^ d49 ^ c0 ^ c23 ^ c25 ^ d47 ^ c29 ^ d9 ^ c9 ^ 
        d53 ^ d34 ^ c20 ^ c22 ^ d28 ^ d46 ^ c10 ^ d6 ^ c4 ^ c3 ^ 
        d33;  // 40 ins 1 outs

    assign x0 = d10 ^ d0 ^ d55 ^ c1 ^ d9 ^ d50 ^ c8 ^ c6 ^ c24 ^ 
        d44 ^ d37 ^ d16 ^ c4 ^ d6 ^ c10 ^ d28 ^ c21 ^ c20 ^ d34 ^ 
        d12 ^ c13 ^ d32 ^ c5 ^ d45 ^ c0 ^ d54 ^ d53 ^ c2 ^ c29 ^ 
        c23 ^ c30 ^ d24 ^ d48 ^ d29 ^ d47 ^ c7 ^ c26 ^ d26 ^ c31 ^ 
        d30 ^ d25 ^ d31;  // 42 ins 1 outs

    assign x31 = d49 ^ d54 ^ d52 ^ c29 ^ d31 ^ d43 ^ d24 ^ c28 ^ d23 ^ 
        d29 ^ c5 ^ c23 ^ d8 ^ c3 ^ d25 ^ c0 ^ c12 ^ c9 ^ d5 ^ 
        d28 ^ d44 ^ d15 ^ d30 ^ d46 ^ d47 ^ c4 ^ d11 ^ c1 ^ d9 ^ 
        d27 ^ c20 ^ d53 ^ c25 ^ d33 ^ c22 ^ c19 ^ d36 ^ c30 ^ c6 ^ 
        c7;  // 40 ins 1 outs

    assign x30 = d14 ^ d29 ^ d4 ^ d23 ^ c8 ^ c18 ^ d30 ^ d48 ^ d8 ^ 
        d26 ^ c22 ^ c5 ^ c0 ^ d46 ^ c11 ^ d35 ^ d52 ^ c28 ^ c6 ^ 
        d24 ^ d10 ^ d7 ^ c3 ^ d45 ^ d22 ^ d28 ^ c2 ^ c19 ^ d32 ^ 
        c4 ^ c27 ^ d43 ^ d51 ^ d53 ^ c24 ^ d42 ^ c29 ^ c21 ^ d27;  // 39 ins 1 outs

    assign x29 = d50 ^ d55 ^ c27 ^ d7 ^ c20 ^ c31 ^ d23 ^ d29 ^ c1 ^ 
        c10 ^ d6 ^ c2 ^ c17 ^ d31 ^ c23 ^ c21 ^ d13 ^ d42 ^ d9 ^ 
        d44 ^ d26 ^ d28 ^ c7 ^ c18 ^ d47 ^ d27 ^ d25 ^ d45 ^ c3 ^ 
        d3 ^ c4 ^ c5 ^ d22 ^ d34 ^ d51 ^ c26 ^ d41 ^ d52 ^ c28 ^ 
        d21;  // 40 ins 1 outs

    assign x28 = d30 ^ c27 ^ d21 ^ d12 ^ d26 ^ d22 ^ d24 ^ d2 ^ c3 ^ 
        d33 ^ c2 ^ d41 ^ d49 ^ c9 ^ c1 ^ d51 ^ c4 ^ c17 ^ d50 ^ 
        d8 ^ c26 ^ d5 ^ c6 ^ d46 ^ c25 ^ d25 ^ c0 ^ d20 ^ d28 ^ 
        d6 ^ c22 ^ d27 ^ d44 ^ c20 ^ c30 ^ d43 ^ c19 ^ c16 ^ d54 ^ 
        d40;  // 40 ins 1 outs

    assign x27 = c3 ^ c25 ^ d4 ^ d5 ^ d29 ^ d55 ^ c29 ^ c18 ^ d45 ^ 
        c31 ^ d25 ^ d49 ^ d7 ^ c15 ^ d53 ^ d42 ^ c2 ^ d24 ^ c5 ^ 
        d19 ^ d39 ^ d11 ^ d48 ^ c24 ^ c26 ^ c16 ^ d40 ^ c0 ^ d27 ^ 
        c19 ^ d1 ^ d26 ^ c21 ^ c1 ^ c8 ^ d20 ^ d32 ^ d23 ^ d21 ^ 
        d43 ^ d50;  // 41 ins 1 outs

    assign x26 = c0 ^ c23 ^ d6 ^ c20 ^ d38 ^ d19 ^ d28 ^ c15 ^ c18 ^ 
        c4 ^ d54 ^ d48 ^ c31 ^ d3 ^ c28 ^ d4 ^ c7 ^ d31 ^ d23 ^ 
        d44 ^ c2 ^ c24 ^ c1 ^ d55 ^ d0 ^ d42 ^ d22 ^ d10 ^ c14 ^ 
        d39 ^ d41 ^ d25 ^ c17 ^ d26 ^ d47 ^ d20 ^ d18 ^ d49 ^ d24 ^ 
        c25 ^ d52 ^ c30;  // 42 ins 1 outs

    assign x25 = d2 ^ c25 ^ c5 ^ d33 ^ d38 ^ d28 ^ d36 ^ d49 ^ d22 ^ 
        c20 ^ c24 ^ d3 ^ d8 ^ c14 ^ d52 ^ d31 ^ c4 ^ d21 ^ d37 ^ 
        d18 ^ d11 ^ c17 ^ c12 ^ c9 ^ c7 ^ c28 ^ d51 ^ c13 ^ c27 ^ 
        d41 ^ c16 ^ d40 ^ d17 ^ d15 ^ d19 ^ d44 ^ d29 ^ d48;  // 38 ins 1 outs

    assign x24 = c24 ^ d10 ^ d28 ^ d48 ^ c26 ^ d27 ^ c19 ^ c6 ^ d32 ^ 
        d7 ^ d51 ^ d18 ^ d21 ^ c13 ^ d30 ^ d43 ^ d35 ^ c31 ^ c8 ^ 
        c11 ^ d40 ^ d37 ^ d16 ^ c27 ^ c12 ^ c23 ^ d17 ^ d2 ^ c16 ^ 
        d55 ^ d20 ^ d1 ^ d50 ^ c15 ^ d14 ^ c3 ^ d39 ^ d36 ^ d47 ^ 
        c4;  // 40 ins 1 outs

endmodule