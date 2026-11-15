// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_215988 dut (
    .S_AXIS_ACLK(clk),
    .S_AXIS_ARESETN(in_vec[39:39]),
    .S_AXIS_TDATA(in_vec[38:7]),
    .S_AXIS_TSTRB(in_vec[6:3]),
    .S_AXIS_TLAST(in_vec[2:2]),
    .S_AXIS_TVALID(in_vec[1:1]),
    .DOUT_ACCEP(in_vec[0:0]),
    .S_AXIS_TREADY(out_vec[33:33]),
    .DOUT_TO_BUF(out_vec[32:1]),
    .DOUT_VALID(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h38c24f64a4;
    stim[1] = 40'h32a9d56672;
    stim[2] = 40'hede4910564;
    stim[3] = 40'h84b37baec6;
    stim[4] = 40'h95154d8ae8;
    stim[5] = 40'h84332706b4;
    stim[6] = 40'hd8d9aaa38f;
    stim[7] = 40'hd4d22bf800;
    stim[8] = 40'heacddef4df;
    stim[9] = 40'heb8ab9fae9;
    stim[10] = 40'hc50e0b7678;
    stim[11] = 40'haab9fbf3e0;
    stim[12] = 40'h8bf446af63;
    stim[13] = 40'hf33ef6b61f;
    stim[14] = 40'h9a2b8d27ad;
    stim[15] = 40'hc6a3efc893;
    stim[16] = 40'hf91bd2cdb9;
    stim[17] = 40'h897b150b3d;
    stim[18] = 40'hb9335aa8a4;
    stim[19] = 40'hd7fe92b267;
    stim[20] = 40'hc9624b59a4;
    stim[21] = 40'he656da9466;
    stim[22] = 40'hcb29e3ee4c;
    stim[23] = 40'hfa502988a2;
    stim[24] = 40'hdda302b111;
    stim[25] = 40'hfd76d6a5f2;
    stim[26] = 40'hf59e46894a;
    stim[27] = 40'hbd9b0a85b6;
    stim[28] = 40'hf5242a10d0;
    stim[29] = 40'hef1cff51f4;
    stim[30] = 40'hd48e0a3294;
    stim[31] = 40'he121e08371;
    stim[32] = 40'h87542424d2;
    stim[33] = 40'hec480d0624;
    stim[34] = 40'hd68601d260;
    stim[35] = 40'hf5011257b2;
    stim[36] = 40'hbfba9529c7;
    stim[37] = 40'hd02105df45;
    stim[38] = 40'hc92d75aa86;
    stim[39] = 40'heabd4f2e0b;
    stim[40] = 40'hd5d55f9562;
    stim[41] = 40'hd71f805800;
    stim[42] = 40'h9ce0a87431;
    stim[43] = 40'h8f11458d86;
    stim[44] = 40'hbb15ff0a75;
    stim[45] = 40'h929b4c3b07;
    stim[46] = 40'hb9b2b00518;
    stim[47] = 40'ha0475b179c;
    stim[48] = 40'hb5a4c63457;
    stim[49] = 40'hd64a5a17eb;
    stim[50] = 40'ha3a5a13b1f;
    stim[51] = 40'hbdc2cf1fc9;
    stim[52] = 40'ha3adf0a7b2;
    stim[53] = 40'h8bb37fd46d;
    stim[54] = 40'h93afef612b;
    stim[55] = 40'ha8dff4c596;
    stim[56] = 40'h938bc8875d;
    stim[57] = 40'hca3c459b3f;
    stim[58] = 40'hcd3cf0aa47;
    stim[59] = 40'h90a39b28af;
    stim[60] = 40'he562d449de;
    stim[61] = 40'hce8ecdfde6;
    stim[62] = 40'hadba1abe2d;
    stim[63] = 40'hf1179718a9;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h05455362a;
      expv[6] = 34'h210cc9c1a;
      expv[7] = 34'h010cc9c1a;
      expv[8] = 34'h15348afe0;
      expv[9] = 34'h3ab377bd2;
      expv[10] = 34'h3ab377bd2;
      expv[11] = 34'h3ab377bd2;
      expv[12] = 34'h3ab377bd2;
      expv[13] = 34'h1ab377bd2;
      expv[14] = 34'h3ccfbdad8;
      expv[15] = 34'h3ccfbdad8;
      expv[16] = 34'h1ccfbdad8;
      expv[17] = 34'h1e46f4b37;
      expv[18] = 34'h225ec542d;
      expv[19] = 34'h225ec542d;
      expv[20] = 34'h025ec542d;
      expv[21] = 34'h325892d66;
      expv[22] = 34'h125892d66;
      expv[23] = 34'h32ca78fb8;
      expv[24] = 34'h12ca78fb8;
      expv[25] = 34'h1768c0ac4;
      expv[26] = 34'h1f5db5a96;
      expv[27] = 34'h1d6791a24;
      expv[28] = 34'h2f66c2a16;
      expv[29] = 34'h2f66c2a16;
      expv[30] = 34'h2f66c2a16;
      expv[31] = 34'h2f66c2a16;
      expv[32] = 34'h2f66c2a16;
      expv[33] = 34'h0f66c2a16;
      expv[34] = 34'h3b1203418;
      expv[35] = 34'h3b1203418;
      expv[36] = 34'h1b1203418;
      expv[37] = 34'h2feea54a6;
      expv[38] = 34'h2feea54a6;
      expv[39] = 34'h0feea54a6;
      expv[40] = 34'h1aaf53cb8;
      expv[41] = 34'h157557e55;
      expv[42] = 34'h15c7e0161;
      expv[43] = 34'h07382a1d0;
      expv[44] = 34'h23c451636;
      expv[45] = 34'h23c451636;
      expv[46] = 34'h03c451636;
      expv[47] = 34'h0e6cac014;
      expv[48] = 34'h2811d6c5e;
      expv[49] = 34'h0811d6c5e;
      expv[50] = 34'h15929685e;
      expv[51] = 34'h28e9684ec;
      expv[52] = 34'h28e9684ec;
      expv[53] = 34'h08e9684ec;
      expv[54] = 34'h22ecdff51;
      expv[55] = 34'h02ecdff51;
      expv[56] = 34'h2a37fd317;
      expv[57] = 34'h2a37fd317;
      expv[58] = 34'h0a37fd317;
      expv[59] = 34'h334f3c2a8;
      expv[60] = 34'h134f3c2a8;
      expv[61] = 34'h3958b5126;
      expv[62] = 34'h1958b5126;
      expv[63] = 34'h2b6e86af9;
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
