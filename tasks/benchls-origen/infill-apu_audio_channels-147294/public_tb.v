// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_147294 dut (
    .clk(clk),
    .rst_n(in_vec[18:18]),
    .mute(in_vec[17:17]),
    .addr(in_vec[16:9]),
    .data_in(in_vec[8:1]),
    .rw(in_vec[0:0]),
    .audio_out(out_vec[47:40]),
    .pcm_left(out_vec[39:24]),
    .pcm_right(out_vec[23:8]),
    .data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h12bca;
    stim[1] = 19'h24783;
    stim[2] = 19'h39fa4;
    stim[3] = 19'h5cb16;
    stim[4] = 19'h593a2;
    stim[5] = 19'h4c1b2;
    stim[6] = 19'h5477f;
    stim[7] = 19'h624a6;
    stim[8] = 19'h4d661;
    stim[9] = 19'h70d07;
    stim[10] = 19'h52840;
    stim[11] = 19'h746f2;
    stim[12] = 19'h600d3;
    stim[13] = 19'h42125;
    stim[14] = 19'h630a2;
    stim[15] = 19'h42655;
    stim[16] = 19'h6c350;
    stim[17] = 19'h57539;
    stim[18] = 19'h67806;
    stim[19] = 19'h58a65;
    stim[20] = 19'h6e3d6;
    stim[21] = 19'h6490c;
    stim[22] = 19'h78055;
    stim[23] = 19'h7f11d;
    stim[24] = 19'h72d59;
    stim[25] = 19'h561fa;
    stim[26] = 19'h5b41b;
    stim[27] = 19'h6bcf7;
    stim[28] = 19'h76dd1;
    stim[29] = 19'h6d2f0;
    stim[30] = 19'h5a777;
    stim[31] = 19'h4e472;
    stim[32] = 19'h77c56;
    stim[33] = 19'h7d074;
    stim[34] = 19'h62d5a;
    stim[35] = 19'h777c4;
    stim[36] = 19'h6fce8;
    stim[37] = 19'h7c695;
    stim[38] = 19'h40808;
    stim[39] = 19'h4d5b9;
    stim[40] = 19'h5d307;
    stim[41] = 19'h61fa7;
    stim[42] = 19'h682c6;
    stim[43] = 19'h730ac;
    stim[44] = 19'h5630f;
    stim[45] = 19'h64c36;
    stim[46] = 19'h741fd;
    stim[47] = 19'h74e7e;
    stim[48] = 19'h6c701;
    stim[49] = 19'h4ab85;
    stim[50] = 19'h51a4c;
    stim[51] = 19'h58a57;
    stim[52] = 19'h4c453;
    stim[53] = 19'h4a04d;
    stim[54] = 19'h4f59a;
    stim[55] = 19'h597f8;
    stim[56] = 19'h4762f;
    stim[57] = 19'h46734;
    stim[58] = 19'h41aa8;
    stim[59] = 19'h5b5fc;
    stim[60] = 19'h46037;
    stim[61] = 19'h5d0e9;
    stim[62] = 19'h5dfd0;
    stim[63] = 19'h76c56;
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
      expv[0] = 48'h000000000000;
      expv[1] = 48'h000000000000;
      expv[2] = 48'h000000000000;
      expv[3] = 48'h000000000000;
      expv[4] = 48'h000000000000;
      expv[5] = 48'h020000000000;
      expv[6] = 48'h020200020000;
      expv[7] = 48'h020200020000;
      expv[8] = 48'h000200020000;
      expv[9] = 48'h020000000000;
      expv[10] = 48'h000200020000;
      expv[11] = 48'h020000000000;
      expv[12] = 48'h000200020000;
      expv[13] = 48'h000000000000;
      expv[14] = 48'h020000000000;
      expv[15] = 48'h000200020000;
      expv[16] = 48'h020000000000;
      expv[17] = 48'h000200020000;
      expv[18] = 48'h020000000000;
      expv[19] = 48'h000200020000;
      expv[20] = 48'h020000000000;
      expv[21] = 48'h000200020000;
      expv[22] = 48'h000000000000;
      expv[23] = 48'h000000000000;
      expv[24] = 48'h000000000000;
      expv[25] = 48'h000000000000;
      expv[26] = 48'h020000000000;
      expv[27] = 48'h020200020000;
      expv[28] = 48'h000200020000;
      expv[29] = 48'h000000000000;
      expv[30] = 48'h000000000000;
      expv[31] = 48'h020000000000;
      expv[32] = 48'h020200020000;
      expv[33] = 48'h000200020000;
      expv[34] = 48'h000000000000;
      expv[35] = 48'h000000000000;
      expv[36] = 48'h000000000000;
      expv[37] = 48'h000000000000;
      expv[38] = 48'h000000000000;
      expv[39] = 48'h020000000000;
      expv[40] = 48'h020200020000;
      expv[41] = 48'h020200020000;
      expv[42] = 48'h000200020000;
      expv[43] = 48'h000000000000;
      expv[44] = 48'h000000000000;
      expv[45] = 48'h020000000000;
      expv[46] = 48'h000200020000;
      expv[47] = 48'h000000000000;
      expv[48] = 48'h000000000000;
      expv[49] = 48'h000000000000;
      expv[50] = 48'h020000000000;
      expv[51] = 48'h020200020000;
      expv[52] = 48'h020200020000;
      expv[53] = 48'h020200020000;
      expv[54] = 48'h020200020000;
      expv[55] = 48'h020200020000;
      expv[56] = 48'h020200020000;
      expv[57] = 48'h020200020000;
      expv[58] = 48'h020200020000;
      expv[59] = 48'h020200020000;
      expv[60] = 48'h020200020000;
      expv[61] = 48'h020200020000;
      expv[62] = 48'h020200020000;
      expv[63] = 48'h020200020000;
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
