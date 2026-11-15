module autovcoder_018129 (
    A,
    B,
    Ci,
    S,
    Co
);
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_74_2/carry[3] , \add_1_root_add_74_2/carry[2] ,
         \add_1_root_add_74_2/carry[1] ;

  FA_X1 \add_1_root_add_74_2/U1_0 (
      .A (A[0]),
      .B (B[0]),
      .CI(Ci),
      .CO(\add_1_root_add_74_2/carry[1] ),
      .S (S[0])
  );
  FA_X1 \add_1_root_add_74_2/U1_1 (
      .A (A[1]),
      .B (B[1]),
      .CI(\add_1_root_add_74_2/carry[1] ),
      .CO(\add_1_root_add_74_2/carry[2] ),
      .S (S[1])
  );
  FA_X1 \add_1_root_add_74_2/U1_2 (
      .A (A[2]),
      .B (B[2]),
      .CI(\add_1_root_add_74_2/carry[2] ),
      .CO(\add_1_root_add_74_2/carry[3] ),
      .S (S[2])
  );
  FA_X1 \add_1_root_add_74_2/U1_3 (
      .A (A[3]),
      .B (B[3]),
      .CI(\add_1_root_add_74_2/carry[3] ),
      .CO(Co),
      .S (S[3])
  );
endmodule

