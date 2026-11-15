// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  NV_DW02_tree dut (
    .INPUT(in_vec[63:0]),
    .OUT0(out_vec[15:8]),
    .OUT1(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h1da791100b3c5a4f;
    stim[1] = 64'h207bd3ae345bf69e;
    stim[2] = 64'h2d4e749d74747787;
    stim[3] = 64'h45d5142a14c046c6;
    stim[4] = 64'h6482989f229015a6;
    stim[5] = 64'h9d496313fc7b4ce7;
    stim[6] = 64'h344b1396fa3e1cad;
    stim[7] = 64'h717f06b5bb6a04e7;
    stim[8] = 64'hec1ae0928370f7a6;
    stim[9] = 64'h6af3b3855251d34a;
    stim[10] = 64'h1035251c20a8f720;
    stim[11] = 64'hbe99da86312f6dda;
    stim[12] = 64'hb6cc252a10fbe23e;
    stim[13] = 64'h03d7d1ed461da4bc;
    stim[14] = 64'hb6578e2e2e46229a;
    stim[15] = 64'hcee4999df84ce139;
    stim[16] = 64'h3a5d20b3a97b8279;
    stim[17] = 64'h6344c572f11522cd;
    stim[18] = 64'hb0bdf9a2654e229c;
    stim[19] = 64'h8f8e4bbcfc6204fe;
    stim[20] = 64'h7b9b559131e69ae5;
    stim[21] = 64'hf5a4c4fb74d04bdf;
    stim[22] = 64'h10c5bc6f53c30c13;
    stim[23] = 64'hf1eb93af7fcfd663;
    stim[24] = 64'h7c69b656842c7380;
    stim[25] = 64'h816d63ab2b8ac203;
    stim[26] = 64'h5609d443170f6a60;
    stim[27] = 64'h966193008a848858;
    stim[28] = 64'h5ecfae144089feab;
    stim[29] = 64'h648cb9544caff1e7;
    stim[30] = 64'h99fbd2cff49e1d10;
    stim[31] = 64'h67894f825243827f;
    stim[32] = 64'h7d333220539ba798;
    stim[33] = 64'h1f79539f93fce695;
    stim[34] = 64'h5347f2fd7a817e94;
    stim[35] = 64'h8217dbee8154249b;
    stim[36] = 64'hc04211a521ff6bfa;
    stim[37] = 64'h58f1e54255420e33;
    stim[38] = 64'hf444170644253548;
    stim[39] = 64'h0c21af95c1db8e51;
    stim[40] = 64'h55a7a40ad1e12ed4;
    stim[41] = 64'hef06f3c9b62f7d3e;
    stim[42] = 64'hd11cb59b67cf2bde;
    stim[43] = 64'h013aea5db92e4b9f;
    stim[44] = 64'hd5a6f0014d874ad2;
    stim[45] = 64'hb15b4d557674becb;
    stim[46] = 64'h383c0ed37ce30bb1;
    stim[47] = 64'h93f48dcecc090d04;
    stim[48] = 64'h05c7403cb6e65cc2;
    stim[49] = 64'h8317323efb2341e9;
    stim[50] = 64'ha6e98c8150f67e08;
    stim[51] = 64'h37df56b7aff4bf5d;
    stim[52] = 64'h662494849303045b;
    stim[53] = 64'he8172595328b6711;
    stim[54] = 64'h4a324da8a1bf58de;
    stim[55] = 64'hb9f91f2ad9901633;
    stim[56] = 64'hb84b92192882a72e;
    stim[57] = 64'h95b45768a61ed658;
    stim[58] = 64'h82bf8ba51a5fd4fc;
    stim[59] = 64'h6072fae838890b52;
    stim[60] = 64'h0c740702946154ea;
    stim[61] = 64'ha20cc5a5ac4937c1;
    stim[62] = 64'h782b92401ed5a2d7;
    stim[63] = 64'h0159865d41292ee4;
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
      expv[0] = 16'ha9ac;
      expv[1] = 16'hbf80;
      expv[2] = 16'h8ae8;
      expv[3] = 16'ha494;
      expv[4] = 16'h7218;
      expv[5] = 16'hf610;
      expv[6] = 16'hd158;
      expv[7] = 16'h4378;
      expv[8] = 16'hf018;
      expv[9] = 16'hada8;
      expv[10] = 16'h95d0;
      expv[11] = 16'hbea0;
      expv[12] = 16'hcc30;
      expv[13] = 16'h0358;
      expv[14] = 16'h01f8;
      expv[15] = 16'hb690;
      expv[16] = 16'h7118;
      expv[17] = 16'h0bc8;
      expv[18] = 16'hb1c8;
      expv[19] = 16'h186c;
      expv[20] = 16'heaa8;
      expv[21] = 16'h3690;
      expv[22] = 16'hc570;
      expv[23] = 16'hd9cc;
      expv[24] = 16'he0b4;
      expv[25] = 16'h4630;
      expv[26] = 16'h1650;
      expv[27] = 16'h6414;
      expv[28] = 16'hb9a8;
      expv[29] = 16'h28a8;
      expv[30] = 16'h08ec;
      expv[31] = 16'ha7b0;
      expv[32] = 16'hcf60;
      expv[33] = 16'ha8ec;
      expv[34] = 16'h4e48;
      expv[35] = 16'hae48;
      expv[36] = 16'h3d00;
      expv[37] = 16'ha4a4;
      expv[38] = 16'hab90;
      expv[39] = 16'hc824;
      expv[40] = 16'h8ed0;
      expv[41] = 16'hb998;
      expv[42] = 16'h88f4;
      expv[43] = 16'haba8;
      expv[44] = 16'h80dc;
      expv[45] = 16'hdd44;
      expv[46] = 16'h88e8;
      expv[47] = 16'h7454;
      expv[48] = 16'hfa08;
      expv[49] = 16'hba98;
      expv[50] = 16'hc4a4;
      expv[51] = 16'h2ab8;
      expv[52] = 16'h6730;
      expv[53] = 16'h0ee0;
      expv[54] = 16'he720;
      expv[55] = 16'hc9e4;
      expv[56] = 16'hcd60;
      expv[57] = 16'h2ad0;
      expv[58] = 16'h4278;
      expv[59] = 16'h02d0;
      expv[60] = 16'h0cb0;
      expv[61] = 16'hf510;
      expv[62] = 16'h19c8;
      expv[63] = 16'h3584;
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
