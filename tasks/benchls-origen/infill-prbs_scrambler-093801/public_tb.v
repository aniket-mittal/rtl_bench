// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_093801 dut (
    .iClk(clk),
    .iClrn(in_vec[11:11]),
    .iValid(in_vec[10:10]),
    .iCheck(in_vec[9:9]),
    .iPSync(in_vec[8:8]),
    .iData(in_vec[7:0]),
    .oData(out_vec[10:3]),
    .oValid(out_vec[2:2]),
    .oCheck(out_vec[1:1]),
    .oPSync(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h567;
    stim[1] = 12'h476;
    stim[2] = 12'hae0;
    stim[3] = 12'h92b;
    stim[4] = 12'hf82;
    stim[5] = 12'hf16;
    stim[6] = 12'he42;
    stim[7] = 12'ha80;
    stim[8] = 12'hda6;
    stim[9] = 12'h8bc;
    stim[10] = 12'h9e1;
    stim[11] = 12'ha5c;
    stim[12] = 12'h60f;
    stim[13] = 12'hab9;
    stim[14] = 12'hb88;
    stim[15] = 12'ha2d;
    stim[16] = 12'hc47;
    stim[17] = 12'h9e4;
    stim[18] = 12'he86;
    stim[19] = 12'h935;
    stim[20] = 12'h9e8;
    stim[21] = 12'h8e7;
    stim[22] = 12'hba6;
    stim[23] = 12'hb40;
    stim[24] = 12'h816;
    stim[25] = 12'hd27;
    stim[26] = 12'hb17;
    stim[27] = 12'ha15;
    stim[28] = 12'ha27;
    stim[29] = 12'hf61;
    stim[30] = 12'hcdb;
    stim[31] = 12'he62;
    stim[32] = 12'h890;
    stim[33] = 12'hd5d;
    stim[34] = 12'h5f4;
    stim[35] = 12'hfd0;
    stim[36] = 12'hf79;
    stim[37] = 12'hff0;
    stim[38] = 12'ha82;
    stim[39] = 12'h8dc;
    stim[40] = 12'h82b;
    stim[41] = 12'he6b;
    stim[42] = 12'h889;
    stim[43] = 12'hac8;
    stim[44] = 12'h8c5;
    stim[45] = 12'hc25;
    stim[46] = 12'hdc8;
    stim[47] = 12'hf9a;
    stim[48] = 12'h895;
    stim[49] = 12'hed5;
    stim[50] = 12'hefc;
    stim[51] = 12'hbba;
    stim[52] = 12'he92;
    stim[53] = 12'hc8a;
    stim[54] = 12'hf4c;
    stim[55] = 12'hfd7;
    stim[56] = 12'hb90;
    stim[57] = 12'hdd0;
    stim[58] = 12'hba9;
    stim[59] = 12'hc9e;
    stim[60] = 12'hf86;
    stim[61] = 12'he30;
    stim[62] = 12'hdc9;
    stim[63] = 12'hbbf;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h002;
      expv[4] = 11'h001;
      expv[5] = 11'h3ef;
      expv[6] = 11'h0b7;
      expv[7] = 11'h006;
      expv[8] = 11'h002;
      expv[9] = 11'h535;
      expv[10] = 11'h530;
      expv[11] = 11'h531;
      expv[12] = 11'h000;
      expv[13] = 11'h000;
      expv[14] = 11'h002;
      expv[15] = 11'h003;
      expv[16] = 11'h002;
      expv[17] = 11'h5c4;
      expv[18] = 11'h5c1;
      expv[19] = 11'h006;
      expv[20] = 11'h001;
      expv[21] = 11'h001;
      expv[22] = 11'h000;
      expv[23] = 11'h003;
      expv[24] = 11'h003;
      expv[25] = 11'h000;
      expv[26] = 11'h6c5;
      expv[27] = 11'h6c3;
      expv[28] = 11'h6c2;
      expv[29] = 11'h6c2;
      expv[30] = 11'h30f;
      expv[31] = 11'h124;
      expv[32] = 11'h006;
      expv[33] = 11'h000;
      expv[34] = 11'h000;
      expv[35] = 11'h000;
      expv[36] = 11'h17f;
      expv[37] = 11'h3cf;
      expv[38] = 11'h787;
      expv[39] = 11'h782;
      expv[40] = 11'h780;
      expv[41] = 11'h780;
      expv[42] = 11'h006;
      expv[43] = 11'h000;
      expv[44] = 11'h002;
      expv[45] = 11'h000;
      expv[46] = 11'h6d4;
      expv[47] = 11'h645;
      expv[48] = 11'h4d7;
      expv[49] = 11'h4d0;
      expv[50] = 11'h006;
      expv[51] = 11'h006;
      expv[52] = 11'h003;
      expv[53] = 11'h006;
      expv[54] = 11'h3a4;
      expv[55] = 11'h267;
      expv[56] = 11'h6bf;
      expv[57] = 11'h6bb;
      expv[58] = 11'h685;
      expv[59] = 11'h683;
      expv[60] = 11'h314;
      expv[61] = 11'h3cf;
      expv[62] = 11'h006;
      expv[63] = 11'h64d;
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
