// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10948 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[47:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h376f9251aa2;
    stim[1] = 42'h2d23d0051f6;
    stim[2] = 42'h0c5b64d7462;
    stim[3] = 42'h21e5c431152;
    stim[4] = 42'h065dd85627b;
    stim[5] = 42'h2ac02fa45c9;
    stim[6] = 42'h23eeb49aa47;
    stim[7] = 42'h2a2be6200c8;
    stim[8] = 42'h342f2e11da2;
    stim[9] = 42'h269958d3d6e;
    stim[10] = 42'h16761d00f57;
    stim[11] = 42'h05f8ba1decb;
    stim[12] = 42'h0ec590d2fdb;
    stim[13] = 42'h1655ab2fe8f;
    stim[14] = 42'h0c20a968877;
    stim[15] = 42'h3352debe053;
    stim[16] = 42'h17162dd1f4f;
    stim[17] = 42'h17b85781809;
    stim[18] = 42'h18cde2f7325;
    stim[19] = 42'h3d3099e64d5;
    stim[20] = 42'h371c4d5bfdc;
    stim[21] = 42'h0d545b5cbbf;
    stim[22] = 42'h1dbc7b9f50b;
    stim[23] = 42'h17147bb6f75;
    stim[24] = 42'h31c69e9773c;
    stim[25] = 42'h39b23038761;
    stim[26] = 42'h29bc26c8d3d;
    stim[27] = 42'h2506c2c38bd;
    stim[28] = 42'h103bb91b2f2;
    stim[29] = 42'h2cb588dab0e;
    stim[30] = 42'h3adaea05951;
    stim[31] = 42'h294641e3ac4;
    stim[32] = 42'h30d58374089;
    stim[33] = 42'h23e86829ad2;
    stim[34] = 42'h3bcf57aaa47;
    stim[35] = 42'h395ad2a8664;
    stim[36] = 42'h27425750173;
    stim[37] = 42'h1f02acc692c;
    stim[38] = 42'h1f374167c32;
    stim[39] = 42'h08a5937f156;
    stim[40] = 42'h3a46cf4c48b;
    stim[41] = 42'h3adc7644a4b;
    stim[42] = 42'h207c7b15904;
    stim[43] = 42'h1075076ec63;
    stim[44] = 42'h1ee713b366e;
    stim[45] = 42'h35b42f26cc0;
    stim[46] = 42'h259acebabac;
    stim[47] = 42'h20b092e9f4d;
    stim[48] = 42'h308a48d7eec;
    stim[49] = 42'h0a2c48f9cf2;
    stim[50] = 42'h2b176610ce0;
    stim[51] = 42'h06a3e46a2cb;
    stim[52] = 42'h22b5e79e199;
    stim[53] = 42'h2492f6b3943;
    stim[54] = 42'h2008c1a2ebe;
    stim[55] = 42'h0d5e38eda90;
    stim[56] = 42'h12c3898105b;
    stim[57] = 42'h10aae709925;
    stim[58] = 42'h135168aa880;
    stim[59] = 42'h04fead667c3;
    stim[60] = 42'h03c4bac2193;
    stim[61] = 42'h057863872a3;
    stim[62] = 42'h3e85bf02d0a;
    stim[63] = 42'h27a82c6a252;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hxxxxxxxxxxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'hxxxxxxxxxxxx;
      expv[4] = 48'hxxxxxxxxxxxx;
      expv[5] = 48'hxxxxxxxxxx00;
      expv[6] = 48'hxxxxxxxxxx00;
      expv[7] = 48'hxxxxxxxxxx00;
      expv[8] = 48'hxxxxxxxxxx00;
      expv[9] = 48'hxxxxxxxxxx00;
      expv[10] = 48'h69958d3d6c02;
      expv[11] = 48'h69958d3d6c00;
      expv[12] = 48'h5f8ba1dec804;
      expv[13] = 48'h5f8ba1dec800;
      expv[14] = 48'h5f8ba1dec800;
      expv[15] = 48'h5f8ba1dec800;
      expv[16] = 48'h5f8ba1dec800;
      expv[17] = 48'h5f8ba1dec800;
      expv[18] = 48'h5f8ba1dec800;
      expv[19] = 48'h5f8ba1dec800;
      expv[20] = 48'h5f8ba1dec800;
      expv[21] = 48'h5f8ba1dec800;
      expv[22] = 48'h5f8ba1dec800;
      expv[23] = 48'h5f8ba1dec800;
      expv[24] = 48'h5f8ba1dec800;
      expv[25] = 48'h1c69e9773c00;
      expv[26] = 48'h1c69e9773c00;
      expv[27] = 48'h1c69e9773c00;
      expv[28] = 48'h1c69e9773c00;
      expv[29] = 48'h1c69e9773c00;
      expv[30] = 48'h1c69e9773c00;
      expv[31] = 48'h1c69e9773c00;
      expv[32] = 48'h94641e3ac400;
      expv[33] = 48'h94641e3ac400;
      expv[34] = 48'h94641e3ac400;
      expv[35] = 48'h94641e3ac400;
      expv[36] = 48'h94641e3ac400;
      expv[37] = 48'h742575017000;
      expv[38] = 48'h742575017000;
      expv[39] = 48'h742575017000;
      expv[40] = 48'h8a5937f15401;
      expv[41] = 48'h8a5937f15400;
      expv[42] = 48'hadc7644a4820;
      expv[43] = 48'hadc7644a4800;
      expv[44] = 48'hadc7644a4800;
      expv[45] = 48'hadc7644a4800;
      expv[46] = 48'hadc7644a4800;
      expv[47] = 48'h59acebabac04;
      expv[48] = 48'h59acebabac00;
      expv[49] = 48'h59acebabac00;
      expv[50] = 48'h59acebabac00;
      expv[51] = 48'h59acebabac00;
      expv[52] = 48'h59acebabac00;
      expv[53] = 48'h2b5e79e19808;
      expv[54] = 48'h2b5e79e19800;
      expv[55] = 48'h008c1a2ebc08;
      expv[56] = 48'h008c1a2ebc00;
      expv[57] = 48'h2c3898105808;
      expv[58] = 48'h2c3898105800;
      expv[59] = 48'h2c3898105800;
      expv[60] = 48'h4fead667c001;
      expv[61] = 48'h4fead667c000;
      expv[62] = 48'h4fead667c000;
      expv[63] = 48'he85bf02d0800;
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
