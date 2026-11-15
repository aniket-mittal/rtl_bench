// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_112257 dut (
    .X(in_vec[63:32]),
    .Y(in_vec[31:0]),
    .result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h2dd3ad4e94c6e97b;
    stim[1] = 64'h1b0c85a5aaa96a51;
    stim[2] = 64'haa4cf515901e6368;
    stim[3] = 64'h534c219d301456a4;
    stim[4] = 64'he6557092cbc29dc3;
    stim[5] = 64'h8ac1ea0a93077d69;
    stim[6] = 64'h82e92825e651b35f;
    stim[7] = 64'h6e62481ab8b11095;
    stim[8] = 64'h7524b9e7e1d031df;
    stim[9] = 64'h34ae2d836174bfc6;
    stim[10] = 64'h2ec160c31f6f8f58;
    stim[11] = 64'hb9ac3aa8d4e1c010;
    stim[12] = 64'h5c6aa216d11cdecd;
    stim[13] = 64'h9d23ff39c00239be;
    stim[14] = 64'h7b11619bfbee3047;
    stim[15] = 64'h08725e15eb530753;
    stim[16] = 64'hb7758f1188d6adf9;
    stim[17] = 64'h2a4da4cc7751ecb7;
    stim[18] = 64'h02e4e41e69da12b5;
    stim[19] = 64'h02f50b5d96d797db;
    stim[20] = 64'h41a100c4537fea5c;
    stim[21] = 64'h5ca53cdece8e0293;
    stim[22] = 64'h7fc189b128e7f548;
    stim[23] = 64'h660fce8d3fa68ebd;
    stim[24] = 64'h7eb1e1bb512ad3fc;
    stim[25] = 64'he9414137f30e9be8;
    stim[26] = 64'hf2e82f3b2bdd2976;
    stim[27] = 64'h62d0a65e45cfd4c4;
    stim[28] = 64'h86f987df450849b6;
    stim[29] = 64'h6796c66821e5daad;
    stim[30] = 64'hd7f3e1899fc415cf;
    stim[31] = 64'hfd30e7f4efd06068;
    stim[32] = 64'hf4111646766d0996;
    stim[33] = 64'hdb707bf1a908655f;
    stim[34] = 64'h6c821ef4065af5b4;
    stim[35] = 64'h8c7d37f6bf4c71cd;
    stim[36] = 64'h4c830cff8447eabf;
    stim[37] = 64'h7745a11730245601;
    stim[38] = 64'ha0583f3557de36bc;
    stim[39] = 64'hffbd4c34f18dd784;
    stim[40] = 64'h40f0f853a4cfa447;
    stim[41] = 64'hdfc6b424d50878f9;
    stim[42] = 64'h7424b8746aa488e9;
    stim[43] = 64'hfc9cb8b0376f90a1;
    stim[44] = 64'hc8d24d7178321824;
    stim[45] = 64'h4a91a3995c69e675;
    stim[46] = 64'h6385ddd06f164903;
    stim[47] = 64'ha56c214ecd397f29;
    stim[48] = 64'h065dd278ad470207;
    stim[49] = 64'h66b859bb2d19a827;
    stim[50] = 64'hbf4aebf20e7afd68;
    stim[51] = 64'hc4c958a8972683d5;
    stim[52] = 64'hf67f54f5ea7fc1b6;
    stim[53] = 64'h86cf39002a939175;
    stim[54] = 64'h4c5f7822bdc4aa8c;
    stim[55] = 64'hfcde816e3053e31c;
    stim[56] = 64'h2a078e453c092c3d;
    stim[57] = 64'h3879d57f6e35ab47;
    stim[58] = 64'h8c1e73ddfd0f853d;
    stim[59] = 64'h34399cd5706cc923;
    stim[60] = 64'h9d11806868b17f5e;
    stim[61] = 64'h59feb9452b547c2c;
    stim[62] = 64'h03d94c1026192ab1;
    stim[63] = 64'hb47409df1ecd866a;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'h83247918;
      expv[1] = 32'h8639fd2b;
      expv[2] = 32'h7afd9db2;
      expv[3] = 32'h43ec9109;
      expv[4] = 32'h72a242d7;
      expv[5] = 32'h5e4d42d4;
      expv[6] = 32'h29befd23;
      expv[7] = 32'he79c8282;
      expv[8] = 32'h9785f722;
      expv[9] = 32'h56a685db;
      expv[10] = 32'h0eb4f59d;
      expv[11] = 32'h4f17e0c4;
      expv[12] = 32'hee0fc6f9;
      expv[13] = 32'h1da6d930;
      expv[14] = 32'hb7874428;
      expv[15] = 32'hb447ca7a;
      expv[16] = 32'h00cdec78;
      expv[17] = 32'h6228a1b1;
      expv[18] = 32'h2d42fafb;
      expv[19] = 32'hda4e5de6;
      expv[20] = 32'h55a0f327;
      expv[21] = 32'hebb752d8;
      expv[22] = 32'h692f5cad;
      expv[23] = 32'h663b203c;
      expv[24] = 32'h106d6664;
      expv[25] = 32'h1cd74fbc;
      expv[26] = 32'hdf489660;
      expv[27] = 32'h692963ef;
      expv[28] = 32'h8c84d807;
      expv[29] = 32'h4a076045;
      expv[30] = 32'h383acd73;
      expv[31] = 32'h2d8fff15;
      expv[32] = 32'hab06570d;
      expv[33] = 32'h45002112;
      expv[34] = 32'h335e967d;
      expv[35] = 32'h0c4a3928;
      expv[36] = 32'h914cae8b;
      expv[37] = 32'h67fdbb2f;
      expv[38] = 32'hb8bbb50c;
      expv[39] = 32'h31d1c4aa;
      expv[40] = 32'ha643736d;
      expv[41] = 32'h7553db31;
      expv[42] = 32'h1f53bc84;
      expv[43] = 32'hf492a8f6;
      expv[44] = 32'h81924dad;
      expv[45] = 32'h67851101;
      expv[46] = 32'h131d2c4b;
      expv[47] = 32'h332b195b;
      expv[48] = 32'hf42c705c;
      expv[49] = 32'h545d4d6f;
      expv[50] = 32'h8e46f347;
      expv[51] = 32'h1c82f72c;
      expv[52] = 32'h217f16d4;
      expv[53] = 32'hf1eee6f1;
      expv[54] = 32'hcaabacda;
      expv[55] = 32'hedb82a12;
      expv[56] = 32'h2691451f;
      expv[57] = 32'h67314b19;
      expv[58] = 32'h49b1aa60;
      expv[59] = 32'h652bae69;
      expv[60] = 32'hc649c458;
      expv[61] = 32'h45d36cfa;
      expv[62] = 32'h6a8202b2;
      expv[63] = 32'h93c3ec09;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
