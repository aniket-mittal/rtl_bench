// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 176;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00677 dut (
    .clk(clk),
    .we(in_vec[21:21]),
    .wa(in_vec[20:17]),
    .di(in_vec[16:1]),
    .re(in_vec[0:0]),
    .do0(out_vec[175:160]),
    .do1(out_vec[159:144]),
    .do2(out_vec[143:128]),
    .do3(out_vec[127:112]),
    .do4(out_vec[111:96]),
    .do5(out_vec[95:80]),
    .do6(out_vec[79:64]),
    .do7(out_vec[63:48]),
    .do8(out_vec[47:32]),
    .do9(out_vec[31:16]),
    .do10(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h340980;
    stim[1] = 22'h062bc7;
    stim[2] = 22'h18d281;
    stim[3] = 22'h00183c;
    stim[4] = 22'h037777;
    stim[5] = 22'h069b43;
    stim[6] = 22'h3172d5;
    stim[7] = 22'h17e940;
    stim[8] = 22'h1fbad7;
    stim[9] = 22'h072188;
    stim[10] = 22'h394259;
    stim[11] = 22'h1355ca;
    stim[12] = 22'h0958c4;
    stim[13] = 22'h3bdbdf;
    stim[14] = 22'h020869;
    stim[15] = 22'h343e67;
    stim[16] = 22'h04d738;
    stim[17] = 22'h1b33c2;
    stim[18] = 22'h26a5ba;
    stim[19] = 22'h338c32;
    stim[20] = 22'h073664;
    stim[21] = 22'h3ff871;
    stim[22] = 22'h373ab2;
    stim[23] = 22'h2fa7a9;
    stim[24] = 22'h1b629e;
    stim[25] = 22'h2b0f1a;
    stim[26] = 22'h002f7f;
    stim[27] = 22'h13035d;
    stim[28] = 22'h23e5b5;
    stim[29] = 22'h08c696;
    stim[30] = 22'h375016;
    stim[31] = 22'h2600c9;
    stim[32] = 22'h280ffd;
    stim[33] = 22'h029fdb;
    stim[34] = 22'h2618dc;
    stim[35] = 22'h168331;
    stim[36] = 22'h191aa0;
    stim[37] = 22'h381f25;
    stim[38] = 22'h0597d2;
    stim[39] = 22'h2aa562;
    stim[40] = 22'h36ae48;
    stim[41] = 22'h12f2d4;
    stim[42] = 22'h0be5c1;
    stim[43] = 22'h1ffe18;
    stim[44] = 22'h051863;
    stim[45] = 22'h308662;
    stim[46] = 22'h360956;
    stim[47] = 22'h18a079;
    stim[48] = 22'h26f56b;
    stim[49] = 22'h2a2a32;
    stim[50] = 22'h1f31e5;
    stim[51] = 22'h27fa58;
    stim[52] = 22'h1b6cf8;
    stim[53] = 22'h1697cb;
    stim[54] = 22'h14b84a;
    stim[55] = 22'h2b5752;
    stim[56] = 22'h0f02f7;
    stim[57] = 22'h2c53fc;
    stim[58] = 22'h37267b;
    stim[59] = 22'h0dcd0c;
    stim[60] = 22'h0f405c;
    stim[61] = 22'h22e21a;
    stim[62] = 22'h039c7e;
    stim[63] = 22'h19f090;
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
      expv[0] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx04c0;
      expv[2] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx04c0;
      expv[3] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx04c0;
      expv[5] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx04c0;
      expv[6] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx04c0;
      expv[7] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxb96axxxx04c0;
      expv[9] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxb96axxxx04c0;
      expv[11] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxb96axxxx04c0;
      expv[14] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxb96axxxx04c0;
      expv[15] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxb96axxxx04c0;
      expv[16] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 176'hxxxxxxxxxxxx52ddxxxxxxxxxxxxxxxxb96ac6191f33;
      expv[22] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 176'hxxxxxxxxxxxx52ddxxxxxxxxxxxxxxxxb96ac6191f33;
      expv[24] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 176'hxxxxxxxxxxxx52ddxxxx878dxxxxd3d4b96ac6191f33;
      expv[27] = 176'hxxxxxxxxxxxx52ddxxxx878dxxxxd3d4b96ac6191f33;
      expv[28] = 176'hxxxxxxxxxxxx52ddxxxx878dxxxxd3d4b96ac6191f33;
      expv[29] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 176'hxxxxf2daxxxx52ddxxxx878dxxxxd3d4b96ac6191f33;
      expv[32] = 176'hxxxxf2daxxxx0064xxxx878dxxxxd3d4b96ac6191f33;
      expv[33] = 176'hxxxxf2daxxxx006407fe878dxxxxd3d4b96ac6191f33;
      expv[34] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 176'hxxxxf2daxxxx0c6e07fe878dxxxxd3d4b96ac6191f33;
      expv[36] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 176'hxxxxf2daxxxx0c6e07fe878dxxxxd3d4b96ac6191f33;
      expv[38] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 176'hxxxxf2daxxxx0c6e07fe52b1xxxxd3d4b96ac6191f33;
      expv[43] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 176'hxxxxf2daxxxx0c6e07fe52b1xxxxd3d4b96ac6191f33;
      expv[45] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 176'hxxxxf2daxxxx0c6e07fe52b1xxxxd3d44331c6191f33;
      expv[48] = 176'hxxxxf2daxxxx0c6e07fe52b1xxxxd3d44331c6191f33;
      expv[49] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 176'hxxxxf2daxxxx7ab507fe1519xxxxd3d44331c6191f33;
      expv[51] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 176'hxxxxf2daxxxxfd2c07fe1519xxxxd3d44331c6191f33;
      expv[54] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 176'hxxxxf2daxxxxfd2c07feaba9xxxxd3d44331c6191f33;
      expv[57] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 176'hxxxxf2daxxxxfd2c07feaba929fed3d44331c6191f33;
      expv[59] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 176'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
