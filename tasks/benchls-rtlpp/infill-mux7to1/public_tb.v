// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mux7to1 dut (
    .MuxSelect(in_vec[10:8]),
    .Input(in_vec[7:0]),
    .Out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h095;
    stim[1] = 11'h04d;
    stim[2] = 11'h009;
    stim[3] = 11'h6b8;
    stim[4] = 11'h43f;
    stim[5] = 11'h0ca;
    stim[6] = 11'h181;
    stim[7] = 11'h1c8;
    stim[8] = 11'h0f9;
    stim[9] = 11'h6ce;
    stim[10] = 11'h6de;
    stim[11] = 11'h583;
    stim[12] = 11'h780;
    stim[13] = 11'h429;
    stim[14] = 11'h2ef;
    stim[15] = 11'h0f8;
    stim[16] = 11'h12c;
    stim[17] = 11'h12e;
    stim[18] = 11'h103;
    stim[19] = 11'h4cc;
    stim[20] = 11'h1b1;
    stim[21] = 11'h0fe;
    stim[22] = 11'h4f0;
    stim[23] = 11'h0bc;
    stim[24] = 11'h427;
    stim[25] = 11'h2bc;
    stim[26] = 11'h44d;
    stim[27] = 11'h318;
    stim[28] = 11'h5d2;
    stim[29] = 11'h66c;
    stim[30] = 11'h2df;
    stim[31] = 11'h2e0;
    stim[32] = 11'h082;
    stim[33] = 11'h74b;
    stim[34] = 11'h76a;
    stim[35] = 11'h173;
    stim[36] = 11'h251;
    stim[37] = 11'h713;
    stim[38] = 11'h136;
    stim[39] = 11'h467;
    stim[40] = 11'h7c0;
    stim[41] = 11'h4f2;
    stim[42] = 11'h392;
    stim[43] = 11'h591;
    stim[44] = 11'h57b;
    stim[45] = 11'h1f6;
    stim[46] = 11'h3cf;
    stim[47] = 11'h1d9;
    stim[48] = 11'h566;
    stim[49] = 11'h45b;
    stim[50] = 11'h4b9;
    stim[51] = 11'h5b3;
    stim[52] = 11'h50c;
    stim[53] = 11'h45c;
    stim[54] = 11'h3b2;
    stim[55] = 11'h7fc;
    stim[56] = 11'h138;
    stim[57] = 11'h275;
    stim[58] = 11'h427;
    stim[59] = 11'h70b;
    stim[60] = 11'h4af;
    stim[61] = 11'h00b;
    stim[62] = 11'h080;
    stim[63] = 11'h489;
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
      expv[0] = 8'h0e;
      expv[1] = 8'h11;
      expv[2] = 8'h09;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h16;
      expv[6] = 8'h09;
      expv[7] = 8'h14;
      expv[8] = 8'h14;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h83;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'hf1;
      expv[15] = 8'h17;
      expv[16] = 8'h0e;
      expv[17] = 8'h10;
      expv[18] = 8'h03;
      expv[19] = 8'h00;
      expv[20] = 8'h0c;
      expv[21] = 8'h1d;
      expv[22] = 8'h00;
      expv[23] = 8'h17;
      expv[24] = 8'h00;
      expv[25] = 8'hf7;
      expv[26] = 8'h00;
      expv[27] = 8'h01;
      expv[28] = 8'hd2;
      expv[29] = 8'h00;
      expv[30] = 8'hf2;
      expv[31] = 8'hee;
      expv[32] = 8'h0a;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h0a;
      expv[36] = 8'h54;
      expv[37] = 8'h00;
      expv[38] = 8'h09;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h00;
      expv[42] = 8'h01;
      expv[43] = 8'h91;
      expv[44] = 8'h7b;
      expv[45] = 8'h15;
      expv[46] = 8'h01;
      expv[47] = 8'h16;
      expv[48] = 8'h66;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'hb3;
      expv[52] = 8'h0c;
      expv[53] = 8'h00;
      expv[54] = 8'h01;
      expv[55] = 8'h00;
      expv[56] = 8'h0b;
      expv[57] = 8'h72;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h0b;
      expv[62] = 8'h08;
      expv[63] = 8'h00;
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
