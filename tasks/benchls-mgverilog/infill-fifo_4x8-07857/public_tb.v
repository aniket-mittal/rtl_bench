// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07857 dut (
    .clk(clk),
    .rst_n(in_vec[11:11]),
    .clr(in_vec[10:10]),
    .din(in_vec[9:2]),
    .we(in_vec[1:1]),
    .re(in_vec[0:0]),
    .dout(out_vec[9:2]),
    .full(out_vec[1:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h257;
    stim[1] = 12'h713;
    stim[2] = 12'ha3a;
    stim[3] = 12'hc4c;
    stim[4] = 12'he5a;
    stim[5] = 12'hf5c;
    stim[6] = 12'h860;
    stim[7] = 12'h986;
    stim[8] = 12'h9b1;
    stim[9] = 12'hd21;
    stim[10] = 12'hbd2;
    stim[11] = 12'hc21;
    stim[12] = 12'hac1;
    stim[13] = 12'hef7;
    stim[14] = 12'hbb6;
    stim[15] = 12'hdc8;
    stim[16] = 12'h89f;
    stim[17] = 12'hc16;
    stim[18] = 12'hbb2;
    stim[19] = 12'h5e8;
    stim[20] = 12'hdde;
    stim[21] = 12'hb40;
    stim[22] = 12'h90a;
    stim[23] = 12'h8ce;
    stim[24] = 12'hf16;
    stim[25] = 12'he22;
    stim[26] = 12'hd34;
    stim[27] = 12'hd76;
    stim[28] = 12'hfb6;
    stim[29] = 12'hf57;
    stim[30] = 12'h8d0;
    stim[31] = 12'hfc4;
    stim[32] = 12'h987;
    stim[33] = 12'hd19;
    stim[34] = 12'hb7e;
    stim[35] = 12'hef1;
    stim[36] = 12'h943;
    stim[37] = 12'hf2b;
    stim[38] = 12'h5fe;
    stim[39] = 12'hfd7;
    stim[40] = 12'h873;
    stim[41] = 12'hf2f;
    stim[42] = 12'hddb;
    stim[43] = 12'h845;
    stim[44] = 12'h9f0;
    stim[45] = 12'h9df;
    stim[46] = 12'h8a9;
    stim[47] = 12'hc9e;
    stim[48] = 12'hfc6;
    stim[49] = 12'hc79;
    stim[50] = 12'hb5f;
    stim[51] = 12'hf7c;
    stim[52] = 12'h856;
    stim[53] = 12'hfc9;
    stim[54] = 12'hc24;
    stim[55] = 12'hf17;
    stim[56] = 12'h8ca;
    stim[57] = 12'hd00;
    stim[58] = 12'hb92;
    stim[59] = 12'hcf8;
    stim[60] = 12'he00;
    stim[61] = 12'h80d;
    stim[62] = 12'h92c;
    stim[63] = 12'hed9;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h255;
      expv[2] = 10'h311;
      expv[3] = 10'h238;
      expv[4] = 10'h239;
      expv[5] = 10'h259;
      expv[6] = 10'h259;
      expv[7] = 10'h259;
      expv[8] = 10'h184;
      expv[9] = 10'hxxx;
      expv[10] = 10'h185;
      expv[11] = 10'h3d0;
      expv[12] = 10'h3d1;
      expv[13] = 10'hxxx;
      expv[14] = 10'h2f5;
      expv[15] = 10'h3b4;
      expv[16] = 10'h3b5;
      expv[17] = 10'hxxx;
      expv[18] = 10'h09d;
      expv[19] = 10'h3b1;
      expv[20] = 10'h3b1;
      expv[21] = 10'h1dd;
      expv[22] = 10'h1dd;
      expv[23] = 10'h108;
      expv[24] = 10'h108;
      expv[25] = 10'h109;
      expv[26] = 10'h221;
      expv[27] = 10'h221;
      expv[28] = 10'h175;
      expv[29] = 10'h3b5;
      expv[30] = 10'h355;
      expv[31] = 10'h355;
      expv[32] = 10'h355;
      expv[33] = 10'h0cd;
      expv[34] = 10'h185;
      expv[35] = 10'h37c;
      expv[36] = 10'h37d;
      expv[37] = 10'h0cd;
      expv[38] = 10'h141;
      expv[39] = 10'h1fd;
      expv[40] = 10'h3d5;
      expv[41] = 10'h329;
      expv[42] = 10'h071;
      expv[43] = 10'h1d9;
      expv[44] = 10'h32c;
      expv[45] = 10'h32c;
      expv[46] = 10'h314;
      expv[47] = 10'hxxx;
      expv[48] = 10'h1dd;
      expv[49] = 10'h3c5;
      expv[50] = 10'h3c5;
      expv[51] = 10'h09d;
      expv[52] = 10'h35d;
      expv[53] = 10'h054;
      expv[54] = 10'h055;
      expv[55] = 10'h055;
      expv[56] = 10'h315;
      expv[57] = 10'h0c8;
      expv[58] = 10'h0c9;
      expv[59] = 10'h390;
      expv[60] = 10'h391;
      expv[61] = 10'h391;
      expv[62] = 10'h09c;
      expv[63] = 10'h09c;
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
