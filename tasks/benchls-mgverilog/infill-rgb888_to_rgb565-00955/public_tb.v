// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00955 dut (
    .rgb24(in_vec[23:0]),
    .vga(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hd46041;
    stim[1] = 24'h91cced;
    stim[2] = 24'h52118d;
    stim[3] = 24'h85fe55;
    stim[4] = 24'heeb9e4;
    stim[5] = 24'h6b43ac;
    stim[6] = 24'h9cd9af;
    stim[7] = 24'hf130ab;
    stim[8] = 24'h697c9a;
    stim[9] = 24'ha95784;
    stim[10] = 24'he22610;
    stim[11] = 24'hf94e32;
    stim[12] = 24'h4354d1;
    stim[13] = 24'h61a606;
    stim[14] = 24'hd9c6a4;
    stim[15] = 24'he30d66;
    stim[16] = 24'h4353fc;
    stim[17] = 24'h58f11d;
    stim[18] = 24'h2fec47;
    stim[19] = 24'heb20a1;
    stim[20] = 24'h1a4420;
    stim[21] = 24'hc9c9b4;
    stim[22] = 24'hb16e1f;
    stim[23] = 24'hb62476;
    stim[24] = 24'h4cd911;
    stim[25] = 24'hceeddd;
    stim[26] = 24'h8298c8;
    stim[27] = 24'h57cb24;
    stim[28] = 24'h9ff66f;
    stim[29] = 24'h77b653;
    stim[30] = 24'h6a658e;
    stim[31] = 24'h5596cd;
    stim[32] = 24'h80cad5;
    stim[33] = 24'hf714d1;
    stim[34] = 24'hf17303;
    stim[35] = 24'h918ccb;
    stim[36] = 24'h59d4b8;
    stim[37] = 24'hd59e65;
    stim[38] = 24'h5f4ca3;
    stim[39] = 24'h121196;
    stim[40] = 24'h5ed0fb;
    stim[41] = 24'hdb4e46;
    stim[42] = 24'h59011a;
    stim[43] = 24'h881a1e;
    stim[44] = 24'ha11b29;
    stim[45] = 24'h02c39c;
    stim[46] = 24'hba4a76;
    stim[47] = 24'h57f5c1;
    stim[48] = 24'h3e4b25;
    stim[49] = 24'hd511e4;
    stim[50] = 24'h60dae1;
    stim[51] = 24'hcf6b9b;
    stim[52] = 24'h6b82bb;
    stim[53] = 24'hce53ea;
    stim[54] = 24'h67a75c;
    stim[55] = 24'h023ecb;
    stim[56] = 24'h78e698;
    stim[57] = 24'hff112f;
    stim[58] = 24'h17e0b0;
    stim[59] = 24'h7b9316;
    stim[60] = 24'h9fe003;
    stim[61] = 24'hb6b366;
    stim[62] = 24'hd9871e;
    stim[63] = 24'h343df1;
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
      expv[0] = 16'hd308;
      expv[1] = 16'h967d;
      expv[2] = 16'h5091;
      expv[3] = 16'h87ea;
      expv[4] = 16'heddc;
      expv[5] = 16'h6a15;
      expv[6] = 16'h9ed5;
      expv[7] = 16'hf195;
      expv[8] = 16'h6bf3;
      expv[9] = 16'haab0;
      expv[10] = 16'he122;
      expv[11] = 16'hfa66;
      expv[12] = 16'h42ba;
      expv[13] = 16'h6520;
      expv[14] = 16'hde34;
      expv[15] = 16'he06c;
      expv[16] = 16'h429f;
      expv[17] = 16'h5f83;
      expv[18] = 16'h2f68;
      expv[19] = 16'he914;
      expv[20] = 16'h1a24;
      expv[21] = 16'hce56;
      expv[22] = 16'hb363;
      expv[23] = 16'hb12e;
      expv[24] = 16'h4ec2;
      expv[25] = 16'hcf7b;
      expv[26] = 16'h84d9;
      expv[27] = 16'h5644;
      expv[28] = 16'h9fad;
      expv[29] = 16'h75aa;
      expv[30] = 16'h6b31;
      expv[31] = 16'h54b9;
      expv[32] = 16'h865a;
      expv[33] = 16'hf0ba;
      expv[34] = 16'hf380;
      expv[35] = 16'h9479;
      expv[36] = 16'h5eb7;
      expv[37] = 16'hd4ec;
      expv[38] = 16'h5a74;
      expv[39] = 16'h1092;
      expv[40] = 16'h5e9f;
      expv[41] = 16'hda68;
      expv[42] = 16'h5803;
      expv[43] = 16'h88c3;
      expv[44] = 16'ha0c5;
      expv[45] = 16'h0613;
      expv[46] = 16'hba4e;
      expv[47] = 16'h57b8;
      expv[48] = 16'h3a44;
      expv[49] = 16'hd09c;
      expv[50] = 16'h66dc;
      expv[51] = 16'hcb53;
      expv[52] = 16'h6c17;
      expv[53] = 16'hca9d;
      expv[54] = 16'h652b;
      expv[55] = 16'h01f9;
      expv[56] = 16'h7f33;
      expv[57] = 16'hf885;
      expv[58] = 16'h1716;
      expv[59] = 16'h7c82;
      expv[60] = 16'h9f00;
      expv[61] = 16'hb58c;
      expv[62] = 16'hdc23;
      expv[63] = 16'h31fe;
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
