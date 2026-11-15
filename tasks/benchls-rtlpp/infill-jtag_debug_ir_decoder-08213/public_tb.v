// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08213 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h0cc91898d03;
    stim[1] = 42'h2b0171d9beb;
    stim[2] = 42'h195fa1232e4;
    stim[3] = 42'h3bcec7335b9;
    stim[4] = 42'h3119417d008;
    stim[5] = 42'h13c731488fa;
    stim[6] = 42'h30d442d97ae;
    stim[7] = 42'h0a1805ed165;
    stim[8] = 42'h369cb547cec;
    stim[9] = 42'h39f73c834d6;
    stim[10] = 42'h3a7a0bc0a0d;
    stim[11] = 42'h067adc8a69d;
    stim[12] = 42'h37d78c1dbd3;
    stim[13] = 42'h3b84f753b07;
    stim[14] = 42'h0ccc5c2b165;
    stim[15] = 42'h0ac5f8dc733;
    stim[16] = 42'h3cf0fe58443;
    stim[17] = 42'h2981c387a4d;
    stim[18] = 42'h15cd1db9e49;
    stim[19] = 42'h02084a44f5d;
    stim[20] = 42'h10184a27cc4;
    stim[21] = 42'h3feeec9b40f;
    stim[22] = 42'h38a5524f0fd;
    stim[23] = 42'h2ba10f88420;
    stim[24] = 42'h21f972e774b;
    stim[25] = 42'h2c6855e8ebb;
    stim[26] = 42'h35c4b3d6888;
    stim[27] = 42'h3a3a61e811e;
    stim[28] = 42'h38366b3bf8a;
    stim[29] = 42'h2a8618ed041;
    stim[30] = 42'h37156734aa7;
    stim[31] = 42'h3c1e9abed77;
    stim[32] = 42'h1570963c818;
    stim[33] = 42'h117e8891755;
    stim[34] = 42'h25f1953f10c;
    stim[35] = 42'h1ed35598c93;
    stim[36] = 42'h04b92e0afea;
    stim[37] = 42'h13ae0bf7ee0;
    stim[38] = 42'h1ebfa7cb1cb;
    stim[39] = 42'h0b764095423;
    stim[40] = 42'h0bf95adf5be;
    stim[41] = 42'h0b84f1bb6ba;
    stim[42] = 42'h1715cdb6f9d;
    stim[43] = 42'h29a4856082d;
    stim[44] = 42'h0d1b446d508;
    stim[45] = 42'h1b7fc97c14c;
    stim[46] = 42'h1ca365fba62;
    stim[47] = 42'h212386a88d8;
    stim[48] = 42'h1cfb934e2a0;
    stim[49] = 42'h30c94e2d56c;
    stim[50] = 42'h11c4d0b284a;
    stim[51] = 42'h2f7d2391259;
    stim[52] = 42'h196c91cbc30;
    stim[53] = 42'h2e899291b64;
    stim[54] = 42'h0c3d434bfe5;
    stim[55] = 42'h27cf39e3c7a;
    stim[56] = 42'h1834b159b71;
    stim[57] = 42'h1f98c8bef9d;
    stim[58] = 42'h255ae57fbcc;
    stim[59] = 42'h12031320e10;
    stim[60] = 42'h091377d169d;
    stim[61] = 42'h18039d52a0b;
    stim[62] = 42'h20e0c48ee6d;
    stim[63] = 42'h329c85bfb8c;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxxxxx;
      expv[3] = 51'hxxxxxxxxxxxxx;
      expv[4] = 51'hxxxxxxxxxxxxx;
      expv[5] = 51'hxxxxxxxxxx000;
      expv[6] = 51'hxxxxxxxxxx000;
      expv[7] = 51'hxxxxxxxxxx000;
      expv[8] = 51'hxxxxxxxxxx000;
      expv[9] = 51'h34e5aa3e76000;
      expv[10] = 51'h34e5aa3e76000;
      expv[11] = 51'h34e5aa3e76000;
      expv[12] = 51'h34e5aa3e76000;
      expv[13] = 51'h3ebc60ede8000;
      expv[14] = 51'h3ebc60ede8000;
      expv[15] = 51'h3ebc60ede8000;
      expv[16] = 51'h562fc6e398000;
      expv[17] = 51'h562fc6e398000;
      expv[18] = 51'h562fc6e398000;
      expv[19] = 51'h2e68edcf24080;
      expv[20] = 51'h2e68edcf24000;
      expv[21] = 51'h2e68edcf24000;
      expv[22] = 51'h2e68edcf24000;
      expv[23] = 51'h2e68edcf24000;
      expv[24] = 51'h2e68edcf24000;
      expv[25] = 51'h0fcb973ba4010;
      expv[26] = 51'h0fcb973ba4000;
      expv[27] = 51'h0fcb973ba4000;
      expv[28] = 51'h51d30f408e080;
      expv[29] = 51'h51d30f408e000;
      expv[30] = 51'h51d30f408e000;
      expv[31] = 51'h38ab39a552080;
      expv[32] = 51'h38ab39a552000;
      expv[33] = 51'h38ab39a552000;
      expv[34] = 51'h0bf4448baa001;
      expv[35] = 51'h0bf4448baa000;
      expv[36] = 51'h0bf4448baa000;
      expv[37] = 51'h0bf4448baa000;
      expv[38] = 51'h0bf4448baa000;
      expv[39] = 51'h75fd3e58e4020;
      expv[40] = 51'h75fd3e58e4000;
      expv[41] = 51'h75fd3e58e4000;
      expv[42] = 51'h5c278ddb5c100;
      expv[43] = 51'h5c278ddb5c000;
      expv[44] = 51'h5c278ddb5c000;
      expv[45] = 51'h5c278ddb5c000;
      expv[46] = 51'h5c278ddb5c000;
      expv[47] = 51'h5c278ddb5c000;
      expv[48] = 51'h5c278ddb5c000;
      expv[49] = 51'h5c278ddb5c000;
      expv[50] = 51'h064a716ab6001;
      expv[51] = 51'h064a716ab6000;
      expv[52] = 51'h064a716ab6000;
      expv[53] = 51'h064a716ab6000;
      expv[54] = 51'h744c948db2020;
      expv[55] = 51'h744c948db2000;
      expv[56] = 51'h744c948db2000;
      expv[57] = 51'h744c948db2000;
      expv[58] = 51'h744c948db2000;
      expv[59] = 51'h2ad72bfde6040;
      expv[60] = 51'h2ad72bfde6000;
      expv[61] = 51'h2ad72bfde6000;
      expv[62] = 51'h2ad72bfde6000;
      expv[63] = 51'h2ad72bfde6000;
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
