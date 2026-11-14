// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05229 dut (
    .CLK(clk),
    .s1(in_vec[35:35]),
    .s2(in_vec[34:34]),
    .d1(in_vec[33:18]),
    .d2(in_vec[17:2]),
    .c1(in_vec[1:1]),
    .c2(in_vec[0:0]),
    .od(out_vec[17:2]),
    .os(out_vec[1:1]),
    .oc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hac2d8ab87;
    stim[1] = 36'h8a3307778;
    stim[2] = 36'h291bc8d69;
    stim[3] = 36'he2bf520ad;
    stim[4] = 36'h833e9769f;
    stim[5] = 36'h73c4ccca4;
    stim[6] = 36'h637b8d855;
    stim[7] = 36'h469e71f70;
    stim[8] = 36'h8fb710b0f;
    stim[9] = 36'h0e0f0f4fb;
    stim[10] = 36'hef497d1f0;
    stim[11] = 36'h107bf805b;
    stim[12] = 36'hf9bd42e0c;
    stim[13] = 36'h49d9b3837;
    stim[14] = 36'h911a7f53c;
    stim[15] = 36'hcebc6fc77;
    stim[16] = 36'hbbdad4540;
    stim[17] = 36'haedfffd55;
    stim[18] = 36'he4d740f04;
    stim[19] = 36'hf30e1cb9f;
    stim[20] = 36'h1dbd8ac80;
    stim[21] = 36'h774b4a074;
    stim[22] = 36'h5c2f99d51;
    stim[23] = 36'h03e822a6e;
    stim[24] = 36'h6e5be346e;
    stim[25] = 36'h1cfaf2e05;
    stim[26] = 36'h03e52fcb8;
    stim[27] = 36'h736abeddf;
    stim[28] = 36'h90f14d751;
    stim[29] = 36'hb181b4adc;
    stim[30] = 36'h86fbc4456;
    stim[31] = 36'hef6acbf4d;
    stim[32] = 36'h01ef6ba9c;
    stim[33] = 36'hdadf0ca1b;
    stim[34] = 36'ha5dec91b3;
    stim[35] = 36'h7f097627b;
    stim[36] = 36'hc6eed5ecb;
    stim[37] = 36'h91df99560;
    stim[38] = 36'h9ae84256b;
    stim[39] = 36'hcdc9dcfcd;
    stim[40] = 36'h5feafefa6;
    stim[41] = 36'h14530faa5;
    stim[42] = 36'hd0f050d2b;
    stim[43] = 36'h175b799f4;
    stim[44] = 36'h6f97397ae;
    stim[45] = 36'he02c4ff7c;
    stim[46] = 36'ha50c97ca9;
    stim[47] = 36'h7df6b025a;
    stim[48] = 36'hd2ecce397;
    stim[49] = 36'h5bc266bb3;
    stim[50] = 36'hc02eb298d;
    stim[51] = 36'h6d39aaa13;
    stim[52] = 36'h8406656cb;
    stim[53] = 36'h24c2aeca7;
    stim[54] = 36'hebdb00578;
    stim[55] = 36'h5e4ce3c47;
    stim[56] = 36'ha9c7e8112;
    stim[57] = 36'h8cef050e9;
    stim[58] = 36'hf7d41454d;
    stim[59] = 36'h8ab2758d3;
    stim[60] = 36'ha349dbd98;
    stim[61] = 36'h058e0bb5f;
    stim[62] = 36'ha5bceb529;
    stim[63] = 36'h20a5c2fbf;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'h2c2db;
      expv[2] = 18'h0a332;
      expv[3] = 18'h00001;
      expv[4] = 18'h22bf7;
      expv[5] = 18'h033eb;
      expv[6] = 18'h0cca6;
      expv[7] = 18'h0d857;
      expv[8] = 18'h31f72;
      expv[9] = 18'h0fb73;
      expv[10] = 18'h00001;
      expv[11] = 18'h2f496;
      expv[12] = 18'h00001;
      expv[13] = 18'h39bd6;
      expv[14] = 18'h33837;
      expv[15] = 18'h111a6;
      expv[16] = 18'h0ebc7;
      expv[17] = 18'h3bdae;
      expv[18] = 18'h2edff;
      expv[19] = 18'h24d76;
      expv[20] = 18'h330e3;
      expv[21] = 18'h00000;
      expv[22] = 18'h0a076;
      expv[23] = 18'h19d53;
      expv[24] = 18'h00001;
      expv[25] = 18'h2346f;
      expv[26] = 18'h00001;
      expv[27] = 18'h00000;
      expv[28] = 18'h3eddf;
      expv[29] = 18'h10f17;
      expv[30] = 18'h3181a;
      expv[31] = 18'h06fbf;
      expv[32] = 18'h2f6af;
      expv[33] = 18'h00000;
      expv[34] = 18'h1adf3;
      expv[35] = 18'h25def;
      expv[36] = 18'h3627b;
      expv[37] = 18'h06eef;
      expv[38] = 18'h11dfa;
      expv[39] = 18'h1ae87;
      expv[40] = 18'h0dc9f;
      expv[41] = 18'h3efa7;
      expv[42] = 18'h00001;
      expv[43] = 18'h10f07;
      expv[44] = 18'h00000;
      expv[45] = 18'h397af;
      expv[46] = 18'h202c6;
      expv[47] = 18'h250cb;
      expv[48] = 18'h3025b;
      expv[49] = 18'h12ecf;
      expv[50] = 18'h26bb3;
      expv[51] = 18'h002eb;
      expv[52] = 18'h2aa13;
      expv[53] = 18'h04067;
      expv[54] = 18'h00001;
      expv[55] = 18'h2bdb2;
      expv[56] = 18'h23c47;
      expv[57] = 18'h29c7f;
      expv[58] = 18'h0cef3;
      expv[59] = 18'h37d43;
      expv[60] = 18'h0ab27;
      expv[61] = 18'h2349e;
      expv[62] = 18'h00001;
      expv[63] = 18'h25bcf;
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
