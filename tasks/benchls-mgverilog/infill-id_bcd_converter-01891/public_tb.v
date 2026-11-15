// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01891 dut (
    .enable(clk),
    .digits45(in_vec[44:0]),
    .iddecimal4(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h00624118bb98;
    stim[1] = 45'h1153f09fb709;
    stim[2] = 45'h0a60cc3d597f;
    stim[3] = 45'h15b1f04d9e33;
    stim[4] = 45'h1c8a28167192;
    stim[5] = 45'h135817d1d346;
    stim[6] = 45'h1d1590403ffd;
    stim[7] = 45'h0d758428b3ae;
    stim[8] = 45'h0205b6d9d44e;
    stim[9] = 45'h03f12332cb8b;
    stim[10] = 45'h1ea6d24dd339;
    stim[11] = 45'h150cf62a89aa;
    stim[12] = 45'h185d8e16f181;
    stim[13] = 45'h116662d0ae72;
    stim[14] = 45'h05030e1f89bf;
    stim[15] = 45'h0120ebf96606;
    stim[16] = 45'h07191353250a;
    stim[17] = 45'h1893e855daae;
    stim[18] = 45'h024a1101987c;
    stim[19] = 45'h12dc46d8e22d;
    stim[20] = 45'h1d342e0f0bb2;
    stim[21] = 45'h1a942788c6bb;
    stim[22] = 45'h109f50684954;
    stim[23] = 45'h178a2aa7219f;
    stim[24] = 45'h1d317e58e157;
    stim[25] = 45'h02e30fcfaa7d;
    stim[26] = 45'h115dac0c1948;
    stim[27] = 45'h04b3dea0250b;
    stim[28] = 45'h0235a0fe19d4;
    stim[29] = 45'h0ad5fe2c82e7;
    stim[30] = 45'h109a3635574a;
    stim[31] = 45'h06eda5aa73ff;
    stim[32] = 45'h0ee87d7377df;
    stim[33] = 45'h196d1604def8;
    stim[34] = 45'h099ce31e7ba3;
    stim[35] = 45'h0acd0535fa67;
    stim[36] = 45'h0415c8944e62;
    stim[37] = 45'h18eb435054f8;
    stim[38] = 45'h16ca183422ef;
    stim[39] = 45'h080550a9d866;
    stim[40] = 45'h0fb467f9170f;
    stim[41] = 45'h0e47bf44aed8;
    stim[42] = 45'h0064e43d759e;
    stim[43] = 45'h0a40c305921e;
    stim[44] = 45'h074d0d6c792a;
    stim[45] = 45'h0117be17d802;
    stim[46] = 45'h007595bbe833;
    stim[47] = 45'h11303884f4b5;
    stim[48] = 45'h14837a251027;
    stim[49] = 45'h18b3e56ce961;
    stim[50] = 45'h0086d200fbdf;
    stim[51] = 45'h1565fac60394;
    stim[52] = 45'h0ca56605a711;
    stim[53] = 45'h106d8beaff77;
    stim[54] = 45'h0479d2c016db;
    stim[55] = 45'h0d56b915bc2c;
    stim[56] = 45'h089d5a675783;
    stim[57] = 45'h0e6f626a119d;
    stim[58] = 45'h07dd547a2e2a;
    stim[59] = 45'h0670d4c19e70;
    stim[60] = 45'h17b84167b62b;
    stim[61] = 45'h0fcde545dea6;
    stim[62] = 45'h1c747c00e86b;
    stim[63] = 45'h05bea2f9928f;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'h9996;
      expv[2] = 16'h999e;
      expv[3] = 16'h9999;
      expv[4] = 16'h9993;
      expv[5] = 16'h9993;
      expv[6] = 16'h999d;
      expv[7] = 16'h8190;
      expv[8] = 16'h9991;
      expv[9] = 16'h9991;
      expv[10] = 16'h999f;
      expv[11] = 16'h9996;
      expv[12] = 16'h999f;
      expv[13] = 16'h999a;
      expv[14] = 16'h9993;
      expv[15] = 16'h9999;
      expv[16] = 16'h999d;
      expv[17] = 16'h999f;
      expv[18] = 16'h9991;
      expv[19] = 16'h9998;
      expv[20] = 16'h9990;
      expv[21] = 16'h9993;
      expv[22] = 16'h9997;
      expv[23] = 16'h9386;
      expv[24] = 16'h9999;
      expv[25] = 16'h9995;
      expv[26] = 16'h9998;
      expv[27] = 16'h3236;
      expv[28] = 16'h4741;
      expv[29] = 16'h3306;
      expv[30] = 16'h999d;
      expv[31] = 16'h999f;
      expv[32] = 16'h9999;
      expv[33] = 16'h9999;
      expv[34] = 16'h9996;
      expv[35] = 16'h999b;
      expv[36] = 16'h999d;
      expv[37] = 16'h999b;
      expv[38] = 16'h9996;
      expv[39] = 16'h4471;
      expv[40] = 16'h999d;
      expv[41] = 16'h9991;
      expv[42] = 16'h9996;
      expv[43] = 16'h9999;
      expv[44] = 16'h9999;
      expv[45] = 16'h999f;
      expv[46] = 16'h999b;
      expv[47] = 16'h9993;
      expv[48] = 16'h9994;
      expv[49] = 16'h999d;
      expv[50] = 16'h999a;
      expv[51] = 16'h9999;
      expv[52] = 16'h0458;
      expv[53] = 16'h9992;
      expv[54] = 16'h9995;
      expv[55] = 16'h2925;
      expv[56] = 16'h9990;
      expv[57] = 16'h999b;
      expv[58] = 16'h2254;
      expv[59] = 16'h5909;
      expv[60] = 16'h9992;
      expv[61] = 16'h999f;
      expv[62] = 16'h999d;
      expv[63] = 16'h999f;
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
