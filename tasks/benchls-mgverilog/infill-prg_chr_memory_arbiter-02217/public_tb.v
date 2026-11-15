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

  mg_02217 dut (
    .clk(clk),
    .ce(in_vec[64:64]),
    .prg_addr(in_vec[63:42]),
    .prg_read(in_vec[41:41]),
    .prg_write(in_vec[40:40]),
    .prg_din(in_vec[39:32]),
    .chr_addr(in_vec[31:10]),
    .chr_read(in_vec[9:9]),
    .chr_write(in_vec[8:8]),
    .chr_din(in_vec[7:0]),
    .memory_addr(out_vec[32:11]),
    .memory_read_cpu(out_vec[10:10]),
    .memory_read_ppu(out_vec[9:9]),
    .memory_write(out_vec[8:8]),
    .memory_dout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h19a59ff485afac7c9;
    stim[1] = 65'h188a7e1d48f58fb8d;
    stim[2] = 65'h06f4908b65d38883a;
    stim[3] = 65'h1b847684a819eaa18;
    stim[4] = 65'h1f8276827c1443c18;
    stim[5] = 65'h0b648dc6640f1e641;
    stim[6] = 65'h1df5fb04dbfad26ea;
    stim[7] = 65'h1fafac23d277dc5db;
    stim[8] = 65'h0ade59069646a5563;
    stim[9] = 65'h0abf4419cdd1b2a77;
    stim[10] = 65'h1367c5a2e290e8b28;
    stim[11] = 65'h0ef1c860b29428677;
    stim[12] = 65'h145c3e920626b19ab;
    stim[13] = 65'h0497c341660e914a6;
    stim[14] = 65'h108ea305a60cea092;
    stim[15] = 65'h106a8996965020b4c;
    stim[16] = 65'h0e3b0059ffb38695a;
    stim[17] = 65'h0d8292134bfb0206e;
    stim[18] = 65'h0a00d014498d431e3;
    stim[19] = 65'h0e0cf9ecae5dea56d;
    stim[20] = 65'h06417851fdb4a48f0;
    stim[21] = 65'h0bbee724a5d85ff8f;
    stim[22] = 65'h0339a4417ca3a1e81;
    stim[23] = 65'h07b1d8a2e3935f053;
    stim[24] = 65'h13014cbf82c988078;
    stim[25] = 65'h04693b18cbe7f2bb2;
    stim[26] = 65'h006d1ec083b5b1ea8;
    stim[27] = 65'h1a37d5a2b1dee20af;
    stim[28] = 65'h0b2c0f10907f38d46;
    stim[29] = 65'h1fee2db8103c0da84;
    stim[30] = 65'h12ff78f52c270c211;
    stim[31] = 65'h14f263fc1776a9dc4;
    stim[32] = 65'h0f1492482fdf7d95b;
    stim[33] = 65'h15ce48429773958ba;
    stim[34] = 65'h0beac974ecce778e1;
    stim[35] = 65'h09da4062e6d674aca;
    stim[36] = 65'h17962bd4f1ca2e51c;
    stim[37] = 65'h0653e358eab6800ae;
    stim[38] = 65'h1331c6189d41bcd52;
    stim[39] = 65'h115ce28e57d02ed6f;
    stim[40] = 65'h147f1c9e63c9d98b9;
    stim[41] = 65'h0a7902be353b8871f;
    stim[42] = 65'h18d3943acd28ffc74;
    stim[43] = 65'h1aed0ee818603b529;
    stim[44] = 65'h02565fe0fd16a661d;
    stim[45] = 65'h1ce0d70745c1c4368;
    stim[46] = 65'h12f3088eb17998ffe;
    stim[47] = 65'h18270941294a8249c;
    stim[48] = 65'h038769cb94997e019;
    stim[49] = 65'h172471c141d2aa57f;
    stim[50] = 65'h1743b7fd78d17643e;
    stim[51] = 65'h173f3b89c72e6b0e3;
    stim[52] = 65'h1237041ca3d2108bf;
    stim[53] = 65'h1de2bb8f22ee0f1ad;
    stim[54] = 65'h1fa212f88897a7b4d;
    stim[55] = 65'h139f0e00ef66681e9;
    stim[56] = 65'h10746d2fb839501b3;
    stim[57] = 65'h0e03f129921433795;
    stim[58] = 65'h0ff303d0f96c85a39;
    stim[59] = 65'h11617f385358440af;
    stim[60] = 65'h1b83296135aa38dba;
    stim[61] = 65'h058f51afacc5a8f48;
    stim[62] = 65'h1862367bfaf5fb397;
    stim[63] = 65'h0bf3d8b75841d8a2e;
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
      expv[0] = 33'h0b5f58bc9;
      expv[1] = 33'h11eb1f38d;
      expv[2] = 33'h0de9215b6;
      expv[3] = 33'h1033d524a;
      expv[4] = 33'h1f04ed527;
      expv[5] = 33'h081e3ca66;
      expv[6] = 33'h17f5a4a4d;
      expv[7] = 33'h04efb89db;
      expv[8] = 33'h0c8d4a963;
      expv[9] = 33'h1ba36529c;
      expv[10] = 33'h0521d1328;
      expv[11] = 33'h052850a0b;
      expv[12] = 33'h0c4d631ab;
      expv[13] = 33'h092f86d16;
      expv[14] = 33'h011d4655a;
      expv[15] = 33'h0ca04134c;
      expv[16] = 33'h1f670d15a;
      expv[17] = 33'h1b0524134;
      expv[18] = 33'h131a861e3;
      expv[19] = 33'h1cbbd496d;
      expv[20] = 33'h0c82f091f;
      expv[21] = 33'h0bb0bfb8f;
      expv[22] = 33'h194743a17;
      expv[23] = 33'h0f63b152e;
      expv[24] = 33'h0602995f8;
      expv[25] = 33'h17cfe53b2;
      expv[26] = 33'h076b63a08;
      expv[27] = 33'h146fab52b;
      expv[28] = 33'h00fe71946;
      expv[29] = 33'h00781b281;
      expv[30] = 33'h184e18252;
      expv[31] = 33'h0eed539c4;
      expv[32] = 33'h1fbefb15b;
      expv[33] = 33'h0b9c90d29;
      expv[34] = 33'h17d592c4e;
      expv[35] = 33'h0dace922e;
      expv[36] = 33'h03945c91c;
      expv[37] = 33'h0ca7c698e;
      expv[38] = 33'h1a8379952;
      expv[39] = 33'h0fa05d96f;
      expv[40] = 33'h08fe391e6;
      expv[41] = 33'h0a7710b1f;
      expv[42] = 33'h11a7285ac;
      expv[43] = 33'h10c076929;
      expv[44] = 33'h1a2d4ca0f;
      expv[45] = 33'h0b8388368;
      expv[46] = 33'h02f331bfe;
      expv[47] = 33'h104e12d12;
      expv[48] = 33'h070ed38b9;
      expv[49] = 33'h03a55497f;
      expv[50] = 33'h0e876fcd7;
      expv[51] = 33'h0e7e7719c;
      expv[52] = 33'h046e080ca;
      expv[53] = 33'h05dc1e1ad;
      expv[54] = 33'h112f4f34d;
      expv[55] = 33'h1eccd01e9;
      expv[56] = 33'h1072a01b3;
      expv[57] = 33'h042866b95;
      expv[58] = 33'h12d90b20f;
      expv[59] = 33'h02c2fe585;
      expv[60] = 33'h0b54719ba;
      expv[61] = 33'h198b51b48;
      expv[62] = 33'h15ebf6397;
      expv[63] = 33'h1083b1275;
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
