// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02809 dut (
    .clk(clk),
    .adc_d(in_vec[15:8]),
    .threshold(in_vec[7:0]),
    .min(out_vec[15:8]),
    .max(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h8eae;
    stim[1] = 16'hb14a;
    stim[2] = 16'h918c;
    stim[3] = 16'hced9;
    stim[4] = 16'h06a5;
    stim[5] = 16'hb8ec;
    stim[6] = 16'h3494;
    stim[7] = 16'h851e;
    stim[8] = 16'h318a;
    stim[9] = 16'h584e;
    stim[10] = 16'h7861;
    stim[11] = 16'hcc09;
    stim[12] = 16'h81ad;
    stim[13] = 16'he3ad;
    stim[14] = 16'hbceb;
    stim[15] = 16'hbb9f;
    stim[16] = 16'ha691;
    stim[17] = 16'h5444;
    stim[18] = 16'h849c;
    stim[19] = 16'h3e82;
    stim[20] = 16'h3458;
    stim[21] = 16'h09b6;
    stim[22] = 16'hef30;
    stim[23] = 16'h2adf;
    stim[24] = 16'h8a5b;
    stim[25] = 16'h01cb;
    stim[26] = 16'h099b;
    stim[27] = 16'he783;
    stim[28] = 16'h743e;
    stim[29] = 16'h0e6e;
    stim[30] = 16'h046a;
    stim[31] = 16'h67ff;
    stim[32] = 16'hf854;
    stim[33] = 16'h3e8e;
    stim[34] = 16'h0c68;
    stim[35] = 16'h27fd;
    stim[36] = 16'h7145;
    stim[37] = 16'h86e4;
    stim[38] = 16'h82b0;
    stim[39] = 16'hd8dc;
    stim[40] = 16'h461c;
    stim[41] = 16'hb694;
    stim[42] = 16'h106c;
    stim[43] = 16'h8561;
    stim[44] = 16'h1b96;
    stim[45] = 16'h3327;
    stim[46] = 16'h00aa;
    stim[47] = 16'h86ea;
    stim[48] = 16'h35f6;
    stim[49] = 16'h67e8;
    stim[50] = 16'h7841;
    stim[51] = 16'h1ac9;
    stim[52] = 16'h1172;
    stim[53] = 16'h8f7d;
    stim[54] = 16'h28c0;
    stim[55] = 16'hf1d2;
    stim[56] = 16'hd89a;
    stim[57] = 16'h3e11;
    stim[58] = 16'hfbf0;
    stim[59] = 16'hb75c;
    stim[60] = 16'h1bcf;
    stim[61] = 16'h1997;
    stim[62] = 16'h37fb;
    stim[63] = 16'hf496;
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
      expv[0] = 16'hff00;
      expv[1] = 16'hff00;
      expv[2] = 16'hff00;
      expv[3] = 16'hff00;
      expv[4] = 16'hff00;
      expv[5] = 16'hff00;
      expv[6] = 16'hff00;
      expv[7] = 16'hff00;
      expv[8] = 16'h0600;
      expv[9] = 16'h0600;
      expv[10] = 16'h0600;
      expv[11] = 16'h0600;
      expv[12] = 16'h0600;
      expv[13] = 16'h0600;
      expv[14] = 16'h0600;
      expv[15] = 16'h0600;
      expv[16] = 16'h0600;
      expv[17] = 16'h0600;
      expv[18] = 16'h06e3;
      expv[19] = 16'h06e3;
      expv[20] = 16'h06e3;
      expv[21] = 16'h06e3;
      expv[22] = 16'h06e3;
      expv[23] = 16'h09e3;
      expv[24] = 16'h09e3;
      expv[25] = 16'h09ef;
      expv[26] = 16'h09ef;
      expv[27] = 16'h09ef;
      expv[28] = 16'h01ef;
      expv[29] = 16'h01e7;
      expv[30] = 16'h01e7;
      expv[31] = 16'h01e7;
      expv[32] = 16'h01e7;
      expv[33] = 16'h04e7;
      expv[34] = 16'h04f8;
      expv[35] = 16'h04f8;
      expv[36] = 16'h04f8;
      expv[37] = 16'h0cf8;
      expv[38] = 16'h0cf8;
      expv[39] = 16'h0cf8;
      expv[40] = 16'h0cf8;
      expv[41] = 16'h0cd8;
      expv[42] = 16'h0cd8;
      expv[43] = 16'h0cd8;
      expv[44] = 16'h10d8;
      expv[45] = 16'h10d8;
      expv[46] = 16'h1085;
      expv[47] = 16'h1085;
      expv[48] = 16'h1085;
      expv[49] = 16'h1085;
      expv[50] = 16'h1085;
      expv[51] = 16'h0085;
      expv[52] = 16'h0085;
      expv[53] = 16'h0085;
      expv[54] = 16'h0085;
      expv[55] = 16'h0085;
      expv[56] = 16'h0085;
      expv[57] = 16'h0085;
      expv[58] = 16'h00f1;
      expv[59] = 16'h00f1;
      expv[60] = 16'h3ef1;
      expv[61] = 16'h3ef1;
      expv[62] = 16'h3eb7;
      expv[63] = 16'h3eb7;
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
