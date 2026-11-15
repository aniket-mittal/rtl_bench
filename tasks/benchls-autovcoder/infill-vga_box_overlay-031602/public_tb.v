// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_031602 dut (
    .advanced_sw(in_vec[24:24]),
    .VGA_HORZ_COORD(in_vec[23:12]),
    .VGA_VERT_COORD(in_vec[11:0]),
    .VGA_Red_Grid(out_vec[11:8]),
    .VGA_Green_Grid(out_vec[7:4]),
    .VGA_Blue_Grid(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h1801ed6;
    stim[1] = 25'h0b6b394;
    stim[2] = 25'h1e38413;
    stim[3] = 25'h191883e;
    stim[4] = 25'h15bb2ff;
    stim[5] = 25'h0346e8d;
    stim[6] = 25'h01b44c8;
    stim[7] = 25'h0b8f5cf;
    stim[8] = 25'h136941d;
    stim[9] = 25'h033d048;
    stim[10] = 25'h1b57433;
    stim[11] = 25'h1c51fc9;
    stim[12] = 25'h15dfd86;
    stim[13] = 25'h1d6b310;
    stim[14] = 25'h021fad7;
    stim[15] = 25'h0203fab;
    stim[16] = 25'h13cf287;
    stim[17] = 25'h15c7e98;
    stim[18] = 25'h131b330;
    stim[19] = 25'h08cd4a0;
    stim[20] = 25'h130ed4b;
    stim[21] = 25'h0add12a;
    stim[22] = 25'h02aa3cf;
    stim[23] = 25'h0fe4272;
    stim[24] = 25'h1a0c740;
    stim[25] = 25'h19c2f6e;
    stim[26] = 25'h1bed0a0;
    stim[27] = 25'h022a49e;
    stim[28] = 25'h02eb071;
    stim[29] = 25'h1f9df0a;
    stim[30] = 25'h1a778ce;
    stim[31] = 25'h1387bb5;
    stim[32] = 25'h1cabf48;
    stim[33] = 25'h16d292b;
    stim[34] = 25'h15ecc23;
    stim[35] = 25'h115d128;
    stim[36] = 25'h12dcc91;
    stim[37] = 25'h0648570;
    stim[38] = 25'h0403153;
    stim[39] = 25'h14b7c43;
    stim[40] = 25'h08821ef;
    stim[41] = 25'h175d152;
    stim[42] = 25'h0859806;
    stim[43] = 25'h0bff1ff;
    stim[44] = 25'h19b9988;
    stim[45] = 25'h10d8bd5;
    stim[46] = 25'h19924ea;
    stim[47] = 25'h1393bc2;
    stim[48] = 25'h0ad58c8;
    stim[49] = 25'h147c6f7;
    stim[50] = 25'h0903b90;
    stim[51] = 25'h080fe15;
    stim[52] = 25'h0eeaf93;
    stim[53] = 25'h015c37d;
    stim[54] = 25'h08caec5;
    stim[55] = 25'h0e8dd0f;
    stim[56] = 25'h19a80e5;
    stim[57] = 25'h1137a26;
    stim[58] = 25'h0a52485;
    stim[59] = 25'h1882871;
    stim[60] = 25'h0facc91;
    stim[61] = 25'h00e0ac6;
    stim[62] = 25'h179f624;
    stim[63] = 25'h038041f;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h000;
      expv[9] = 12'h000;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h000;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h000;
      expv[47] = 12'h000;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h000;
      expv[59] = 12'h000;
      expv[60] = 12'h000;
      expv[61] = 12'h000;
      expv[62] = 12'h000;
      expv[63] = 12'h000;
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
