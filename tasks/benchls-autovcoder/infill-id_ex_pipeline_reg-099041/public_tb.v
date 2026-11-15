// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 63;
  localparam OW = 63;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_099041 dut (
    .clk(clk),
    .a_in(in_vec[62:47]),
    .b_in(in_vec[46:31]),
    .destreg_in(in_vec[30:27]),
    .set_regwrite_in(in_vec[26:26]),
    .set_memwrite_in(in_vec[25:25]),
    .set_memread_in(in_vec[24:24]),
    .opcode_in(in_vec[23:16]),
    .imedi_in(in_vec[15:0]),
    .a_out(out_vec[62:47]),
    .b_out(out_vec[46:31]),
    .destreg_out(out_vec[30:27]),
    .set_regwrite_out(out_vec[26:26]),
    .set_memwrite_out(out_vec[25:25]),
    .set_memread_out(out_vec[24:24]),
    .opcode_out(out_vec[23:16]),
    .imedi_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 63'h24489f3089b52b1b;
    stim[1] = 63'h170d476aec714f0e;
    stim[2] = 63'h1aac924c8ebed3a1;
    stim[3] = 63'h2b3cc6b8db5975b9;
    stim[4] = 63'h7bf8fb86475360fd;
    stim[5] = 63'h1a9be1a24ccc0d93;
    stim[6] = 63'h1309cbda0bdeb506;
    stim[7] = 63'h2d7f5a7b94fd79a2;
    stim[8] = 63'h2c2d26277a804854;
    stim[9] = 63'h6be949024c7835f8;
    stim[10] = 63'h0cf96691bbc4d4e7;
    stim[11] = 63'h11d4444d5b2b78c7;
    stim[12] = 63'h7ed8de738131a27f;
    stim[13] = 63'h73ddfe48ead4e963;
    stim[14] = 63'h21d3b4293bb14b8e;
    stim[15] = 63'h71f0645158cb7d57;
    stim[16] = 63'h130846bb3739b585;
    stim[17] = 63'h23a8787906cabad8;
    stim[18] = 63'h63cb716cec4f37d6;
    stim[19] = 63'h5bcb13fd34d2c891;
    stim[20] = 63'h69e4bc5befec47e4;
    stim[21] = 63'h24c79a336ee4b491;
    stim[22] = 63'h736a89d09fc81849;
    stim[23] = 63'h2cbd41a5af0f6856;
    stim[24] = 63'h213133b7e7efeaef;
    stim[25] = 63'h730903a879956f94;
    stim[26] = 63'h64db0ed6b25c145d;
    stim[27] = 63'h1d76533e3b55e5cb;
    stim[28] = 63'h5d51d55cbfe4820b;
    stim[29] = 63'h322da16363f8ac2f;
    stim[30] = 63'h5cabe46b42998a10;
    stim[31] = 63'h00b690b9954052ad;
    stim[32] = 63'h25b4690505f1e4f6;
    stim[33] = 63'h7cd10c75bcd8b7c6;
    stim[34] = 63'h43f5732efb2d270d;
    stim[35] = 63'h5d7b1ea0a7c2883d;
    stim[36] = 63'h3fb642430a00447a;
    stim[37] = 63'h08e7eb80a7370bb6;
    stim[38] = 63'h7a8a96438928e1f9;
    stim[39] = 63'h04891934dbfaab6b;
    stim[40] = 63'h28e1c42999c8b724;
    stim[41] = 63'h0741af0bf0fb0730;
    stim[42] = 63'h783f4eff048cd9fd;
    stim[43] = 63'h407390eecaca1afd;
    stim[44] = 63'h7d33219e7aabb266;
    stim[45] = 63'h4278b1c01dce3a10;
    stim[46] = 63'h008e5eba36508587;
    stim[47] = 63'h2104774fef9ea8ef;
    stim[48] = 63'h02c2b2d8670d4342;
    stim[49] = 63'h196b0409c2bf48d1;
    stim[50] = 63'h0f378cd21d2f4916;
    stim[51] = 63'h5b0e02465fb941c8;
    stim[52] = 63'h1f786c6178b67e85;
    stim[53] = 63'h7b673da69480d547;
    stim[54] = 63'h1cc29313eb02dd5b;
    stim[55] = 63'h7f0962c1e4a3f95e;
    stim[56] = 63'h643a78b1b08ce34f;
    stim[57] = 63'h09fe1252335681f7;
    stim[58] = 63'h61edb5929e6f6304;
    stim[59] = 63'h4b2736dd4480a142;
    stim[60] = 63'h5d54185da8b674f1;
    stim[61] = 63'h7e0b7f2bc2f83082;
    stim[62] = 63'h4c0a9d75f075edb3;
    stim[63] = 63'h52e8b666643750e0;
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
      expv[0] = 63'hxxxxxxxxxxxxxxxx;
      expv[1] = 63'h24489f3089b52b1b;
      expv[2] = 63'h170d476aec714f0e;
      expv[3] = 63'h1aac924c8ebed3a1;
      expv[4] = 63'h2b3cc6b8db5975b9;
      expv[5] = 63'h7bf8fb86475360fd;
      expv[6] = 63'h1a9be1a24ccc0d93;
      expv[7] = 63'h1309cbda0bdeb506;
      expv[8] = 63'h2d7f5a7b94fd79a2;
      expv[9] = 63'h2c2d26277a804854;
      expv[10] = 63'h6be949024c7835f8;
      expv[11] = 63'h0cf96691bbc4d4e7;
      expv[12] = 63'h11d4444d5b2b78c7;
      expv[13] = 63'h7ed8de738131a27f;
      expv[14] = 63'h73ddfe48ead4e963;
      expv[15] = 63'h21d3b4293bb14b8e;
      expv[16] = 63'h71f0645158cb7d57;
      expv[17] = 63'h130846bb3739b585;
      expv[18] = 63'h23a8787906cabad8;
      expv[19] = 63'h63cb716cec4f37d6;
      expv[20] = 63'h5bcb13fd34d2c891;
      expv[21] = 63'h69e4bc5befec47e4;
      expv[22] = 63'h24c79a336ee4b491;
      expv[23] = 63'h736a89d09fc81849;
      expv[24] = 63'h2cbd41a5af0f6856;
      expv[25] = 63'h213133b7e7efeaef;
      expv[26] = 63'h730903a879956f94;
      expv[27] = 63'h64db0ed6b25c145d;
      expv[28] = 63'h1d76533e3b55e5cb;
      expv[29] = 63'h5d51d55cbfe4820b;
      expv[30] = 63'h322da16363f8ac2f;
      expv[31] = 63'h5cabe46b42998a10;
      expv[32] = 63'h00b690b9954052ad;
      expv[33] = 63'h25b4690505f1e4f6;
      expv[34] = 63'h7cd10c75bcd8b7c6;
      expv[35] = 63'h43f5732efb2d270d;
      expv[36] = 63'h5d7b1ea0a7c2883d;
      expv[37] = 63'h3fb642430a00447a;
      expv[38] = 63'h08e7eb80a7370bb6;
      expv[39] = 63'h7a8a96438928e1f9;
      expv[40] = 63'h04891934dbfaab6b;
      expv[41] = 63'h28e1c42999c8b724;
      expv[42] = 63'h0741af0bf0fb0730;
      expv[43] = 63'h783f4eff048cd9fd;
      expv[44] = 63'h407390eecaca1afd;
      expv[45] = 63'h7d33219e7aabb266;
      expv[46] = 63'h4278b1c01dce3a10;
      expv[47] = 63'h008e5eba36508587;
      expv[48] = 63'h2104774fef9ea8ef;
      expv[49] = 63'h02c2b2d8670d4342;
      expv[50] = 63'h196b0409c2bf48d1;
      expv[51] = 63'h0f378cd21d2f4916;
      expv[52] = 63'h5b0e02465fb941c8;
      expv[53] = 63'h1f786c6178b67e85;
      expv[54] = 63'h7b673da69480d547;
      expv[55] = 63'h1cc29313eb02dd5b;
      expv[56] = 63'h7f0962c1e4a3f95e;
      expv[57] = 63'h643a78b1b08ce34f;
      expv[58] = 63'h09fe1252335681f7;
      expv[59] = 63'h61edb5929e6f6304;
      expv[60] = 63'h4b2736dd4480a142;
      expv[61] = 63'h5d54185da8b674f1;
      expv[62] = 63'h7e0b7f2bc2f83082;
      expv[63] = 63'h4c0a9d75f075edb3;
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
