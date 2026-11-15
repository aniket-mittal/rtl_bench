// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  oks8_sra dut (
    .a_i(in_vec[7:0]),
    .c_o(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h43;
    stim[1] = 8'hf2;
    stim[2] = 8'h60;
    stim[3] = 8'h07;
    stim[4] = 8'h50;
    stim[5] = 8'h7d;
    stim[6] = 8'hce;
    stim[7] = 8'h30;
    stim[8] = 8'h68;
    stim[9] = 8'h17;
    stim[10] = 8'h90;
    stim[11] = 8'h69;
    stim[12] = 8'h70;
    stim[13] = 8'hb2;
    stim[14] = 8'hf7;
    stim[15] = 8'hcc;
    stim[16] = 8'h1d;
    stim[17] = 8'hbc;
    stim[18] = 8'h8f;
    stim[19] = 8'h6c;
    stim[20] = 8'h55;
    stim[21] = 8'h9b;
    stim[22] = 8'h7f;
    stim[23] = 8'h89;
    stim[24] = 8'h00;
    stim[25] = 8'h4d;
    stim[26] = 8'hba;
    stim[27] = 8'hb7;
    stim[28] = 8'h10;
    stim[29] = 8'h4d;
    stim[30] = 8'h9d;
    stim[31] = 8'hab;
    stim[32] = 8'h18;
    stim[33] = 8'h08;
    stim[34] = 8'hb5;
    stim[35] = 8'h46;
    stim[36] = 8'hef;
    stim[37] = 8'h9f;
    stim[38] = 8'h3c;
    stim[39] = 8'h2d;
    stim[40] = 8'h95;
    stim[41] = 8'hf5;
    stim[42] = 8'h37;
    stim[43] = 8'hf6;
    stim[44] = 8'h74;
    stim[45] = 8'hb4;
    stim[46] = 8'h52;
    stim[47] = 8'h92;
    stim[48] = 8'h37;
    stim[49] = 8'h3d;
    stim[50] = 8'h81;
    stim[51] = 8'h03;
    stim[52] = 8'h6f;
    stim[53] = 8'h49;
    stim[54] = 8'h89;
    stim[55] = 8'h01;
    stim[56] = 8'h20;
    stim[57] = 8'h0d;
    stim[58] = 8'hcb;
    stim[59] = 8'h2f;
    stim[60] = 8'h8f;
    stim[61] = 8'h0e;
    stim[62] = 8'hd2;
    stim[63] = 8'he2;
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
      expv[0] = 9'h121;
      expv[1] = 9'h0f9;
      expv[2] = 9'h030;
      expv[3] = 9'h103;
      expv[4] = 9'h028;
      expv[5] = 9'h13e;
      expv[6] = 9'h0e7;
      expv[7] = 9'h018;
      expv[8] = 9'h034;
      expv[9] = 9'h10b;
      expv[10] = 9'h0c8;
      expv[11] = 9'h134;
      expv[12] = 9'h038;
      expv[13] = 9'h0d9;
      expv[14] = 9'h1fb;
      expv[15] = 9'h0e6;
      expv[16] = 9'h10e;
      expv[17] = 9'h0de;
      expv[18] = 9'h1c7;
      expv[19] = 9'h036;
      expv[20] = 9'h12a;
      expv[21] = 9'h1cd;
      expv[22] = 9'h13f;
      expv[23] = 9'h1c4;
      expv[24] = 9'h000;
      expv[25] = 9'h126;
      expv[26] = 9'h0dd;
      expv[27] = 9'h1db;
      expv[28] = 9'h008;
      expv[29] = 9'h126;
      expv[30] = 9'h1ce;
      expv[31] = 9'h1d5;
      expv[32] = 9'h00c;
      expv[33] = 9'h004;
      expv[34] = 9'h1da;
      expv[35] = 9'h023;
      expv[36] = 9'h1f7;
      expv[37] = 9'h1cf;
      expv[38] = 9'h01e;
      expv[39] = 9'h116;
      expv[40] = 9'h1ca;
      expv[41] = 9'h1fa;
      expv[42] = 9'h11b;
      expv[43] = 9'h0fb;
      expv[44] = 9'h03a;
      expv[45] = 9'h0da;
      expv[46] = 9'h029;
      expv[47] = 9'h0c9;
      expv[48] = 9'h11b;
      expv[49] = 9'h11e;
      expv[50] = 9'h1c0;
      expv[51] = 9'h101;
      expv[52] = 9'h137;
      expv[53] = 9'h124;
      expv[54] = 9'h1c4;
      expv[55] = 9'h100;
      expv[56] = 9'h010;
      expv[57] = 9'h106;
      expv[58] = 9'h1e5;
      expv[59] = 9'h117;
      expv[60] = 9'h1c7;
      expv[61] = 9'h007;
      expv[62] = 9'h0e9;
      expv[63] = 9'h0f1;
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
