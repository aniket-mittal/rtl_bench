// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_051383 dut (
    .signMag(in_vec[11:0]),
    .exp(out_vec[7:5]),
    .sig(out_vec[4:1]),
    .roundBit(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h709;
    stim[1] = 12'h8b1;
    stim[2] = 12'h36a;
    stim[3] = 12'hbfe;
    stim[4] = 12'h36d;
    stim[5] = 12'h224;
    stim[6] = 12'h949;
    stim[7] = 12'h49f;
    stim[8] = 12'h514;
    stim[9] = 12'h171;
    stim[10] = 12'hc0a;
    stim[11] = 12'h521;
    stim[12] = 12'h78a;
    stim[13] = 12'h255;
    stim[14] = 12'h730;
    stim[15] = 12'h4a2;
    stim[16] = 12'hdef;
    stim[17] = 12'hbfc;
    stim[18] = 12'hafc;
    stim[19] = 12'h798;
    stim[20] = 12'h78a;
    stim[21] = 12'ha70;
    stim[22] = 12'h892;
    stim[23] = 12'h391;
    stim[24] = 12'h720;
    stim[25] = 12'h04f;
    stim[26] = 12'hc13;
    stim[27] = 12'ha16;
    stim[28] = 12'h881;
    stim[29] = 12'h536;
    stim[30] = 12'h9f8;
    stim[31] = 12'hb31;
    stim[32] = 12'h2db;
    stim[33] = 12'ha57;
    stim[34] = 12'hcff;
    stim[35] = 12'h4ff;
    stim[36] = 12'hf4b;
    stim[37] = 12'h0ad;
    stim[38] = 12'h832;
    stim[39] = 12'hbd5;
    stim[40] = 12'h691;
    stim[41] = 12'hea4;
    stim[42] = 12'h9a7;
    stim[43] = 12'hfdb;
    stim[44] = 12'h7ec;
    stim[45] = 12'h637;
    stim[46] = 12'ha53;
    stim[47] = 12'h092;
    stim[48] = 12'h991;
    stim[49] = 12'h24e;
    stim[50] = 12'hb33;
    stim[51] = 12'hd98;
    stim[52] = 12'h303;
    stim[53] = 12'h640;
    stim[54] = 12'h0c6;
    stim[55] = 12'hba0;
    stim[56] = 12'h159;
    stim[57] = 12'ha91;
    stim[58] = 12'h0d2;
    stim[59] = 12'h8dd;
    stim[60] = 12'h828;
    stim[61] = 12'h375;
    stim[62] = 12'hce2;
    stim[63] = 12'h21e;
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
      expv[0] = 8'hfc;
      expv[1] = 8'h96;
      expv[2] = 8'hdb;
      expv[3] = 8'hdf;
      expv[4] = 8'hdb;
      expv[5] = 8'hd1;
      expv[6] = 8'hb4;
      expv[7] = 8'hf2;
      expv[8] = 8'hf4;
      expv[9] = 8'hb7;
      expv[10] = 8'hf0;
      expv[11] = 8'hf4;
      expv[12] = 8'hfe;
      expv[13] = 8'hd2;
      expv[14] = 8'hfc;
      expv[15] = 8'hf2;
      expv[16] = 8'hf7;
      expv[17] = 8'hdf;
      expv[18] = 8'hd7;
      expv[19] = 8'hfe;
      expv[20] = 8'hfe;
      expv[21] = 8'hd3;
      expv[22] = 8'h92;
      expv[23] = 8'hdc;
      expv[24] = 8'hfc;
      expv[25] = 8'h73;
      expv[26] = 8'hf0;
      expv[27] = 8'hd0;
      expv[28] = 8'h90;
      expv[29] = 8'hf4;
      expv[30] = 8'hbf;
      expv[31] = 8'hd9;
      expv[32] = 8'hd6;
      expv[33] = 8'hd2;
      expv[34] = 8'hf3;
      expv[35] = 8'hf3;
      expv[36] = 8'hfd;
      expv[37] = 8'h95;
      expv[38] = 8'h59;
      expv[39] = 8'hde;
      expv[40] = 8'hfa;
      expv[41] = 8'hfa;
      expv[42] = 8'hba;
      expv[43] = 8'hff;
      expv[44] = 8'hff;
      expv[45] = 8'hf8;
      expv[46] = 8'hd2;
      expv[47] = 8'h92;
      expv[48] = 8'hb9;
      expv[49] = 8'hd2;
      expv[50] = 8'hd9;
      expv[51] = 8'hf6;
      expv[52] = 8'hd8;
      expv[53] = 8'hf9;
      expv[54] = 8'h98;
      expv[55] = 8'hdd;
      expv[56] = 8'hb5;
      expv[57] = 8'hd4;
      expv[58] = 8'h9a;
      expv[59] = 8'h9b;
      expv[60] = 8'h54;
      expv[61] = 8'hdb;
      expv[62] = 8'hf3;
      expv[63] = 8'hd0;
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
