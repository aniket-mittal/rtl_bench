// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_091847 dut (
    .CLK_slow(clk),
    .Data(in_vec[16:1]),
    .Clear(in_vec[0:0]),
    .Select(out_vec[11:8]),
    .Segment(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1d213;
    stim[1] = 17'h13263;
    stim[2] = 17'h187a0;
    stim[3] = 17'h03c0a;
    stim[4] = 17'h17426;
    stim[5] = 17'h070da;
    stim[6] = 17'h0944c;
    stim[7] = 17'h18718;
    stim[8] = 17'h06366;
    stim[9] = 17'h151b8;
    stim[10] = 17'h02dfa;
    stim[11] = 17'h0afd0;
    stim[12] = 17'h038c6;
    stim[13] = 17'h0559e;
    stim[14] = 17'h101c6;
    stim[15] = 17'h17d4a;
    stim[16] = 17'h11b1e;
    stim[17] = 17'h06f1c;
    stim[18] = 17'h07cac;
    stim[19] = 17'h0e0d0;
    stim[20] = 17'h19d78;
    stim[21] = 17'h01508;
    stim[22] = 17'h13a76;
    stim[23] = 17'h17410;
    stim[24] = 17'h0292e;
    stim[25] = 17'h10036;
    stim[26] = 17'h1ef0c;
    stim[27] = 17'h06e66;
    stim[28] = 17'h1f93a;
    stim[29] = 17'h18e9c;
    stim[30] = 17'h07cdc;
    stim[31] = 17'h1e14e;
    stim[32] = 17'h09ea4;
    stim[33] = 17'h0b78e;
    stim[34] = 17'h12584;
    stim[35] = 17'h03b62;
    stim[36] = 17'h0e774;
    stim[37] = 17'h04016;
    stim[38] = 17'h06316;
    stim[39] = 17'h089de;
    stim[40] = 17'h0d100;
    stim[41] = 17'h167e6;
    stim[42] = 17'h1a072;
    stim[43] = 17'h091b4;
    stim[44] = 17'h0e356;
    stim[45] = 17'h01c8c;
    stim[46] = 17'h1dc00;
    stim[47] = 17'h111b2;
    stim[48] = 17'h1862a;
    stim[49] = 17'h19060;
    stim[50] = 17'h162c8;
    stim[51] = 17'h1d1ac;
    stim[52] = 17'h1259a;
    stim[53] = 17'h00b76;
    stim[54] = 17'h08a32;
    stim[55] = 17'h0795e;
    stim[56] = 17'h02c38;
    stim[57] = 17'h01076;
    stim[58] = 17'h0c614;
    stim[59] = 17'h1aed2;
    stim[60] = 17'h17614;
    stim[61] = 17'h0a530;
    stim[62] = 17'h078ae;
    stim[63] = 17'h15b80;
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
      expv[0] = 12'heff;
      expv[1] = 12'heff;
      expv[2] = 12'hec0;
      expv[3] = 12'hdc0;
      expv[4] = 12'hb88;
      expv[5] = 12'h7b0;
      expv[6] = 12'he82;
      expv[7] = 12'hd80;
      expv[8] = 12'hbf9;
      expv[9] = 12'h788;
      expv[10] = 12'hea1;
      expv[11] = 12'hd86;
      expv[12] = 12'hbc6;
      expv[13] = 12'h7a4;
      expv[14] = 12'heb0;
      expv[15] = 12'hd88;
      expv[16] = 12'hba1;
      expv[17] = 12'h7b0;
      expv[18] = 12'he82;
      expv[19] = 12'hd82;
      expv[20] = 12'hb86;
      expv[21] = 12'h7c0;
      expv[22] = 12'he83;
      expv[23] = 12'hdc0;
      expv[24] = 12'hb99;
      expv[25] = 12'h780;
      expv[26] = 12'he82;
      expv[27] = 12'hdb0;
      expv[28] = 12'hbc6;
      expv[29] = 12'h7c6;
      expv[30] = 12'he86;
      expv[31] = 12'hd88;
      expv[32] = 12'hb8e;
      expv[33] = 12'h792;
      expv[34] = 12'hea4;
      expv[35] = 12'hd83;
      expv[36] = 12'hbb0;
      expv[37] = 12'h7a4;
      expv[38] = 12'he83;
      expv[39] = 12'hd86;
      expv[40] = 12'hb80;
      expv[41] = 12'h783;
      expv[42] = 12'he90;
      expv[43] = 12'hda1;
      expv[44] = 12'hbf9;
      expv[45] = 12'h7c0;
      expv[46] = 12'hec0;
      expv[47] = 12'hda1;
      expv[48] = 12'hbb0;
      expv[49] = 12'h7c6;
      expv[50] = 12'he99;
      expv[51] = 12'hda1;
      expv[52] = 12'hba4;
      expv[53] = 12'h7c0;
      expv[54] = 12'he90;
      expv[55] = 12'hd88;
      expv[56] = 12'hb82;
      expv[57] = 12'h7c0;
      expv[58] = 12'he88;
      expv[59] = 12'hd82;
      expv[60] = 12'hb83;
      expv[61] = 12'h792;
      expv[62] = 12'hef8;
      expv[63] = 12'hdc6;
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
