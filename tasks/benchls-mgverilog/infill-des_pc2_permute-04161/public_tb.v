// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 56;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04161 dut (
    .c(in_vec[55:28]),
    .d(in_vec[27:0]),
    .k(out_vec[47:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 56'heeaf3d9a53ecb7;
    stim[1] = 56'h81d3c594cb5697;
    stim[2] = 56'hbcabf5db804760;
    stim[3] = 56'hf805f7436efd35;
    stim[4] = 56'h90e46c74e9ac69;
    stim[5] = 56'hf35ce4bcea17d3;
    stim[6] = 56'hb19dbc36ca89df;
    stim[7] = 56'h93fe5b7b435d0d;
    stim[8] = 56'h1801a33029e76d;
    stim[9] = 56'h3cabb57a266a2f;
    stim[10] = 56'h8f6fae5af943ce;
    stim[11] = 56'h9aacd3f17ced05;
    stim[12] = 56'hae5833ba5957ba;
    stim[13] = 56'h238c2894529436;
    stim[14] = 56'h360cee8dbeb2e0;
    stim[15] = 56'hcabd733d850193;
    stim[16] = 56'h3ceb61e5a6bba4;
    stim[17] = 56'h5f00362dd30a0e;
    stim[18] = 56'hf0bd070d23d57e;
    stim[19] = 56'hddde89ef8eff68;
    stim[20] = 56'h82dbe4a2227b21;
    stim[21] = 56'hdfbf583dc3340f;
    stim[22] = 56'ha96a2c5dbdc5e9;
    stim[23] = 56'h137a224798e35a;
    stim[24] = 56'h0fb46289d6ad87;
    stim[25] = 56'hd51c15486c7c29;
    stim[26] = 56'h66d3911d129d01;
    stim[27] = 56'h3d435eec5fd702;
    stim[28] = 56'hd76c2a1a9ab894;
    stim[29] = 56'ha798346ff49c38;
    stim[30] = 56'hf61ea91184a7d6;
    stim[31] = 56'h603c2111a9d273;
    stim[32] = 56'h4220a8bc43a08f;
    stim[33] = 56'hd712bc4632d5a1;
    stim[34] = 56'h4b2718f2a969c3;
    stim[35] = 56'h8174e8479fed9c;
    stim[36] = 56'hebd91f536c4388;
    stim[37] = 56'h37c3c2a40b23f1;
    stim[38] = 56'h739518c5f94ddd;
    stim[39] = 56'h9d43cdff5f6540;
    stim[40] = 56'h5e119ee2d280cc;
    stim[41] = 56'hbd08b551949523;
    stim[42] = 56'h0c56a4f2d3c3cc;
    stim[43] = 56'h2ac8f83ad85197;
    stim[44] = 56'h32f7e7544d4b04;
    stim[45] = 56'hb6a214ef4393e0;
    stim[46] = 56'h577ea9dd3bfb2a;
    stim[47] = 56'h67ece22c7a72a2;
    stim[48] = 56'h2f80304ee6ebd1;
    stim[49] = 56'h7ab66a4db7be76;
    stim[50] = 56'h1f794d6f05b87d;
    stim[51] = 56'h18f8c944162054;
    stim[52] = 56'ha5501e516161b1;
    stim[53] = 56'hec73aefd86ab54;
    stim[54] = 56'haa46605e6ef6f7;
    stim[55] = 56'h7b8cd0568c336f;
    stim[56] = 56'h9973c3a26c1942;
    stim[57] = 56'h6b5c53c649151d;
    stim[58] = 56'h778706b05e591e;
    stim[59] = 56'ha10c4e9ea4c126;
    stim[60] = 56'h18e3ff859f8882;
    stim[61] = 56'hd4ba4a0de4bf92;
    stim[62] = 56'h1b8df2b48f425e;
    stim[63] = 56'h510d4efd55d043;
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
      expv[0] = 48'hbfe437e5c7b6;
      expv[1] = 48'h5992605f2fb0;
      expv[2] = 48'h7fc5a628b03b;
      expv[3] = 48'hde0da5f0dbb1;
      expv[4] = 48'ha9358893e1e8;
      expv[5] = 48'hcb175b5e3faa;
      expv[6] = 48'hcb276ef677c8;
      expv[7] = 48'hb9bbde215bf3;
      expv[8] = 48'h550d28999178;
      expv[9] = 48'h77c5ae2cc352;
      expv[10] = 48'hedfcf23d34de;
      expv[11] = 48'hfd099e9051b5;
      expv[12] = 48'h1f5e1e7d9cf6;
      expv[13] = 48'h832452c68aa4;
      expv[14] = 48'hc26d129aae0f;
      expv[15] = 48'hbd0e3f473503;
      expv[16] = 48'h36d5aa8afe01;
      expv[17] = 48'h044d5d0f62c7;
      expv[18] = 48'hba0b23c79a7b;
      expv[19] = 48'hdcf3cbbafa7b;
      expv[20] = 48'h48963a28db10;
      expv[21] = 48'hade37f072be3;
      expv[22] = 48'h2fb4c293b57f;
      expv[23] = 48'h209fd2fe305d;
      expv[24] = 48'ha44e508477a7;
      expv[25] = 48'h9843c710c9f2;
      expv[26] = 48'h53d235825b27;
      expv[27] = 48'h06f9ec9f1ab6;
      expv[28] = 48'ha97d53f06e06;
      expv[29] = 48'h0a46dee2e8e7;
      expv[30] = 48'hdbe713cc3429;
      expv[31] = 48'hb30603dda919;
      expv[32] = 48'h6124198707c2;
      expv[33] = 48'h48e7d5a29f34;
      expv[34] = 48'ha5a0fd357518;
      expv[35] = 48'he836c0f37675;
      expv[36] = 48'h1f3af73814d1;
      expv[37] = 48'h42d9785b9708;
      expv[38] = 48'h8223f55375fd;
      expv[39] = 48'h5df1e83312bf;
      expv[40] = 48'h446bbda026cc;
      expv[41] = 48'h5f45c684b925;
      expv[42] = 48'hc5d688a936dc;
      expv[43] = 48'h47341e743d96;
      expv[44] = 48'hf39fb01b5090;
      expv[45] = 48'h2ac19cab9e8b;
      expv[46] = 48'hf1f7d39fda57;
      expv[47] = 48'he25c5b1e8e96;
      expv[48] = 48'h0644d4ea779a;
      expv[49] = 48'ha6af91cfea2f;
      expv[50] = 48'h3473fae3c94b;
      expv[51] = 48'h74338242020c;
      expv[52] = 48'h0b7ac4419591;
      expv[53] = 48'h6ffea9ca720b;
      expv[54] = 48'h8f9490fe8fba;
      expv[55] = 48'hc701d73eb948;
      expv[56] = 48'h7c9b68345888;
      expv[57] = 48'h961ad77319e0;
      expv[58] = 48'h83c979545ad4;
      expv[59] = 48'h8b2842a6b012;
      expv[60] = 48'h74bd24976605;
      expv[61] = 48'h28eb03ce7ca3;
      expv[62] = 48'hc50d7e5f2258;
      expv[63] = 48'h8129eb87099f;
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
