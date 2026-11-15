// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_140686 dut (
    .data(in_vec[7:4]),
    .shift_amount(in_vec[3:2]),
    .shift_left(in_vec[1:1]),
    .P(in_vec[0:0]),
    .result(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hdd;
    stim[1] = 8'h5e;
    stim[2] = 8'haa;
    stim[3] = 8'hde;
    stim[4] = 8'h63;
    stim[5] = 8'h70;
    stim[6] = 8'h87;
    stim[7] = 8'hcf;
    stim[8] = 8'hc2;
    stim[9] = 8'h4c;
    stim[10] = 8'h3e;
    stim[11] = 8'h19;
    stim[12] = 8'h87;
    stim[13] = 8'hb6;
    stim[14] = 8'hc2;
    stim[15] = 8'hb6;
    stim[16] = 8'h51;
    stim[17] = 8'h36;
    stim[18] = 8'hb8;
    stim[19] = 8'h76;
    stim[20] = 8'he2;
    stim[21] = 8'hf8;
    stim[22] = 8'h9d;
    stim[23] = 8'hb9;
    stim[24] = 8'haa;
    stim[25] = 8'h51;
    stim[26] = 8'h71;
    stim[27] = 8'hf4;
    stim[28] = 8'hca;
    stim[29] = 8'h51;
    stim[30] = 8'he1;
    stim[31] = 8'he8;
    stim[32] = 8'heb;
    stim[33] = 8'h75;
    stim[34] = 8'h97;
    stim[35] = 8'ha7;
    stim[36] = 8'hbf;
    stim[37] = 8'hd9;
    stim[38] = 8'hf5;
    stim[39] = 8'hbc;
    stim[40] = 8'h4d;
    stim[41] = 8'hf1;
    stim[42] = 8'he6;
    stim[43] = 8'hb1;
    stim[44] = 8'h99;
    stim[45] = 8'hfa;
    stim[46] = 8'h1b;
    stim[47] = 8'h3e;
    stim[48] = 8'h48;
    stim[49] = 8'h9f;
    stim[50] = 8'h98;
    stim[51] = 8'hb7;
    stim[52] = 8'hfa;
    stim[53] = 8'hed;
    stim[54] = 8'h68;
    stim[55] = 8'hd2;
    stim[56] = 8'hcc;
    stim[57] = 8'h45;
    stim[58] = 8'hba;
    stim[59] = 8'h5e;
    stim[60] = 8'h61;
    stim[61] = 8'hba;
    stim[62] = 8'hb9;
    stim[63] = 8'h26;
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
      expv[0] = 4'hd;
      expv[1] = 4'ha;
      expv[2] = 4'ha;
      expv[3] = 4'he;
      expv[4] = 4'h6;
      expv[5] = 4'h7;
      expv[6] = 4'h8;
      expv[7] = 4'hc;
      expv[8] = 4'hc;
      expv[9] = 4'h8;
      expv[10] = 4'h9;
      expv[11] = 4'h1;
      expv[12] = 4'h8;
      expv[13] = 4'h7;
      expv[14] = 4'hc;
      expv[15] = 4'h7;
      expv[16] = 4'h5;
      expv[17] = 4'h6;
      expv[18] = 4'he;
      expv[19] = 4'he;
      expv[20] = 4'he;
      expv[21] = 4'hf;
      expv[22] = 4'h9;
      expv[23] = 4'hb;
      expv[24] = 4'ha;
      expv[25] = 4'h5;
      expv[26] = 4'h7;
      expv[27] = 4'hf;
      expv[28] = 4'h3;
      expv[29] = 4'h5;
      expv[30] = 4'he;
      expv[31] = 4'hb;
      expv[32] = 4'he;
      expv[33] = 4'h7;
      expv[34] = 4'h9;
      expv[35] = 4'ha;
      expv[36] = 4'hb;
      expv[37] = 4'hd;
      expv[38] = 4'hf;
      expv[39] = 4'h7;
      expv[40] = 4'h4;
      expv[41] = 4'hf;
      expv[42] = 4'hd;
      expv[43] = 4'hb;
      expv[44] = 4'h9;
      expv[45] = 4'hf;
      expv[46] = 4'h1;
      expv[47] = 4'h9;
      expv[48] = 4'h1;
      expv[49] = 4'h9;
      expv[50] = 4'h6;
      expv[51] = 4'hb;
      expv[52] = 4'hf;
      expv[53] = 4'he;
      expv[54] = 4'h9;
      expv[55] = 4'hd;
      expv[56] = 4'h9;
      expv[57] = 4'h4;
      expv[58] = 4'he;
      expv[59] = 4'ha;
      expv[60] = 4'h6;
      expv[61] = 4'he;
      expv[62] = 4'hb;
      expv[63] = 4'h4;
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
