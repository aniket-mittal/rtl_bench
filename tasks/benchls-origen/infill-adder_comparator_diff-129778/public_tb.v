// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_129778 dut (
    .a(in_vec[8:5]),
    .b(in_vec[4:1]),
    .cin(in_vec[0:0]),
    .sum(out_vec[11:8]),
    .cout(out_vec[7:7]),
    .comp_result(out_vec[6:5]),
    .difference(out_vec[4:1]),
    .borrow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1df;
    stim[1] = 9'h191;
    stim[2] = 9'h1ce;
    stim[3] = 9'h0c5;
    stim[4] = 9'h18d;
    stim[5] = 9'h0d7;
    stim[6] = 9'h036;
    stim[7] = 9'h02b;
    stim[8] = 9'h15b;
    stim[9] = 9'h069;
    stim[10] = 9'h01f;
    stim[11] = 9'h0b0;
    stim[12] = 9'h071;
    stim[13] = 9'h198;
    stim[14] = 9'h0c6;
    stim[15] = 9'h1ab;
    stim[16] = 9'h094;
    stim[17] = 9'h09a;
    stim[18] = 9'h142;
    stim[19] = 9'h026;
    stim[20] = 9'h176;
    stim[21] = 9'h143;
    stim[22] = 9'h1bc;
    stim[23] = 9'h1dd;
    stim[24] = 9'h130;
    stim[25] = 9'h122;
    stim[26] = 9'h075;
    stim[27] = 9'h1a1;
    stim[28] = 9'h1bc;
    stim[29] = 9'h0bc;
    stim[30] = 9'h1a6;
    stim[31] = 9'h0c3;
    stim[32] = 9'h151;
    stim[33] = 9'h17b;
    stim[34] = 9'h01d;
    stim[35] = 9'h053;
    stim[36] = 9'h13e;
    stim[37] = 9'h0b6;
    stim[38] = 9'h027;
    stim[39] = 9'h1a9;
    stim[40] = 9'h068;
    stim[41] = 9'h1fc;
    stim[42] = 9'h172;
    stim[43] = 9'h18f;
    stim[44] = 9'h0b7;
    stim[45] = 9'h149;
    stim[46] = 9'h033;
    stim[47] = 9'h11a;
    stim[48] = 9'h185;
    stim[49] = 9'h1e6;
    stim[50] = 9'h122;
    stim[51] = 9'h1df;
    stim[52] = 9'h069;
    stim[53] = 9'h10c;
    stim[54] = 9'h19c;
    stim[55] = 9'h1ae;
    stim[56] = 9'h1eb;
    stim[57] = 9'h1ef;
    stim[58] = 9'h0aa;
    stim[59] = 9'h185;
    stim[60] = 9'h048;
    stim[61] = 9'h019;
    stim[62] = 9'h05c;
    stim[63] = 9'h043;
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
      expv[0] = 12'hea3;
      expv[1] = 12'h5c8;
      expv[2] = 12'h5ce;
      expv[3] = 12'h948;
      expv[4] = 12'h3cc;
      expv[5] = 12'h2ab;
      expv[6] = 12'hc35;
      expv[7] = 12'h729;
      expv[8] = 12'h8a7;
      expv[9] = 12'h823;
      expv[10] = 12'h0bf;
      expv[11] = 12'hd27;
      expv[12] = 12'hc2b;
      expv[13] = 12'h880;
      expv[14] = 12'h946;
      expv[15] = 12'h3d0;
      expv[16] = 12'he2d;
      expv[17] = 12'h1b3;
      expv[18] = 12'hb52;
      expv[19] = 12'h425;
      expv[20] = 12'h680;
      expv[21] = 12'hc52;
      expv[22] = 12'hba3;
      expv[23] = 12'hd80;
      expv[24] = 12'h1c2;
      expv[25] = 12'ha50;
      expv[26] = 12'he2f;
      expv[27] = 12'he5a;
      expv[28] = 12'hba3;
      expv[29] = 12'h3b3;
      expv[30] = 12'h0d4;
      expv[31] = 12'h84a;
      expv[32] = 12'h3c4;
      expv[33] = 12'h9a5;
      expv[34] = 12'hf3d;
      expv[35] = 12'hc2f;
      expv[36] = 12'h8ad;
      expv[37] = 12'h0ad;
      expv[38] = 12'h525;
      expv[39] = 12'h2d2;
      expv[40] = 12'h723;
      expv[41] = 12'hdc2;
      expv[42] = 12'h4c4;
      expv[43] = 12'h4ca;
      expv[44] = 12'h1ad;
      expv[45] = 12'hf4c;
      expv[46] = 12'hb31;
      expv[47] = 12'h5ab;
      expv[48] = 12'hf54;
      expv[49] = 12'h2d8;
      expv[50] = 12'ha50;
      expv[51] = 12'hea3;
      expv[52] = 12'h823;
      expv[53] = 12'he44;
      expv[54] = 12'haa5;
      expv[55] = 12'h4cc;
      expv[56] = 12'h5d4;
      expv[57] = 12'h7d0;
      expv[58] = 12'ha00;
      expv[59] = 12'hf54;
      expv[60] = 12'h625;
      expv[61] = 12'hd39;
      expv[62] = 12'h0b9;
      expv[63] = 12'h442;
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
