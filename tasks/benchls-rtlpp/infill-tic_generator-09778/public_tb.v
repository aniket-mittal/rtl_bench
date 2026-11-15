// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09778 dut (
    .clk(clk),
    .rstn(in_vec[48:48]),
    .tic_divide(in_vec[47:24]),
    .accum_divide(in_vec[23:0]),
    .pre_tic_enable(out_vec[51:51]),
    .tic_enable(out_vec[50:50]),
    .accum_enable(out_vec[49:49]),
    .accum_sample_enable(out_vec[48:48]),
    .tic_count(out_vec[47:24]),
    .accum_count(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h0633bae16d230;
    stim[1] = 49'h045e031b1a0b7;
    stim[2] = 49'h1219b8ab6cb93;
    stim[3] = 49'h1b4b4a239fd1c;
    stim[4] = 49'h14396b7797072;
    stim[5] = 49'h1c049b57d71d3;
    stim[6] = 49'h03a227e67904a;
    stim[7] = 49'h172d2caa796ad;
    stim[8] = 49'h17338c4e2c8d2;
    stim[9] = 49'h1d44259f6e6e7;
    stim[10] = 49'h19bc9d51e401c;
    stim[11] = 49'h129dc197ca8c5;
    stim[12] = 49'h1f77ffcb8d0e0;
    stim[13] = 49'h1f0ce17826831;
    stim[14] = 49'h1243e000b3152;
    stim[15] = 49'h139e9d770a78c;
    stim[16] = 49'h1c8ab27438e76;
    stim[17] = 49'h1a12a50236a4b;
    stim[18] = 49'h15bf61bfbb527;
    stim[19] = 49'h127de00c151f9;
    stim[20] = 49'h11860f0495675;
    stim[21] = 49'h16363ea6414d6;
    stim[22] = 49'h10bbda833c421;
    stim[23] = 49'h1458469cef849;
    stim[24] = 49'h1ca035f099b9b;
    stim[25] = 49'h1791326e70d70;
    stim[26] = 49'h1adc05f82adad;
    stim[27] = 49'h19a05ad49a1a1;
    stim[28] = 49'h12c49fe58e442;
    stim[29] = 49'h15e2b325a5f09;
    stim[30] = 49'h18125ed1909a5;
    stim[31] = 49'h1fe13c68207d4;
    stim[32] = 49'h16de35dbfec55;
    stim[33] = 49'h17d134b8ac810;
    stim[34] = 49'h12bc7f09354ea;
    stim[35] = 49'h1795e05c6910a;
    stim[36] = 49'h19699e2922a6d;
    stim[37] = 49'h11ee2eecc227a;
    stim[38] = 49'h147b9d5f2ba5d;
    stim[39] = 49'h121c868ee7738;
    stim[40] = 49'h1ad201e71b7c0;
    stim[41] = 49'h10b5b6808d243;
    stim[42] = 49'h1de634d99eef6;
    stim[43] = 49'h1f759ee365950;
    stim[44] = 49'h17bb1507ec23e;
    stim[45] = 49'h14f3408837d5b;
    stim[46] = 49'h18de54a90de54;
    stim[47] = 49'h16c0d44542212;
    stim[48] = 49'h142f793249884;
    stim[49] = 49'h11ca127fd9072;
    stim[50] = 49'h1a13856def6c2;
    stim[51] = 49'h1649d005c604d;
    stim[52] = 49'h1295008fab8d3;
    stim[53] = 49'h12991a14dab43;
    stim[54] = 49'h09d1bc43403a6;
    stim[55] = 49'h18ee64cfe1768;
    stim[56] = 49'h15cbf9546d168;
    stim[57] = 49'h109219a4977a4;
    stim[58] = 49'h1e7de96596df7;
    stim[59] = 49'h10cd9e33f919f;
    stim[60] = 49'h1410dc6cb7956;
    stim[61] = 49'h13f1f4af9f365;
    stim[62] = 49'h17c859e602f81;
    stim[63] = 49'h1a658d0fc9bd4;
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
      expv[0] = 52'hxxxxxxxxxxxxx;
      expv[1] = 52'ha000000000000;
      expv[2] = 52'ha000000000000;
      expv[3] = 52'h5219b8ab6cb93;
      expv[4] = 52'h0219b89b6cb92;
      expv[5] = 52'h0219b88b6cb91;
      expv[6] = 52'h0219b87b6cb90;
      expv[7] = 52'ha000000000000;
      expv[8] = 52'h572d2caa796ad;
      expv[9] = 52'h072d2c9a796ac;
      expv[10] = 52'h072d2c8a796ab;
      expv[11] = 52'h072d2c7a796aa;
      expv[12] = 52'h072d2c6a796a9;
      expv[13] = 52'h172d2c5a796a8;
      expv[14] = 52'h072d2c4a796a7;
      expv[15] = 52'h072d2c3a796a6;
      expv[16] = 52'h072d2c2a796a5;
      expv[17] = 52'h072d2c1a796a4;
      expv[18] = 52'h172d2c0a796a3;
      expv[19] = 52'h072d2bfa796a2;
      expv[20] = 52'h072d2bea796a1;
      expv[21] = 52'h072d2bda796a0;
      expv[22] = 52'h072d2bca7969f;
      expv[23] = 52'h172d2bba7969e;
      expv[24] = 52'h072d2baa7969d;
      expv[25] = 52'h072d2b9a7969c;
      expv[26] = 52'h072d2b8a7969b;
      expv[27] = 52'h072d2b7a7969a;
      expv[28] = 52'h172d2b6a79699;
      expv[29] = 52'h072d2b5a79698;
      expv[30] = 52'h072d2b4a79697;
      expv[31] = 52'h072d2b3a79696;
      expv[32] = 52'h072d2b2a79695;
      expv[33] = 52'h172d2b1a79694;
      expv[34] = 52'h072d2b0a79693;
      expv[35] = 52'h072d2afa79692;
      expv[36] = 52'h072d2aea79691;
      expv[37] = 52'h072d2ada79690;
      expv[38] = 52'h172d2aca7968f;
      expv[39] = 52'h072d2aba7968e;
      expv[40] = 52'h072d2aaa7968d;
      expv[41] = 52'h072d2a9a7968c;
      expv[42] = 52'h072d2a8a7968b;
      expv[43] = 52'h172d2a7a7968a;
      expv[44] = 52'h072d2a6a79689;
      expv[45] = 52'h072d2a5a79688;
      expv[46] = 52'h072d2a4a79687;
      expv[47] = 52'h072d2a3a79686;
      expv[48] = 52'h172d2a2a79685;
      expv[49] = 52'h072d2a1a79684;
      expv[50] = 52'h072d2a0a79683;
      expv[51] = 52'h072d29fa79682;
      expv[52] = 52'h072d29ea79681;
      expv[53] = 52'h172d29da79680;
      expv[54] = 52'h072d29ca7967f;
      expv[55] = 52'ha000000000000;
      expv[56] = 52'h58ee64cfe1768;
      expv[57] = 52'h08ee64bfe1767;
      expv[58] = 52'h08ee64afe1766;
      expv[59] = 52'h08ee649fe1765;
      expv[60] = 52'h08ee648fe1764;
      expv[61] = 52'h18ee647fe1763;
      expv[62] = 52'h08ee646fe1762;
      expv[63] = 52'h08ee645fe1761;
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
