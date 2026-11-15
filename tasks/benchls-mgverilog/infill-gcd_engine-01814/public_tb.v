// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01814 dut (
    .clk(clk),
    .a(in_vec[64:33]),
    .b(in_vec[32:1]),
    .reset(in_vec[0:0]),
    .gcd(out_vec[32:1]),
    .isDone(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h0c0ba5c1c90876397;
    stim[1] = 65'h05432d5887977fc53;
    stim[2] = 65'h0b2801ff24a1f9da2;
    stim[3] = 65'h0d184a5a929659f3a;
    stim[4] = 65'h094b45b4203eed71c;
    stim[5] = 65'h0aa77b51be7003182;
    stim[6] = 65'h0f880a9073d701a20;
    stim[7] = 65'h16b536f1bf6da05e4;
    stim[8] = 65'h0321a24f4401e134a;
    stim[9] = 65'h0db6c1a5d96a53c16;
    stim[10] = 65'h0f30f6a7a90fa3262;
    stim[11] = 65'h1b46b4bc7ba5144c4;
    stim[12] = 65'h10ba5caac9fbf2fc8;
    stim[13] = 65'h086b54ee28e47a2d8;
    stim[14] = 65'h14b6ba7371e490620;
    stim[15] = 65'h17e1937719ddd34ca;
    stim[16] = 65'h01ad70321a89e150e;
    stim[17] = 65'h0ddc12d139771f070;
    stim[18] = 65'h17bb993f71d7b0338;
    stim[19] = 65'h051f9a0e1fa88358c;
    stim[20] = 65'h1d6ede3ccfce31d6c;
    stim[21] = 65'h03e7d5cbb193ad638;
    stim[22] = 65'h18c00c78193d3daf6;
    stim[23] = 65'h1f8efe79bb089b0fa;
    stim[24] = 65'h12ec8145836a47e1a;
    stim[25] = 65'h04e2eabb855f2998e;
    stim[26] = 65'h091b651dd8819c27e;
    stim[27] = 65'h0cbb371347f0f08b4;
    stim[28] = 65'h1357ae89aa4df7db6;
    stim[29] = 65'h17951aa4d4d6fe4a2;
    stim[30] = 65'h029d3f9458206775e;
    stim[31] = 65'h163184924e72470dc;
    stim[32] = 65'h0fd55806c0dd9c05a;
    stim[33] = 65'h1c9045d43a4db4f10;
    stim[34] = 65'h07a133764c4d26482;
    stim[35] = 65'h0477fdd2c8cf8f016;
    stim[36] = 65'h02f20cbdfddc15c60;
    stim[37] = 65'h1664d1e4d34643d65;
    stim[38] = 65'h08558f6cbcfcb2b3a;
    stim[39] = 65'h1b1742648b78c845e;
    stim[40] = 65'h0181abc2384c81830;
    stim[41] = 65'h01f3333730e311aa0;
    stim[42] = 65'h01adece69669d2bf0;
    stim[43] = 65'h09878b3cb66ef1370;
    stim[44] = 65'h10853d702fa3a690c;
    stim[45] = 65'h0c9e398b3ce29c706;
    stim[46] = 65'h0fc8aa97b51fc9128;
    stim[47] = 65'h1032fef7bfd876c7c;
    stim[48] = 65'h1144c7c0ec6234cd8;
    stim[49] = 65'h0667bda7a423adb46;
    stim[50] = 65'h08b3e87efec8e612e;
    stim[51] = 65'h001c92c72c8851324;
    stim[52] = 65'h004f1e2610243ea52;
    stim[53] = 65'h1464d8bdc9766cd94;
    stim[54] = 65'h0a4755226ef1e1296;
    stim[55] = 65'h055dc1a3213efd5c2;
    stim[56] = 65'h06496dbfadbc835c2;
    stim[57] = 65'h093659c5be5761de8;
    stim[58] = 65'h0512a0588a445e07b;
    stim[59] = 65'h12ec58fa5a0905eb0;
    stim[60] = 65'h1267052c25cd0dfce;
    stim[61] = 65'h18ae54bed231eed86;
    stim[62] = 65'h0f3017e12e604b5ae;
    stim[63] = 65'h1e7f8fedba6e90e2e;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
