// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  i3c_controller_unpack dut (
    .clk(clk),
    .reset_n(in_vec[35:35]),
    .stop(in_vec[34:34]),
    .u32_valid(in_vec[33:33]),
    .u32(in_vec[32:1]),
    .u8_ready(in_vec[0:0]),
    .u32_ready(out_vec[21:21]),
    .u8_lvl(out_vec[20:9]),
    .u8_valid(out_vec[8:8]),
    .u8(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h2dd29a4fa;
    stim[1] = 36'h6df5b6d45;
    stim[2] = 36'hb189b63dc;
    stim[3] = 36'he50935bcb;
    stim[4] = 36'he0029e970;
    stim[5] = 36'hac48c9c9d;
    stim[6] = 36'h4f45eabb4;
    stim[7] = 36'h8940cf08d;
    stim[8] = 36'hdff599309;
    stim[9] = 36'ha4621bceb;
    stim[10] = 36'he8dd27288;
    stim[11] = 36'hc50322144;
    stim[12] = 36'h95caa756c;
    stim[13] = 36'hfe66b0d2d;
    stim[14] = 36'h9b6f6bcc5;
    stim[15] = 36'hd68064b3b;
    stim[16] = 36'hf1474b014;
    stim[17] = 36'hb3afa64e7;
    stim[18] = 36'hd5890860d;
    stim[19] = 36'h9d4307b64;
    stim[20] = 36'hdcae7d7e0;
    stim[21] = 36'ha37a5a586;
    stim[22] = 36'he2681763a;
    stim[23] = 36'hbae282d69;
    stim[24] = 36'h93529935a;
    stim[25] = 36'h1f02cc466;
    stim[26] = 36'hbf5a0075e;
    stim[27] = 36'heece5ac49;
    stim[28] = 36'hc483dea29;
    stim[29] = 36'hf6def50f8;
    stim[30] = 36'hfd87d8981;
    stim[31] = 36'hd35d5d605;
    stim[32] = 36'hdc76ecff2;
    stim[33] = 36'h8981236d5;
    stim[34] = 36'ha08b701b3;
    stim[35] = 36'h9d2a1ceed;
    stim[36] = 36'hf5a1e5ee5;
    stim[37] = 36'h8b8c574a2;
    stim[38] = 36'hddb63863b;
    stim[39] = 36'hcbe42a8e5;
    stim[40] = 36'hdd5309b40;
    stim[41] = 36'h8a5b3f1b7;
    stim[42] = 36'hdccb440c7;
    stim[43] = 36'hdfe83a74b;
    stim[44] = 36'h899187eca;
    stim[45] = 36'haac6fa616;
    stim[46] = 36'hc15ce1299;
    stim[47] = 36'hac84966d6;
    stim[48] = 36'h8db27aacf;
    stim[49] = 36'h848f22224;
    stim[50] = 36'he3254c15c;
    stim[51] = 36'he527205b0;
    stim[52] = 36'hf68aca840;
    stim[53] = 36'h8b70dff68;
    stim[54] = 36'h9795e7857;
    stim[55] = 36'hdd2009c26;
    stim[56] = 36'hf41917cee;
    stim[57] = 36'hd7197f5ac;
    stim[58] = 36'hbf15202df;
    stim[59] = 36'hda7159725;
    stim[60] = 36'he17685945;
    stim[61] = 36'hff8a8c294;
    stim[62] = 36'h9aa6ad6f0;
    stim[63] = 36'hd01b191ca;
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
      expv[0] = 22'hxxxxxx;
      expv[1] = 22'h2000xx;
      expv[2] = 22'h2000xx;
      expv[3] = 22'h0001ee;
      expv[4] = 22'h2000ee;
      expv[5] = 22'h2000ee;
      expv[6] = 22'h00014e;
      expv[7] = 22'h20004e;
      expv[8] = 22'h200046;
      expv[9] = 22'h200046;
      expv[10] = 22'h000175;
      expv[11] = 22'h200075;
      expv[12] = 22'h200075;
      expv[13] = 22'h2000b6;
      expv[14] = 22'h2000b6;
      expv[15] = 22'h200062;
      expv[16] = 22'h200062;
      expv[17] = 22'h200062;
      expv[18] = 22'h000173;
      expv[19] = 22'h200073;
      expv[20] = 22'h2000b2;
      expv[21] = 22'h2000b2;
      expv[22] = 22'h0001c3;
      expv[23] = 22'h2000c3;
      expv[24] = 22'h0001b4;
      expv[25] = 22'h0001b4;
      expv[26] = 22'h2000b4;
      expv[27] = 22'h0001af;
      expv[28] = 22'h2000af;
      expv[29] = 22'h2000af;
      expv[30] = 22'h2000af;
      expv[31] = 22'h2000af;
      expv[32] = 22'h2000af;
      expv[33] = 22'h2000af;
      expv[34] = 22'h20006a;
      expv[35] = 22'h0001d9;
      expv[36] = 22'h000380;
      expv[37] = 22'h200080;
      expv[38] = 22'h200051;
      expv[39] = 22'h200051;
      expv[40] = 22'h200051;
      expv[41] = 22'h200051;
      expv[42] = 22'h2000db;
      expv[43] = 22'h2000db;
      expv[44] = 22'h2000db;
      expv[45] = 22'h200065;
      expv[46] = 22'h00010b;
      expv[47] = 22'h20000b;
      expv[48] = 22'h00016b;
      expv[49] = 22'h0003b3;
      expv[50] = 22'h0003b3;
      expv[51] = 22'h2000b3;
      expv[52] = 22'h2000b3;
      expv[53] = 22'h2000b3;
      expv[54] = 22'h2000b4;
      expv[55] = 22'h20002b;
      expv[56] = 22'h20002b;
      expv[57] = 22'h20002b;
      expv[58] = 22'h20002b;
      expv[59] = 22'h00016f;
      expv[60] = 22'h20006f;
      expv[61] = 22'h20006f;
      expv[62] = 22'h20006f;
      expv[63] = 22'h200078;
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
