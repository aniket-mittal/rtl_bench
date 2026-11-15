// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_000936 dut (
    .A(in_vec[11:8]),
    .B(in_vec[7:4]),
    .opcode(in_vec[3:0]),
    .out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hf13;
    stim[1] = 12'h914;
    stim[2] = 12'h675;
    stim[3] = 12'h24b;
    stim[4] = 12'hadf;
    stim[5] = 12'h7bf;
    stim[6] = 12'he12;
    stim[7] = 12'h876;
    stim[8] = 12'hfd4;
    stim[9] = 12'hd72;
    stim[10] = 12'h7d9;
    stim[11] = 12'h129;
    stim[12] = 12'hf50;
    stim[13] = 12'h189;
    stim[14] = 12'h5b1;
    stim[15] = 12'hc64;
    stim[16] = 12'h392;
    stim[17] = 12'hbd2;
    stim[18] = 12'h502;
    stim[19] = 12'h8f9;
    stim[20] = 12'h0f1;
    stim[21] = 12'hba6;
    stim[22] = 12'h756;
    stim[23] = 12'hf48;
    stim[24] = 12'h18a;
    stim[25] = 12'hfc5;
    stim[26] = 12'h2d8;
    stim[27] = 12'h64e;
    stim[28] = 12'h82c;
    stim[29] = 12'ha4e;
    stim[30] = 12'h310;
    stim[31] = 12'hf3f;
    stim[32] = 12'hf22;
    stim[33] = 12'h270;
    stim[34] = 12'h445;
    stim[35] = 12'h81a;
    stim[36] = 12'hf8e;
    stim[37] = 12'hc6f;
    stim[38] = 12'h234;
    stim[39] = 12'hb67;
    stim[40] = 12'hda7;
    stim[41] = 12'hac9;
    stim[42] = 12'hd42;
    stim[43] = 12'h3e3;
    stim[44] = 12'h8b7;
    stim[45] = 12'h816;
    stim[46] = 12'h3e7;
    stim[47] = 12'h8d6;
    stim[48] = 12'h64f;
    stim[49] = 12'hd3d;
    stim[50] = 12'hc23;
    stim[51] = 12'h116;
    stim[52] = 12'h552;
    stim[53] = 12'hdeb;
    stim[54] = 12'had5;
    stim[55] = 12'h068;
    stim[56] = 12'hb39;
    stim[57] = 12'hf39;
    stim[58] = 12'he94;
    stim[59] = 12'hc60;
    stim[60] = 12'hc08;
    stim[61] = 12'hcb6;
    stim[62] = 12'h4ac;
    stim[63] = 12'h534;
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
      expv[0] = 4'hf;
      expv[1] = 4'h0;
      expv[2] = 4'h6;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'he;
      expv[7] = 4'hf;
      expv[8] = 4'h2;
      expv[9] = 4'hb;
      expv[10] = 4'h0;
      expv[11] = 4'hc;
      expv[12] = 4'h4;
      expv[13] = 4'h6;
      expv[14] = 4'ha;
      expv[15] = 4'h0;
      expv[16] = 4'hb;
      expv[17] = 4'hf;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h1;
      expv[21] = 4'hb;
      expv[22] = 4'h7;
      expv[23] = 4'h4;
      expv[24] = 4'hf;
      expv[25] = 4'hc;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h2;
      expv[29] = 4'h0;
      expv[30] = 4'h4;
      expv[31] = 4'h0;
      expv[32] = 4'he;
      expv[33] = 4'h9;
      expv[34] = 4'h4;
      expv[35] = 4'hf;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h2;
      expv[39] = 4'hd;
      expv[40] = 4'h7;
      expv[41] = 4'h1;
      expv[42] = 4'h4;
      expv[43] = 4'h0;
      expv[44] = 4'h3;
      expv[45] = 4'h9;
      expv[46] = 4'hd;
      expv[47] = 4'hd;
      expv[48] = 4'h0;
      expv[49] = 4'h8;
      expv[50] = 4'h6;
      expv[51] = 4'h1;
      expv[52] = 4'h9;
      expv[53] = 4'h0;
      expv[54] = 4'h8;
      expv[55] = 4'h9;
      expv[56] = 4'h4;
      expv[57] = 4'h0;
      expv[58] = 4'h5;
      expv[59] = 4'h2;
      expv[60] = 4'h3;
      expv[61] = 4'hf;
      expv[62] = 4'h0;
      expv[63] = 4'h2;
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
