// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_000602 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .bus_in(in_vec[31:0]),
    .bus_A(out_vec[73:42]),
    .bus_out(out_vec[41:10]),
    .bus_WE(out_vec[9:9]),
    .bus_RE(out_vec[8:8]),
    .current_opcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1e831a498;
    stim[1] = 33'h16fd6b940;
    stim[2] = 33'h0a6e30ae0;
    stim[3] = 33'h0341070fc;
    stim[4] = 33'h0b10be907;
    stim[5] = 33'h10f069b53;
    stim[6] = 33'h026949fa9;
    stim[7] = 33'h071aa7297;
    stim[8] = 33'h0797953c3;
    stim[9] = 33'h09fdb1da2;
    stim[10] = 33'h080ecb16e;
    stim[11] = 33'h04a5210b6;
    stim[12] = 33'h157ce4288;
    stim[13] = 33'h036bbab7f;
    stim[14] = 33'h0de095b5b;
    stim[15] = 33'h0b0055092;
    stim[16] = 33'h0720a06a5;
    stim[17] = 33'h0a53b83c9;
    stim[18] = 33'h057119c87;
    stim[19] = 33'h0eb713805;
    stim[20] = 33'h1e7018682;
    stim[21] = 33'h0adb343a3;
    stim[22] = 33'h039057f1c;
    stim[23] = 33'h04e1c3795;
    stim[24] = 33'h0aa53e6f8;
    stim[25] = 33'h0ee924e95;
    stim[26] = 33'h17d42b97d;
    stim[27] = 33'h08b7fbd14;
    stim[28] = 33'h0d1749c56;
    stim[29] = 33'h09b168c76;
    stim[30] = 33'h077de2a63;
    stim[31] = 33'h0f01845df;
    stim[32] = 33'h0a3b09647;
    stim[33] = 33'h0c88f65d6;
    stim[34] = 33'h06d509d05;
    stim[35] = 33'h0bb2f82be;
    stim[36] = 33'h08804cd86;
    stim[37] = 33'h1cccdb122;
    stim[38] = 33'h0edb1acdf;
    stim[39] = 33'h0b1bf27d7;
    stim[40] = 33'h071ea09d5;
    stim[41] = 33'h0a1b04b58;
    stim[42] = 33'h03e9ba44e;
    stim[43] = 33'h063e33366;
    stim[44] = 33'h056977e42;
    stim[45] = 33'h03d0eb224;
    stim[46] = 33'h0acd58395;
    stim[47] = 33'h0a27d83c8;
    stim[48] = 33'h00ffd0e82;
    stim[49] = 33'h01493a01b;
    stim[50] = 33'h048d8b233;
    stim[51] = 33'h0cc9a4433;
    stim[52] = 33'h02016a580;
    stim[53] = 33'h080ba23ff;
    stim[54] = 33'h074cf464f;
    stim[55] = 33'h12ed3ce32;
    stim[56] = 33'h0d6d616d4;
    stim[57] = 33'h0b76bc6b8;
    stim[58] = 33'h0b88c3056;
    stim[59] = 33'h06639a8e6;
    stim[60] = 33'h02a8a3d46;
    stim[61] = 33'h049937335;
    stim[62] = 33'h01750b5a9;
    stim[63] = 33'h0d4e18e95;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h00000000xxxxxxxxxxx;
      expv[2] = 74'h00000000xxxxxxxxxxx;
      expv[3] = 74'h00000000xxxxxxxxxxx;
      expv[4] = 74'h00000000xxxxxxxxxxx;
      expv[5] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[6] = 74'h00000000xxxxxxxxxxx;
      expv[7] = 74'h00000000xxxxxxxxxxx;
      expv[8] = 74'h00000000xxxxxxxxxxx;
      expv[9] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[10] = 74'h00000000xxxxxxxxxxx;
      expv[11] = 74'h00000000xxxxxxxxxxx;
      expv[12] = 74'h00000000xxxxxxxxxxx;
      expv[13] = 74'h00000000xxxxxxxxxxx;
      expv[14] = 74'h00000000xxxxxxxxxxx;
      expv[15] = 74'h00000000xxxxxxxxxxx;
      expv[16] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[17] = 74'h00000000xxxxxxxxxxx;
      expv[18] = 74'h00000000xxxxxxxxxxx;
      expv[19] = 74'h00000000xxxxxxxxxxx;
      expv[20] = 74'h00000000xxxxxxxxxxx;
      expv[21] = 74'h00000000xxxxxxxxxxx;
      expv[22] = 74'h00000000xxxxxxxxxxx;
      expv[23] = 74'h00000000xxxxxxxxxxx;
      expv[24] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[25] = 74'h00000000xxxxxxxxxxx;
      expv[26] = 74'h00000000xxxxxxxxxxx;
      expv[27] = 74'h00000000xxxxxxxxxxx;
      expv[28] = 74'h00000000xxxxxxxxxxx;
      expv[29] = 74'h00000000xxxxxxxxxxx;
      expv[30] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[31] = 74'h00000000xxxxxxxxxxx;
      expv[32] = 74'h00000000xxxxxxxxxxx;
      expv[33] = 74'h00000000xxxxxxxxxxx;
      expv[34] = 74'h00000000xxxxxxxxxxx;
      expv[35] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[36] = 74'h00000000xxxxxxxxxxx;
      expv[37] = 74'h00000000xxxxxxxxxxx;
      expv[38] = 74'h00000000xxxxxxxxxxx;
      expv[39] = 74'h00000000xxxxxxxxxxx;
      expv[40] = 74'h00000000xxxxxxxxxxx;
      expv[41] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[42] = 74'h00000000xxxxxxxxxxx;
      expv[43] = 74'h00000000xxxxxxxxxxx;
      expv[44] = 74'h00000000xxxxxxxxxxx;
      expv[45] = 74'h00000000xxxxxxxxxxx;
      expv[46] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[47] = 74'h00000000xxxxxxxxxxx;
      expv[48] = 74'h00000000xxxxxxxxxxx;
      expv[49] = 74'h00000000xxxxxxxxxxx;
      expv[50] = 74'h00000000xxxxxxxxxxx;
      expv[51] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[52] = 74'h00000000xxxxxxxxxxx;
      expv[53] = 74'h00000000xxxxxxxxxxx;
      expv[54] = 74'h00000000xxxxxxxxxxx;
      expv[55] = 74'h00000000xxxxxxxxxxx;
      expv[56] = 74'h00000000xxxxxxxxxxx;
      expv[57] = 74'h00000000xxxxxxxxxxx;
      expv[58] = 74'h00000000xxxxxxxxxxx;
      expv[59] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[60] = 74'h00000000xxxxxxxxxxx;
      expv[61] = 74'h00000000xxxxxxxxxxx;
      expv[62] = 74'h00000000xxxxxxxxxxx;
      expv[63] = 74'h00000000xxxxxxxxxxx;
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
