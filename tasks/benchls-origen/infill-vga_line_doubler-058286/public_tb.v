// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_058286 dut (
    .clk_sys(clk),
    .enable(in_vec[16:16]),
    .hs_in(in_vec[15:15]),
    .vs_in(in_vec[14:14]),
    .hbl_in(in_vec[13:13]),
    .vbl_in(in_vec[12:12]),
    .r_in(in_vec[11:8]),
    .g_in(in_vec[7:4]),
    .b_in(in_vec[3:0]),
    .hs_out(out_vec[15:15]),
    .vs_out(out_vec[14:14]),
    .hbl_out(out_vec[13:13]),
    .vbl_out(out_vec[12:12]),
    .r_out(out_vec[11:8]),
    .g_out(out_vec[7:4]),
    .b_out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h02754;
    stim[1] = 17'h0a2c1;
    stim[2] = 17'h113b5;
    stim[3] = 17'h0cdd7;
    stim[4] = 17'h064ff;
    stim[5] = 17'h16237;
    stim[6] = 17'h1f409;
    stim[7] = 17'h006b5;
    stim[8] = 17'h04cd2;
    stim[9] = 17'h17f3b;
    stim[10] = 17'h0b037;
    stim[11] = 17'h1287a;
    stim[12] = 17'h11454;
    stim[13] = 17'h0510c;
    stim[14] = 17'h160bb;
    stim[15] = 17'h0bb48;
    stim[16] = 17'h040df;
    stim[17] = 17'h03a2e;
    stim[18] = 17'h14777;
    stim[19] = 17'h17b1e;
    stim[20] = 17'h02235;
    stim[21] = 17'h1b03a;
    stim[22] = 17'h1f1bb;
    stim[23] = 17'h05873;
    stim[24] = 17'h05f28;
    stim[25] = 17'h18a2e;
    stim[26] = 17'h10d7c;
    stim[27] = 17'h0738f;
    stim[28] = 17'h0a0ec;
    stim[29] = 17'h1aeab;
    stim[30] = 17'h05f7f;
    stim[31] = 17'h1dcda;
    stim[32] = 17'h0cc02;
    stim[33] = 17'h00509;
    stim[34] = 17'h03153;
    stim[35] = 17'h0ff73;
    stim[36] = 17'h083ca;
    stim[37] = 17'h0bad5;
    stim[38] = 17'h0f555;
    stim[39] = 17'h1dd38;
    stim[40] = 17'h08f6a;
    stim[41] = 17'h06009;
    stim[42] = 17'h08db9;
    stim[43] = 17'h104f7;
    stim[44] = 17'h1dcfc;
    stim[45] = 17'h060e7;
    stim[46] = 17'h14d21;
    stim[47] = 17'h18ad4;
    stim[48] = 17'h075b4;
    stim[49] = 17'h16c51;
    stim[50] = 17'h12755;
    stim[51] = 17'h1d963;
    stim[52] = 17'h0a8a2;
    stim[53] = 17'h1f0f8;
    stim[54] = 17'h1ac4c;
    stim[55] = 17'h0cd9d;
    stim[56] = 17'h0208b;
    stim[57] = 17'h0cced;
    stim[58] = 17'h02378;
    stim[59] = 17'h116ca;
    stim[60] = 17'h08c4d;
    stim[61] = 17'h07167;
    stim[62] = 17'h1d730;
    stim[63] = 17'h0cc30;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'h2754;
      expv[2] = 16'ha2c1;
      expv[3] = 16'ha2c1;
      expv[4] = 16'hcdd7;
      expv[5] = 16'h64ff;
      expv[6] = 16'h64ff;
      expv[7] = 16'h64ff;
      expv[8] = 16'h06b5;
      expv[9] = 16'h4cd2;
      expv[10] = 16'h4cd2;
      expv[11] = 16'hb037;
      expv[12] = 16'hb037;
      expv[13] = 16'hb037;
      expv[14] = 16'h510c;
      expv[15] = 16'h510c;
      expv[16] = 16'hbb48;
      expv[17] = 16'h40df;
      expv[18] = 16'h3a2e;
      expv[19] = 16'h3a2e;
      expv[20] = 16'h3a2e;
      expv[21] = 16'h2235;
      expv[22] = 16'h2235;
      expv[23] = 16'h2235;
      expv[24] = 16'h5873;
      expv[25] = 16'h5f28;
      expv[26] = 16'h5f28;
      expv[27] = 16'h5f28;
      expv[28] = 16'h738f;
      expv[29] = 16'ha0ec;
      expv[30] = 16'ha0ec;
      expv[31] = 16'h5f7f;
      expv[32] = 16'h5f7f;
      expv[33] = 16'hcc02;
      expv[34] = 16'h0509;
      expv[35] = 16'h3153;
      expv[36] = 16'hff73;
      expv[37] = 16'h83ca;
      expv[38] = 16'hbad5;
      expv[39] = 16'hf555;
      expv[40] = 16'hf555;
      expv[41] = 16'h8f6a;
      expv[42] = 16'h6009;
      expv[43] = 16'h8db9;
      expv[44] = 16'h8db9;
      expv[45] = 16'h8db9;
      expv[46] = 16'h60e7;
      expv[47] = 16'h60e7;
      expv[48] = 16'h60e7;
      expv[49] = 16'h75b4;
      expv[50] = 16'h75b4;
      expv[51] = 16'h75b4;
      expv[52] = 16'h75b4;
      expv[53] = 16'ha8a2;
      expv[54] = 16'ha8a2;
      expv[55] = 16'ha8a2;
      expv[56] = 16'hcd9d;
      expv[57] = 16'h208b;
      expv[58] = 16'hcced;
      expv[59] = 16'h2378;
      expv[60] = 16'h2378;
      expv[61] = 16'h8c4d;
      expv[62] = 16'h7167;
      expv[63] = 16'h7167;
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
