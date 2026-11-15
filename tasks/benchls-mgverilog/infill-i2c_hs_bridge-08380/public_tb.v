// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 69;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08380 dut (
    .clk(clk),
    .slave_address(in_vec[69:67]),
    .slave_read(in_vec[66:66]),
    .slave_write(in_vec[65:65]),
    .slave_writedata(in_vec[64:33]),
    .reset(in_vec[32:32]),
    .i2c_hs_readdata(in_vec[31:0]),
    .slave_readdata(out_vec[68:37]),
    .i2c_hs_read(out_vec[36:36]),
    .i2c_hs_write(out_vec[35:35]),
    .i2c_hs_addr(out_vec[34:32]),
    .i2c_hs_writedata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h3c5cdff06b2b40784f;
    stim[1] = 70'h1d09afa29f2a9a6c60;
    stim[2] = 70'h25dafb19948f2654e5;
    stim[3] = 70'h1f3524d3ea5e30e674;
    stim[4] = 70'h376f3d67fc4710567f;
    stim[5] = 70'h13e721025a53857404;
    stim[6] = 70'h0a0f0de332712bafd4;
    stim[7] = 70'h1a1c581b507011410f;
    stim[8] = 70'h3c3c11dfd01f579dd0;
    stim[9] = 70'h20e651f228c5ec80be;
    stim[10] = 70'h361de122684af28397;
    stim[11] = 70'h19ba4c52b44b857c88;
    stim[12] = 70'h377c592e30c4345569;
    stim[13] = 70'h2c9d09368c2fde2dc2;
    stim[14] = 70'h2b139baca2f48f8a70;
    stim[15] = 70'h35cf7ae8d45b2ba533;
    stim[16] = 70'h0845517a28ecdcca04;
    stim[17] = 70'h21e0a77c363fded712;
    stim[18] = 70'h1e08625f54ec083663;
    stim[19] = 70'h218e6ab0408bd64108;
    stim[20] = 70'h04451f22f028cca1ee;
    stim[21] = 70'h1a48dcc2c8116062aa;
    stim[22] = 70'h129e42410486ff1b5a;
    stim[23] = 70'h2cbe1f2a4c2db7cefb;
    stim[24] = 70'h037fd792ec685d2546;
    stim[25] = 70'h3ba6bb42ac54e5bb2b;
    stim[26] = 70'h1145f4036e32ded4b9;
    stim[27] = 70'h0623081196f05940aa;
    stim[28] = 70'h2ded527dfc0163157b;
    stim[29] = 70'h3ff01828ac81c43b16;
    stim[30] = 70'h3a7f723ada40c64d7f;
    stim[31] = 70'h03cd8abae8100dfcf4;
    stim[32] = 70'h3d194f1d269661808d;
    stim[33] = 70'h30274b3c00ba771e0e;
    stim[34] = 70'h0c3eede1b45b1e0cb1;
    stim[35] = 70'h2552d5fc1a50b57f73;
    stim[36] = 70'h23a9a54534095dff2b;
    stim[37] = 70'h1b6dc93fac99157e28;
    stim[38] = 70'h378409c0846f5ee3cc;
    stim[39] = 70'h101f93612003e7fde6;
    stim[40] = 70'h2524e184ec79d9a599;
    stim[41] = 70'h1c428a2ff006b295fd;
    stim[42] = 70'h178a477caabc9aa110;
    stim[43] = 70'h19c16bc46c8140deed;
    stim[44] = 70'h04d0cad0a0d5702450;
    stim[45] = 70'h0d48e943ce37fbbb21;
    stim[46] = 70'h2f69f69a60cd471478;
    stim[47] = 70'h071eafa3dcc7a997f7;
    stim[48] = 70'h09088abd5c918c4d28;
    stim[49] = 70'h236e414cd2461051ef;
    stim[50] = 70'h1c71249840b65e2202;
    stim[51] = 70'h09410fe44e682d775d;
    stim[52] = 70'h3a1ee48a3c5ada17ad;
    stim[53] = 70'h151fdda3d017d8ce42;
    stim[54] = 70'h323098bc54d39053f2;
    stim[55] = 70'h050643e8942ee01968;
    stim[56] = 70'h3872e7107e3b1a0170;
    stim[57] = 70'h0791e33d160af670c6;
    stim[58] = 70'h2a50b5ea902c0e0d73;
    stim[59] = 70'h30fbc020de2a1eda84;
    stim[60] = 70'h2b01e470467373f797;
    stim[61] = 70'h12f6eeace664e4c630;
    stim[62] = 70'h053d93d08e0dafd5a6;
    stim[63] = 70'h3b9be909c0e924173e;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 69'h05680f09f72e6ff835;
      expv[1] = 69'h05534d8c1384d7d14f;
      expv[2] = 69'h11e4ca9cb4ed7d8cca;
      expv[3] = 69'h0bc61cce9b9a9269f5;
      expv[4] = 69'h08e20acffeb79eb3fe;
      expv[5] = 69'h0a70ae808af390812d;
      expv[6] = 69'h0e2575fa890786f199;
      expv[7] = 69'h0e022821eb0e2c0da8;
      expv[8] = 69'h03eaf3ba171e08efe8;
      expv[9] = 69'h18bd9017c47328f914;
      expv[10] = 69'h095e5072fe0ef09134;
      expv[11] = 69'h0970af9103dd26295a;
      expv[12] = 69'h18868aad3ebe2c9718;
      expv[13] = 69'h05fbc5b8554e849b46;
      expv[14] = 69'h1e91f14e0d89cdd651;
      expv[15] = 69'h0b6574a676e7bd746a;
      expv[16] = 69'h1d9b99408122a8bd14;
      expv[17] = 69'h07fbdae244f053be1b;
      expv[18] = 69'h1d8106cc7b04312faa;
      expv[19] = 69'h117ac82104c7355820;
      expv[20] = 69'h0519943dd0228f9178;
      expv[21] = 69'h022c0c554b246e6164;
      expv[22] = 69'h10dfe36b4a4f212082;
      expv[23] = 69'h05b6f9df755f0f9526;
      expv[24] = 69'h0d0ba4a8c8bfebc976;
      expv[25] = 69'h0a9cb7656fd35da156;
      expv[26] = 69'h065bda9722a2fa01b7;
      expv[27] = 69'h1e0b281558118408cb;
      expv[28] = 69'h002c62af75f6a93efe;
      expv[29] = 69'h10388762dff80c1456;
      expv[30] = 69'h0818c9afef3fb91d6d;
      expv[31] = 69'h0201bf9e88e6c55d74;
      expv[32] = 69'h12cc3011b78ca78e93;
      expv[33] = 69'h174ee3c1c613a59e00;
      expv[34] = 69'h0b63c196311f76f0da;
      expv[35] = 69'h0a16afee74a96afe0d;
      expv[36] = 69'h012bbfe56cd4d2a29a;
      expv[37] = 69'h1322afc50bb6e49fd6;
      expv[38] = 69'h0debdc799ec204e042;
      expv[39] = 69'h007cffbcc20fc9b090;
      expv[40] = 69'h0f3b34b3349270c276;
      expv[41] = 69'h00d652bfb3214517f8;
      expv[42] = 69'h179354221ac523be55;
      expv[43] = 69'h10281bdda3e0b5e236;
      expv[44] = 69'h1aae048a1068656850;
      expv[45] = 69'h06ff776431a474a1e7;
      expv[46] = 69'h19a8e28f1db4fb4d30;
      expv[47] = 69'h18f532fef88f57d1ee;
      expv[48] = 69'h123189a50184455eae;
      expv[49] = 69'h08c20a3decb720a669;
      expv[50] = 69'h16cbc4405338924c20;
      expv[51] = 69'h0d05aeeba1a087f227;
      expv[52] = 69'h0b5b42f5af0f72451e;
      expv[53] = 69'h02fb19c8528feed1e8;
      expv[54] = 69'h1a720a7e4e184c5e2a;
      expv[55] = 69'h05dc032d108321f44a;
      expv[56] = 69'h0763402e073973883f;
      expv[57] = 69'h015ece18d8c8f19e8b;
      expv[58] = 69'h0581c1ae6d285af548;
      expv[59] = 69'h0543db50867de0106f;
      expv[60] = 69'h0e6e7ef2ed80f23823;
      expv[61] = 69'h0c9c98c60a7b775673;
      expv[62] = 69'h01b5fab4d09ec9e847;
      expv[63] = 69'h1d2482e7cfcdf484e0;
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
