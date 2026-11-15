// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_085400 dut (
    .sec_ones(in_vec[11:8]),
    .sec_tens(in_vec[7:4]),
    .min(in_vec[3:0]),
    .sec_ones_segs(out_vec[20:14]),
    .sec_tens_segs(out_vec[13:7]),
    .min_segs(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hb62;
    stim[1] = 12'h73d;
    stim[2] = 12'h621;
    stim[3] = 12'h8a1;
    stim[4] = 12'h0b7;
    stim[5] = 12'ha1c;
    stim[6] = 12'h41c;
    stim[7] = 12'hc5c;
    stim[8] = 12'h4a2;
    stim[9] = 12'h6ac;
    stim[10] = 12'h3a7;
    stim[11] = 12'h32c;
    stim[12] = 12'h416;
    stim[13] = 12'h151;
    stim[14] = 12'hf8f;
    stim[15] = 12'h8a5;
    stim[16] = 12'h419;
    stim[17] = 12'h387;
    stim[18] = 12'h3e2;
    stim[19] = 12'he2f;
    stim[20] = 12'h945;
    stim[21] = 12'hedc;
    stim[22] = 12'h711;
    stim[23] = 12'h5b7;
    stim[24] = 12'h2fc;
    stim[25] = 12'h02d;
    stim[26] = 12'h234;
    stim[27] = 12'he74;
    stim[28] = 12'h9e3;
    stim[29] = 12'h59a;
    stim[30] = 12'h44f;
    stim[31] = 12'h3f0;
    stim[32] = 12'hd89;
    stim[33] = 12'h737;
    stim[34] = 12'h3cc;
    stim[35] = 12'h19f;
    stim[36] = 12'h115;
    stim[37] = 12'ha48;
    stim[38] = 12'h2bf;
    stim[39] = 12'h016;
    stim[40] = 12'hff8;
    stim[41] = 12'h900;
    stim[42] = 12'ha8d;
    stim[43] = 12'h62c;
    stim[44] = 12'h4ee;
    stim[45] = 12'hac8;
    stim[46] = 12'hc19;
    stim[47] = 12'h499;
    stim[48] = 12'h4c4;
    stim[49] = 12'hbcb;
    stim[50] = 12'h77d;
    stim[51] = 12'hc9c;
    stim[52] = 12'h77c;
    stim[53] = 12'h973;
    stim[54] = 12'hb80;
    stim[55] = 12'h377;
    stim[56] = 12'hb29;
    stim[57] = 12'h91f;
    stim[58] = 12'h962;
    stim[59] = 12'hf0c;
    stim[60] = 12'hb0a;
    stim[61] = 12'h668;
    stim[62] = 12'hb2b;
    stim[63] = 12'h86b;
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
      expv[0] = 21'hxxxxx2;
      expv[1] = 21'h03c3xx;
      expv[2] = 21'h08094f;
      expv[3] = 21'h00xxxf;
      expv[4] = 21'h00xxxf;
      expv[5] = 21'hxxx7xx;
      expv[6] = 21'h1327xx;
      expv[7] = 21'hxxx2xx;
      expv[8] = 21'h13xxx2;
      expv[9] = 21'h08xxxx;
      expv[10] = 21'h01xxxf;
      expv[11] = 21'h0189xx;
      expv[12] = 21'h1327a0;
      expv[13] = 21'h13d24f;
      expv[14] = 21'hxxxxxx;
      expv[15] = 21'h00xxx4;
      expv[16] = 21'h132784;
      expv[17] = 21'h01xxxf;
      expv[18] = 21'h01xxx2;
      expv[19] = 21'hxxx9xx;
      expv[20] = 21'h012624;
      expv[21] = 21'hxxxxxx;
      expv[22] = 21'h03e7cf;
      expv[23] = 21'h09xxxf;
      expv[24] = 21'h04xxxx;
      expv[25] = 21'h0049xx;
      expv[26] = 21'h04834c;
      expv[27] = 21'hxxxxxc;
      expv[28] = 21'h01xxx6;
      expv[29] = 21'h09xxxx;
      expv[30] = 21'h1326xx;
      expv[31] = 21'h01xxx1;
      expv[32] = 21'hxxxxx4;
      expv[33] = 21'h03c30f;
      expv[34] = 21'h01xxxx;
      expv[35] = 21'h13xxxx;
      expv[36] = 21'h13e7a4;
      expv[37] = 21'hxxx600;
      expv[38] = 21'h04xxxx;
      expv[39] = 21'h0067a0;
      expv[40] = 21'hxxxxx0;
      expv[41] = 21'h010081;
      expv[42] = 21'hxxxxxx;
      expv[43] = 21'h0809xx;
      expv[44] = 21'h13xxxx;
      expv[45] = 21'hxxxxx0;
      expv[46] = 21'hxxx784;
      expv[47] = 21'h13xxx4;
      expv[48] = 21'h13xxxc;
      expv[49] = 21'hxxxxxx;
      expv[50] = 21'h03xxxx;
      expv[51] = 21'hxxxxxx;
      expv[52] = 21'h03xxxx;
      expv[53] = 21'h01xxx6;
      expv[54] = 21'hxxxxx1;
      expv[55] = 21'h01xxxf;
      expv[56] = 21'hxxx904;
      expv[57] = 21'h0127xx;
      expv[58] = 21'h01xxx2;
      expv[59] = 21'hxxx0xx;
      expv[60] = 21'hxxx0xx;
      expv[61] = 21'h08xxx0;
      expv[62] = 21'hxxx9xx;
      expv[63] = 21'h00xxxx;
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
