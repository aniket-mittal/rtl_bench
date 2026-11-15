// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  zet_div_uu dut (
    .clk(clk),
    .ena(in_vec[24:24]),
    .z(in_vec[23:8]),
    .d(in_vec[7:0]),
    .q(out_vec[17:10]),
    .s(out_vec[9:2]),
    .div0(out_vec[1:1]),
    .ovf(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h081fb79;
    stim[1] = 25'h1e4615e;
    stim[2] = 25'h16d6d26;
    stim[3] = 25'h1bfdb61;
    stim[4] = 25'h1cc6ebe;
    stim[5] = 25'h1f8d1b7;
    stim[6] = 25'h0f15750;
    stim[7] = 25'h06040aa;
    stim[8] = 25'h10d883c;
    stim[9] = 25'h15c265a;
    stim[10] = 25'h0d528ce;
    stim[11] = 25'h007873a;
    stim[12] = 25'h03f7e57;
    stim[13] = 25'h038051b;
    stim[14] = 25'h14852ab;
    stim[15] = 25'h17982b5;
    stim[16] = 25'h1fdc1a1;
    stim[17] = 25'h09ea499;
    stim[18] = 25'h1321158;
    stim[19] = 25'h053c815;
    stim[20] = 25'h150a9ec;
    stim[21] = 25'h0704383;
    stim[22] = 25'h0a36eec;
    stim[23] = 25'h0c59aec;
    stim[24] = 25'h190f22e;
    stim[25] = 25'h04ba42e;
    stim[26] = 25'h0edd257;
    stim[27] = 25'h040d03d;
    stim[28] = 25'h1fbfb78;
    stim[29] = 25'h1b7cdeb;
    stim[30] = 25'h1f38209;
    stim[31] = 25'h19ed9e9;
    stim[32] = 25'h19bd51c;
    stim[33] = 25'h0f5d76a;
    stim[34] = 25'h09e64a3;
    stim[35] = 25'h1a506dd;
    stim[36] = 25'h0571319;
    stim[37] = 25'h13f64d0;
    stim[38] = 25'h047251e;
    stim[39] = 25'h0464909;
    stim[40] = 25'h117c39c;
    stim[41] = 25'h1aff923;
    stim[42] = 25'h099c6b3;
    stim[43] = 25'h172b465;
    stim[44] = 25'h1a5142d;
    stim[45] = 25'h0080629;
    stim[46] = 25'h0f718d1;
    stim[47] = 25'h0417479;
    stim[48] = 25'h05884b7;
    stim[49] = 25'h0d641b4;
    stim[50] = 25'h118990e;
    stim[51] = 25'h02ee23c;
    stim[52] = 25'h0994a23;
    stim[53] = 25'h09e51df;
    stim[54] = 25'h15c9f0d;
    stim[55] = 25'h0b2fb2e;
    stim[56] = 25'h1b8d23f;
    stim[57] = 25'h16d9a78;
    stim[58] = 25'h0b2fe7b;
    stim[59] = 25'h1c5dbd4;
    stim[60] = 25'h04f01dc;
    stim[61] = 25'h0ae8800;
    stim[62] = 25'h1de20fd;
    stim[63] = 25'h1772e72;
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
      expv[1] = 18'hxxxxx;
      expv[2] = 18'hxxxxx;
      expv[3] = 18'hxxxxx;
      expv[4] = 18'hxxxxx;
      expv[5] = 18'hxxxxx;
      expv[6] = 18'hxxxxx;
      expv[7] = 18'hxxxxx;
      expv[8] = 18'hxxxxx;
      expv[9] = 18'hxxxxx;
      expv[10] = 18'hxxxxx;
      expv[11] = 18'hxxxxx;
      expv[12] = 18'hxxxxx;
      expv[13] = 18'hxxxxx;
      expv[14] = 18'hxxxxx;
      expv[15] = 18'hxxxxx;
      expv[16] = 18'h0ae5d;
      expv[17] = 18'h2b395;
      expv[18] = 18'h2b395;
      expv[19] = 18'h19f51;
      expv[20] = 18'h19f51;
      expv[21] = 18'h323f9;
      expv[22] = 18'h323f9;
      expv[23] = 18'h323f9;
      expv[24] = 18'h323f9;
      expv[25] = 18'h067c9;
      expv[26] = 18'h067c9;
      expv[27] = 18'h067c9;
      expv[28] = 18'h067c9;
      expv[29] = 18'h0e4b0;
      expv[30] = 18'h3f239;
      expv[31] = 18'h1b0b8;
      expv[32] = 18'h2ae6c;
      expv[33] = 18'h01bed;
      expv[34] = 18'h01bed;
      expv[35] = 18'h01bed;
      expv[36] = 18'h244e4;
      expv[37] = 18'h244e4;
      expv[38] = 18'h15dd4;
      expv[39] = 18'h15dd4;
      expv[40] = 18'h15dd4;
      expv[41] = 18'h21ec1;
      expv[42] = 18'h01ecd;
      expv[43] = 18'h01ecd;
      expv[44] = 18'h320d4;
      expv[45] = 18'h03059;
      expv[46] = 18'h03059;
      expv[47] = 18'h03059;
      expv[48] = 18'h03059;
      expv[49] = 18'h03059;
      expv[50] = 18'h03059;
      expv[51] = 18'h2b9ec;
      expv[52] = 18'h2b9ec;
      expv[53] = 18'h2b9ec;
      expv[54] = 18'h2b9ec;
      expv[55] = 18'h1c255;
      expv[56] = 18'h1c255;
      expv[57] = 18'h2fc8c;
      expv[58] = 18'h13810;
      expv[59] = 18'h13810;
      expv[60] = 18'h09a6c;
      expv[61] = 18'h09a6c;
      expv[62] = 18'h09a6c;
      expv[63] = 18'h17195;
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
