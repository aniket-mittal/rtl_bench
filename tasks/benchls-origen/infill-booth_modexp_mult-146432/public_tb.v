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

  origen_146432 dut (
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .s(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hab7b;
    stim[1] = 16'h2ad2;
    stim[2] = 16'hd1db;
    stim[3] = 16'hafd0;
    stim[4] = 16'h7fe1;
    stim[5] = 16'hb3a1;
    stim[6] = 16'h002e;
    stim[7] = 16'h3106;
    stim[8] = 16'h34b6;
    stim[9] = 16'hb0f3;
    stim[10] = 16'h3184;
    stim[11] = 16'h05d9;
    stim[12] = 16'h15ba;
    stim[13] = 16'h8a84;
    stim[14] = 16'hf843;
    stim[15] = 16'hd10d;
    stim[16] = 16'hf4c5;
    stim[17] = 16'h3a3b;
    stim[18] = 16'h7e76;
    stim[19] = 16'h42af;
    stim[20] = 16'h753c;
    stim[21] = 16'h7c75;
    stim[22] = 16'h691c;
    stim[23] = 16'hc644;
    stim[24] = 16'h975c;
    stim[25] = 16'h98e1;
    stim[26] = 16'h540f;
    stim[27] = 16'h864a;
    stim[28] = 16'h6aff;
    stim[29] = 16'h4b4c;
    stim[30] = 16'h1746;
    stim[31] = 16'hbdba;
    stim[32] = 16'h07db;
    stim[33] = 16'h7778;
    stim[34] = 16'hf680;
    stim[35] = 16'h59be;
    stim[36] = 16'h88c8;
    stim[37] = 16'h805b;
    stim[38] = 16'hcb8f;
    stim[39] = 16'h0de1;
    stim[40] = 16'h910c;
    stim[41] = 16'he9aa;
    stim[42] = 16'hec48;
    stim[43] = 16'h1b51;
    stim[44] = 16'h7917;
    stim[45] = 16'hebee;
    stim[46] = 16'h0aee;
    stim[47] = 16'h399d;
    stim[48] = 16'h3df3;
    stim[49] = 16'h8c57;
    stim[50] = 16'h8965;
    stim[51] = 16'h0ea3;
    stim[52] = 16'h888c;
    stim[53] = 16'hc3e7;
    stim[54] = 16'hac7b;
    stim[55] = 16'hcc5a;
    stim[56] = 16'h64a5;
    stim[57] = 16'hb1de;
    stim[58] = 16'h11f5;
    stim[59] = 16'he565;
    stim[60] = 16'hc0bc;
    stim[61] = 16'h8abe;
    stim[62] = 16'hfe22;
    stim[63] = 16'hb947;
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
      expv[0] = 16'h0119;
      expv[1] = 16'h0017;
      expv[2] = 16'h011d;
      expv[3] = 16'h0011;
      expv[4] = 16'h00d0;
      expv[5] = 16'h004f;
      expv[6] = 16'h0000;
      expv[7] = 16'h00db;
      expv[8] = 16'h006b;
      expv[9] = 16'h0004;
      expv[10] = 16'h0160;
      expv[11] = 16'h00e7;
      expv[12] = 16'h00a5;
      expv[13] = 16'h004e;
      expv[14] = 16'h0014;
      expv[15] = 16'h00a8;
      expv[16] = 16'h0027;
      expv[17] = 16'h0020;
      expv[18] = 16'h003b;
      expv[19] = 16'h0016;
      expv[20] = 16'h0140;
      expv[21] = 16'h0029;
      expv[22] = 16'h0150;
      expv[23] = 16'h002a;
      expv[24] = 16'h00e3;
      expv[25] = 16'h005f;
      expv[26] = 16'h0037;
      expv[27] = 16'h005f;
      expv[28] = 16'h0039;
      expv[29] = 16'h00d8;
      expv[30] = 16'h00cc;
      expv[31] = 16'h00fb;
      expv[32] = 16'h00a1;
      expv[33] = 16'h00e8;
      expv[34] = 16'h0005;
      expv[35] = 16'h00ad;
      expv[36] = 16'h000d;
      expv[37] = 16'h0036;
      expv[38] = 16'h004e;
      expv[39] = 16'h00b1;
      expv[40] = 16'h00e2;
      expv[41] = 16'h0054;
      expv[42] = 16'h004d;
      expv[43] = 16'h005e;
      expv[44] = 16'h0011;
      expv[45] = 16'h00d0;
      expv[46] = 16'h0003;
      expv[47] = 16'h0141;
      expv[48] = 16'h011c;
      expv[49] = 16'h0018;
      expv[50] = 16'h009f;
      expv[51] = 16'h008b;
      expv[52] = 16'h0019;
      expv[53] = 16'h004f;
      expv[54] = 16'h0035;
      expv[55] = 16'h003a;
      expv[56] = 16'h0087;
      expv[57] = 16'h00b5;
      expv[58] = 16'h00ec;
      expv[59] = 16'h0023;
      expv[60] = 16'h0051;
      expv[61] = 16'h0068;
      expv[62] = 16'h0048;
      expv[63] = 16'h0090;
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
