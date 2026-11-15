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

  origen_068142 dut (
    .a(in_vec[10:7]),
    .b(in_vec[6:3]),
    .code(in_vec[2:0]),
    .aluout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h798;
    stim[1] = 11'h5b2;
    stim[2] = 11'h669;
    stim[3] = 11'h759;
    stim[4] = 11'h4e3;
    stim[5] = 11'h0e6;
    stim[6] = 11'h196;
    stim[7] = 11'h60b;
    stim[8] = 11'h532;
    stim[9] = 11'h4f2;
    stim[10] = 11'h21f;
    stim[11] = 11'h5d9;
    stim[12] = 11'h1d3;
    stim[13] = 11'h2b6;
    stim[14] = 11'h027;
    stim[15] = 11'h72b;
    stim[16] = 11'h7d5;
    stim[17] = 11'h498;
    stim[18] = 11'h22a;
    stim[19] = 11'h0a9;
    stim[20] = 11'h192;
    stim[21] = 11'h682;
    stim[22] = 11'h6e6;
    stim[23] = 11'h233;
    stim[24] = 11'h169;
    stim[25] = 11'h5fa;
    stim[26] = 11'h422;
    stim[27] = 11'h408;
    stim[28] = 11'h6b7;
    stim[29] = 11'h17e;
    stim[30] = 11'h7a8;
    stim[31] = 11'h0d2;
    stim[32] = 11'h67c;
    stim[33] = 11'h62f;
    stim[34] = 11'h198;
    stim[35] = 11'h0e2;
    stim[36] = 11'h456;
    stim[37] = 11'h763;
    stim[38] = 11'h5bb;
    stim[39] = 11'h25a;
    stim[40] = 11'h261;
    stim[41] = 11'h05c;
    stim[42] = 11'h087;
    stim[43] = 11'h434;
    stim[44] = 11'h160;
    stim[45] = 11'h194;
    stim[46] = 11'h6ac;
    stim[47] = 11'h073;
    stim[48] = 11'h795;
    stim[49] = 11'h3b9;
    stim[50] = 11'h093;
    stim[51] = 11'h4d6;
    stim[52] = 11'h3c4;
    stim[53] = 11'h1d6;
    stim[54] = 11'h516;
    stim[55] = 11'h223;
    stim[56] = 11'h036;
    stim[57] = 11'h355;
    stim[58] = 11'h6aa;
    stim[59] = 11'h3f2;
    stim[60] = 11'h16c;
    stim[61] = 11'h785;
    stim[62] = 11'h439;
    stim[63] = 11'h3d2;
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
      expv[0] = 8'h12;
      expv[1] = 8'hf4;
      expv[2] = 8'hff;
      expv[3] = 8'h03;
      expv[4] = 8'h6c;
      expv[5] = 8'hff;
      expv[6] = 8'hfd;
      expv[7] = 8'h0c;
      expv[8] = 8'hf5;
      expv[9] = 8'hf6;
      expv[10] = 8'hf8;
      expv[11] = 8'h00;
      expv[12] = 8'h1e;
      expv[13] = 8'hfb;
      expv[14] = 8'hfb;
      expv[15] = 8'h46;
      expv[16] = 8'h0f;
      expv[17] = 8'h0c;
      expv[18] = 8'hfb;
      expv[19] = 8'hfc;
      expv[20] = 8'hfc;
      expv[21] = 8'hf2;
      expv[22] = 8'hf3;
      expv[23] = 8'h18;
      expv[24] = 8'hf5;
      expv[25] = 8'hf4;
      expv[26] = 8'hf7;
      expv[27] = 8'h09;
      expv[28] = 8'hf0;
      expv[29] = 8'hfd;
      expv[30] = 8'h14;
      expv[31] = 8'hfe;
      expv[32] = 8'h0c;
      expv[33] = 8'hf2;
      expv[34] = 8'h06;
      expv[35] = 8'hfe;
      expv[36] = 8'hf7;
      expv[37] = 8'ha8;
      expv[38] = 8'h4d;
      expv[39] = 8'hfb;
      expv[40] = 8'hf8;
      expv[41] = 8'h00;
      expv[42] = 8'hfe;
      expv[43] = 8'h00;
      expv[44] = 8'h0e;
      expv[45] = 8'h02;
      expv[46] = 8'h05;
      expv[47] = 8'h00;
      expv[48] = 8'h0f;
      expv[49] = 8'h00;
      expv[50] = 8'h02;
      expv[51] = 8'hf7;
      expv[52] = 8'h00;
      expv[53] = 8'hfd;
      expv[54] = 8'hfd;
      expv[55] = 8'h10;
      expv[56] = 8'hff;
      expv[57] = 8'h0e;
      expv[58] = 8'hf2;
      expv[59] = 8'hf8;
      expv[60] = 8'h00;
      expv[61] = 8'h0f;
      expv[62] = 8'h01;
      expv[63] = 8'hf8;
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
