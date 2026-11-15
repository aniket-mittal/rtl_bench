module origen_076729(
    input [15:0] a,
    input one_j, two_j, sign_j,
    output [16:0] results
);
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : gen_pp
            if (i == 0)
                ppij_mb pp_inst(.a_i(a[i]), .a_im(1'b0), .one_j(one_j), .two_j(two_j), .sign_j(sign_j), .p_ij(results[i]));
            else
                ppij_mb pp_inst(.a_i(a[i]), .a_im(a[i-1]), .one_j(one_j), .two_j(two_j), .sign_j(sign_j), .p_ij(results[i]));
        end
    endgenerate
    
    not_ppij_mb not_pp_inst(.a_i(a[15]), .a_im(a[14]), .one_j(one_j), .two_j(two_j), .sign_j(sign_j), .p_ij(results[16]));
endmodule

module ppij_mb(
    input a_i, a_im, one_j, two_j, sign_j,
    output p_ij
);
    assign p_ij = ((a_i & one_j) | (a_im & two_j)) ^ sign_j;
endmodule

module not_ppij_mb(
    input a_i, a_im, one_j, two_j, sign_j,
    output p_ij
);
    wire temp;
    ppij_mb pp_inst(.a_i(a_i), .a_im(a_im), .one_j(one_j), .two_j(two_j), .sign_j(sign_j), .p_ij(temp));
    assign p_ij = ~temp;
endmodule

module pp_nr4sdm_generator(
    input [15:0] a,
    input one_jp, one_jm, two_jm,
    output [16:0] results
);
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : gen_pp
            if (i == 0)
                ppij_nr4sdm pp_inst(.a_i(a[i]), .a_im(1'b0), .one_jp(one_jp), .one_jm(one_jm), .two_jm(two_jm), .p_ij(results[i]));
            else
                ppij_nr4sdm pp_inst(.a_i(a[i]), .a_im(a[i-1]), .one_jp(one_jp), .one_jm(one_jm), .two_jm(two_jm), .p_ij(results[i]));
        end
    endgenerate
    
    not_ppij_nr4sdm not_pp_inst(.a_i(a[15]), .a_im(a[14]), .one_jp(one_jp), .one_jm(one_jm), .two_jm(two_jm), .p_ij(results[16]));
endmodule

module ppij_nr4sdm(
    input a_i, a_im, one_jp, one_jm, two_jm,
    output p_ij
);
    assign p_ij = (a_i & one_jp) ^ (~a_im & two_jm) ^ (~a_i & one_jm);
endmodule

module not_ppij_nr4sdm(
    input a_i, a_im, one_jp, one_jm, two_jm,
    output p_ij
);
    wire temp;
    ppij_nr4sdm pp_inst(.a_i(a_i), .a_im(a_im), .one_jp(one_jp), .one_jm(one_jm), .two_jm(two_jm), .p_ij(temp));
    assign p_ij = ~temp;
endmodule

module pp_nr4sdp_generator(
    input [15:0] a,
    input one_jp, one_jm, two_jp,
    output [16:0] results
);
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : gen_pp
            if (i == 0)
                ppij_nr4sdp pp_inst(.a_i(a[i]), .a_im(1'b0), .one_jp(one_jp), .one_jm(one_jm), .two_jp(two_jp), .p_ij(results[i]));
            else
                ppij_nr4sdp pp_inst(.a_i(a[i]), .a_im(a[i-1]), .one_jp(one_jp), .one_jm(one_jm), .two_jp(two_jp), .p_ij(results[i]));
        end
    endgenerate
    
    not_ppij_nr4sdp not_pp_inst(.a_i(a[15]), .a_im(a[14]), .one_jp(one_jp), .one_jm(one_jm), .two_jp(two_jp), .p_ij(results[16]));
endmodule

module ppij_nr4sdp(
    input a_i, a_im, one_jp, one_jm, two_jp,
    output p_ij
);
    assign p_ij = (a_i & one_jp) ^ (a_im & two_jp) ^ (~a_i & one_jm);
endmodule

module not_ppij_nr4sdp(
    input a_i, a_im, one_jp, one_jm, two_jp,
    output p_ij
);
    wire temp;
    ppij_nr4sdp pp_inst(.a_i(a_i), .a_im(a_im), .one_jp(one_jp), .one_jm(one_jm), .two_jp(two_jp), .p_ij(temp));
    assign p_ij = ~temp;
endmodule