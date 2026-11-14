// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .sel(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h196c1;
    stim[1] = 17'h00434;
    stim[2] = 17'h1b9af;
    stim[3] = 17'h10c89;
    stim[4] = 17'h17bef;
    stim[5] = 17'h01722;
    stim[6] = 17'h1055d;
    stim[7] = 17'h180db;
    stim[8] = 17'h06061;
    stim[9] = 17'h0a9cb;
    stim[10] = 17'h132bf;
    stim[11] = 17'h1b0a8;
    stim[12] = 17'h06511;
    stim[13] = 17'h10a4d;
    stim[14] = 17'h098c5;
    stim[15] = 17'h1bdad;
    stim[16] = 17'h176c7;
    stim[17] = 17'h0ed7d;
    stim[18] = 17'h1ab99;
    stim[19] = 17'h0f685;
    stim[20] = 17'h1659e;
    stim[21] = 17'h1ee0c;
    stim[22] = 17'h03293;
    stim[23] = 17'h1ebca;
    stim[24] = 17'h08b2f;
    stim[25] = 17'h0f3d0;
    stim[26] = 17'h0ba22;
    stim[27] = 17'h05614;
    stim[28] = 17'h0c556;
    stim[29] = 17'h04dc8;
    stim[30] = 17'h111a0;
    stim[31] = 17'h0dfe8;
    stim[32] = 17'h0410c;
    stim[33] = 17'h045f3;
    stim[34] = 17'h11c24;
    stim[35] = 17'h09db9;
    stim[36] = 17'h04360;
    stim[37] = 17'h08ed2;
    stim[38] = 17'h0c7f2;
    stim[39] = 17'h1b691;
    stim[40] = 17'h14495;
    stim[41] = 17'h11a35;
    stim[42] = 17'h185eb;
    stim[43] = 17'h14617;
    stim[44] = 17'h02b1c;
    stim[45] = 17'h0d7e6;
    stim[46] = 17'h09cac;
    stim[47] = 17'h15a44;
    stim[48] = 17'h1ac47;
    stim[49] = 17'h10ccd;
    stim[50] = 17'h16b77;
    stim[51] = 17'h04f9c;
    stim[52] = 17'h0f692;
    stim[53] = 17'h19145;
    stim[54] = 17'h0b50f;
    stim[55] = 17'h18d42;
    stim[56] = 17'h119ac;
    stim[57] = 17'h079f6;
    stim[58] = 17'h0c0e4;
    stim[59] = 17'h10d55;
    stim[60] = 17'h059d4;
    stim[61] = 17'h1b859;
    stim[62] = 17'h1aa84;
    stim[63] = 17'h125e5;
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
      expv[0] = 8'h96;
      expv[1] = 8'h00;
      expv[2] = 8'hb9;
      expv[3] = 8'h0c;
      expv[4] = 8'h7b;
      expv[5] = 8'h00;
      expv[6] = 8'h05;
      expv[7] = 8'h80;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h32;
      expv[11] = 8'hb0;
      expv[12] = 8'h00;
      expv[13] = 8'h0a;
      expv[14] = 8'h00;
      expv[15] = 8'hbd;
      expv[16] = 8'h76;
      expv[17] = 8'h00;
      expv[18] = 8'hab;
      expv[19] = 8'h00;
      expv[20] = 8'h65;
      expv[21] = 8'hee;
      expv[22] = 8'h00;
      expv[23] = 8'heb;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h11;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h1c;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h00;
      expv[39] = 8'hb6;
      expv[40] = 8'h44;
      expv[41] = 8'h1a;
      expv[42] = 8'h85;
      expv[43] = 8'h46;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h5a;
      expv[48] = 8'hac;
      expv[49] = 8'h0c;
      expv[50] = 8'h6b;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h91;
      expv[54] = 8'h00;
      expv[55] = 8'h8d;
      expv[56] = 8'h19;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'h0d;
      expv[60] = 8'h00;
      expv[61] = 8'hb8;
      expv[62] = 8'haa;
      expv[63] = 8'h25;
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
