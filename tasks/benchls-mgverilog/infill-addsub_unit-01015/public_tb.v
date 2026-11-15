// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01015 dut (
    .a(in_vec[64:33]),
    .b(in_vec[32:1]),
    .addnsub(in_vec[0:0]),
    .o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h02f77805b460f0e94;
    stim[1] = 65'h1557c8e2a913e35ac;
    stim[2] = 65'h11b787617e6c30d00;
    stim[3] = 65'h15d060505799b4024;
    stim[4] = 65'h1e02596cc638bf6ac;
    stim[5] = 65'h039f43519c777a1d3;
    stim[6] = 65'h1fc9dfadbaa8469ad;
    stim[7] = 65'h028d33c8933b77c8e;
    stim[8] = 65'h0031d8d6a27534fbc;
    stim[9] = 65'h031446be72cfc5a51;
    stim[10] = 65'h03611b07d5693506e;
    stim[11] = 65'h09ddcfca68d3b1f53;
    stim[12] = 65'h054245ce772ca0ba2;
    stim[13] = 65'h02e4d86322bac5c3b;
    stim[14] = 65'h0b0c8032e77caf8f8;
    stim[15] = 65'h195b4c529f894e91e;
    stim[16] = 65'h0af6f292b58306bfa;
    stim[17] = 65'h0a2238051d8406150;
    stim[18] = 65'h12be68055882bb0d8;
    stim[19] = 65'h1ed01c7f60e47bc9f;
    stim[20] = 65'h01ec63299057bd3c3;
    stim[21] = 65'h1e3f4a9257f48a693;
    stim[22] = 65'h1d8a36edd1e85a1f3;
    stim[23] = 65'h1bad426f6d46f2252;
    stim[24] = 65'h0c69c82ab8a940f3a;
    stim[25] = 65'h1970df9700a8e53aa;
    stim[26] = 65'h1d0e6954bdbf3251f;
    stim[27] = 65'h1887c67fd9c056fb0;
    stim[28] = 65'h0f057739bf0f5000e;
    stim[29] = 65'h0c6a264f515cddb32;
    stim[30] = 65'h170aa6ee4ac1615c7;
    stim[31] = 65'h17d764d3a88a091da;
    stim[32] = 65'h023bfba07767d776e;
    stim[33] = 65'h1f919d495b9151360;
    stim[34] = 65'h043ce58fa27001151;
    stim[35] = 65'h17f29b33cbbcb968b;
    stim[36] = 65'h0a98989c605e4b9f2;
    stim[37] = 65'h1c6adcceb40141629;
    stim[38] = 65'h1137947edc230a795;
    stim[39] = 65'h00731fcdbbd9452bc;
    stim[40] = 65'h0aa8aa913fbbe19ef;
    stim[41] = 65'h16cc3bbe997a0afad;
    stim[42] = 65'h117f9e5f110506b5c;
    stim[43] = 65'h04bb8ce7de35ce5b8;
    stim[44] = 65'h04e255fa6f54276e1;
    stim[45] = 65'h03ea4ad7848f10069;
    stim[46] = 65'h02cc88d4ccf9299fc;
    stim[47] = 65'h0eb5f898feefcba8e;
    stim[48] = 65'h0dcd15275394d2a8f;
    stim[49] = 65'h07b0ea9539841126a;
    stim[50] = 65'h125e30129f4024e73;
    stim[51] = 65'h001a517b3637b4cf7;
    stim[52] = 65'h126f2e5146cfcf4a6;
    stim[53] = 65'h001ce1bc971730efb;
    stim[54] = 65'h0cd90eecdf5468725;
    stim[55] = 65'h1537fcd797aafa81e;
    stim[56] = 65'h1a8a1b3060856f91b;
    stim[57] = 65'h032aa67be26129b24;
    stim[58] = 65'h09878dbf83472cfd9;
    stim[59] = 65'h0012a225425cbe3d6;
    stim[60] = 65'h1bd4f2e3ed9d2d9ba;
    stim[61] = 65'h1e5c2c8614e70d412;
    stim[62] = 65'h0112e55e0751b57d3;
    stim[63] = 65'h1e175a9e02f624290;
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
      expv[0] = 32'h74b438e3;
      expv[1] = 32'h621f2c3f;
      expv[2] = 32'h9a5ab48b;
      expv[3] = 32'hf1b56270;
      expv[4] = 32'hbe4cd010;
      expv[5] = 32'h00b5eb75;
      expv[6] = 32'hd3913243;
      expv[7] = 32'h7a8ddffd;
      expv[8] = 32'hede51ed7;
      expv[9] = 32'haf20631b;
      expv[10] = 32'h6fbf3007;
      expv[11] = 32'h958c0dfc;
      expv[12] = 32'h70ad28a2;
      expv[13] = 32'h2cfcf136;
      expv[14] = 32'h1c7e851b;
      expv[15] = 32'hce8fee05;
      expv[16] = 32'hab9f5e98;
      expv[17] = 32'h64f18f80;
      expv[18] = 32'hd1dd67be;
      expv[19] = 32'hfda4c24a;
      expv[20] = 32'h9221032d;
      expv[21] = 32'hb19ea7db;
      expv[22] = 32'h7b948867;
      expv[23] = 32'h73328252;
      expv[24] = 32'h9e0439b8;
      expv[25] = 32'hc63fd2e3;
      expv[26] = 32'hd66cdd34;
      expv[27] = 32'hf63b7c26;
      expv[28] = 32'h7fb139c6;
      expv[29] = 32'hd86a44e1;
      expv[30] = 32'h0e604255;
      expv[31] = 32'h7a6addb0;
      expv[32] = 32'h56a1214c;
      expv[33] = 32'h2002609a;
      expv[34] = 32'h35673525;
      expv[35] = 32'h1d7aa4e3;
      expv[36] = 32'h51d267ea;
      expv[37] = 32'h8360f189;
      expv[38] = 32'h6ad4f7c0;
      expv[39] = 32'h24ced50f;
      expv[40] = 32'h53246180;
      expv[41] = 32'h823235ca;
      expv[42] = 32'h03d4bd4a;
      expv[43] = 32'h342df462;
      expv[44] = 32'ha1b3eb43;
      expv[45] = 32'h43cad6f0;
      expv[46] = 32'hae9af9a8;
      expv[47] = 32'h7e316780;
      expv[48] = 32'h0b0f3e81;
      expv[49] = 32'h7166cb74;
      expv[50] = 32'h8cf2a7cd;
      expv[51] = 32'hb2903254;
      expv[52] = 32'h5cfaf837;
      expv[53] = 32'hb9a09561;
      expv[54] = 32'h616bbaf8;
      expv[55] = 32'hec6812ad;
      expv[56] = 32'hd87c5610;
      expv[57] = 32'h064be64d;
      expv[58] = 32'h6675d5e8;
      expv[59] = 32'hedaf1f3f;
      expv[60] = 32'h71be2a42;
      expv[61] = 32'h4ba8fa27;
      expv[62] = 32'h4324d6d9;
      expv[63] = 32'hd909b3a8;
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
