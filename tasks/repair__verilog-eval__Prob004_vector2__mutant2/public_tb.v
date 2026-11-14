// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'haa2381c7;
    stim[1] = 32'h2d2ed344;
    stim[2] = 32'hb882c2b1;
    stim[3] = 32'h0ff997c3;
    stim[4] = 32'h1a4cc1f0;
    stim[5] = 32'h0e8a0b24;
    stim[6] = 32'h255c78cf;
    stim[7] = 32'h16b8d914;
    stim[8] = 32'haca4bd87;
    stim[9] = 32'h20b5dac5;
    stim[10] = 32'h98fbddcb;
    stim[11] = 32'h9a1cdd2e;
    stim[12] = 32'hd9720a5a;
    stim[13] = 32'h7cf04d44;
    stim[14] = 32'h149dd895;
    stim[15] = 32'h8942182a;
    stim[16] = 32'h75b09605;
    stim[17] = 32'h32ae4bb2;
    stim[18] = 32'hb09a5aa8;
    stim[19] = 32'h6ef0ccb0;
    stim[20] = 32'he8830d9d;
    stim[21] = 32'hee3aaf0c;
    stim[22] = 32'h51383e30;
    stim[23] = 32'h199dc59d;
    stim[24] = 32'h5fa156f6;
    stim[25] = 32'h747e413e;
    stim[26] = 32'hc9332cf3;
    stim[27] = 32'he681458a;
    stim[28] = 32'hcb300454;
    stim[29] = 32'h837860c1;
    stim[30] = 32'habef73f7;
    stim[31] = 32'h20bb5bc6;
    stim[32] = 32'h2365eb01;
    stim[33] = 32'h76318646;
    stim[34] = 32'ha94fd0fb;
    stim[35] = 32'hfdb2b3c9;
    stim[36] = 32'hf3d8e218;
    stim[37] = 32'h9ad67ca4;
    stim[38] = 32'h54794ec3;
    stim[39] = 32'ha227599e;
    stim[40] = 32'h9f0330ac;
    stim[41] = 32'h581f8265;
    stim[42] = 32'h69d6f14a;
    stim[43] = 32'hbaba0a50;
    stim[44] = 32'h111fb675;
    stim[45] = 32'h5931c81b;
    stim[46] = 32'h3fdb77e0;
    stim[47] = 32'hfcc2b70f;
    stim[48] = 32'hca554cc0;
    stim[49] = 32'hc76b2a30;
    stim[50] = 32'hcb1a4eef;
    stim[51] = 32'h541665f1;
    stim[52] = 32'h831f9c2d;
    stim[53] = 32'hf4c20a3a;
    stim[54] = 32'haa74b3d7;
    stim[55] = 32'h885c152e;
    stim[56] = 32'h46b09bf2;
    stim[57] = 32'h3263c987;
    stim[58] = 32'h48178e2b;
    stim[59] = 32'h8c4eafd1;
    stim[60] = 32'hba3b2d92;
    stim[61] = 32'he8678358;
    stim[62] = 32'h5a7be264;
    stim[63] = 32'h7c7172dd;
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
      expv[0] = 32'haa2381c7;
      expv[1] = 32'h2d2ed344;
      expv[2] = 32'hb882c2b1;
      expv[3] = 32'h0ff997c3;
      expv[4] = 32'h1a4cc1f0;
      expv[5] = 32'h0e8a0b24;
      expv[6] = 32'h255c78cf;
      expv[7] = 32'h16b8d914;
      expv[8] = 32'haca4bd87;
      expv[9] = 32'h20b5dac5;
      expv[10] = 32'h98fbddcb;
      expv[11] = 32'h9a1cdd2e;
      expv[12] = 32'hd9720a5a;
      expv[13] = 32'h7cf04d44;
      expv[14] = 32'h149dd895;
      expv[15] = 32'h8942182a;
      expv[16] = 32'h75b09605;
      expv[17] = 32'h32ae4bb2;
      expv[18] = 32'hb09a5aa8;
      expv[19] = 32'h6ef0ccb0;
      expv[20] = 32'he8830d9d;
      expv[21] = 32'hee3aaf0c;
      expv[22] = 32'h51383e30;
      expv[23] = 32'h199dc59d;
      expv[24] = 32'h5fa156f6;
      expv[25] = 32'h747e413e;
      expv[26] = 32'hc9332cf3;
      expv[27] = 32'he681458a;
      expv[28] = 32'hcb300454;
      expv[29] = 32'h837860c1;
      expv[30] = 32'habef73f7;
      expv[31] = 32'h20bb5bc6;
      expv[32] = 32'h2365eb01;
      expv[33] = 32'h76318646;
      expv[34] = 32'ha94fd0fb;
      expv[35] = 32'hfdb2b3c9;
      expv[36] = 32'hf3d8e218;
      expv[37] = 32'h9ad67ca4;
      expv[38] = 32'h54794ec3;
      expv[39] = 32'ha227599e;
      expv[40] = 32'h9f0330ac;
      expv[41] = 32'h581f8265;
      expv[42] = 32'h69d6f14a;
      expv[43] = 32'hbaba0a50;
      expv[44] = 32'h111fb675;
      expv[45] = 32'h5931c81b;
      expv[46] = 32'h3fdb77e0;
      expv[47] = 32'hfcc2b70f;
      expv[48] = 32'hca554cc0;
      expv[49] = 32'hc76b2a30;
      expv[50] = 32'hcb1a4eef;
      expv[51] = 32'h541665f1;
      expv[52] = 32'h831f9c2d;
      expv[53] = 32'hf4c20a3a;
      expv[54] = 32'haa74b3d7;
      expv[55] = 32'h885c152e;
      expv[56] = 32'h46b09bf2;
      expv[57] = 32'h3263c987;
      expv[58] = 32'h48178e2b;
      expv[59] = 32'h8c4eafd1;
      expv[60] = 32'hba3b2d92;
      expv[61] = 32'he8678358;
      expv[62] = 32'h5a7be264;
      expv[63] = 32'h7c7172dd;
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
