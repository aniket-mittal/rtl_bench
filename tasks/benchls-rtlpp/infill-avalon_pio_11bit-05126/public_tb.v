// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05126 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[42:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h00cae7a13d;
    stim[1] = 37'h15951f03c2;
    stim[2] = 37'h169c76e2dc;
    stim[3] = 37'h06bee8a569;
    stim[4] = 37'h03f4a412af;
    stim[5] = 37'h0fee146f33;
    stim[6] = 37'h0f175184ec;
    stim[7] = 37'h0f9e1bff59;
    stim[8] = 37'h129acb4205;
    stim[9] = 37'h1be0542b44;
    stim[10] = 37'h0e4dce1208;
    stim[11] = 37'h0180e7214f;
    stim[12] = 37'h137961a0c1;
    stim[13] = 37'h167b3f30ab;
    stim[14] = 37'h0f2f00e532;
    stim[15] = 37'h1666b4ed2f;
    stim[16] = 37'h1ad81eca71;
    stim[17] = 37'h175509066c;
    stim[18] = 37'h0601b867f7;
    stim[19] = 37'h1fcd87e266;
    stim[20] = 37'h075c06f793;
    stim[21] = 37'h17ce69706b;
    stim[22] = 37'h028dfb2024;
    stim[23] = 37'h0796e94d51;
    stim[24] = 37'h07996cdf4f;
    stim[25] = 37'h1229695a65;
    stim[26] = 37'h06853d11e8;
    stim[27] = 37'h03f9cc90cd;
    stim[28] = 37'h076b40d661;
    stim[29] = 37'h13ab96a034;
    stim[30] = 37'h0b2159ad3b;
    stim[31] = 37'h06652620b7;
    stim[32] = 37'h17d40351e7;
    stim[33] = 37'h0f38598899;
    stim[34] = 37'h1264e7ed8e;
    stim[35] = 37'h1e5fc9d63c;
    stim[36] = 37'h1b7bb095c0;
    stim[37] = 37'h1ffd98ee40;
    stim[38] = 37'h0637c2eaa6;
    stim[39] = 37'h12841ef50d;
    stim[40] = 37'h12d82f4563;
    stim[41] = 37'h036a508197;
    stim[42] = 37'h125f5e3a00;
    stim[43] = 37'h0e316470a5;
    stim[44] = 37'h1be069206c;
    stim[45] = 37'h16620b9d9b;
    stim[46] = 37'h0ad5bb3e7f;
    stim[47] = 37'h0713163d3c;
    stim[48] = 37'h02f3474ee7;
    stim[49] = 37'h0b14987794;
    stim[50] = 37'h1e1456dfde;
    stim[51] = 37'h0af4324a92;
    stim[52] = 37'h0bc6c93d03;
    stim[53] = 37'h0334278226;
    stim[54] = 37'h06dc352de0;
    stim[55] = 37'h16857ccd96;
    stim[56] = 37'h0eed263d01;
    stim[57] = 37'h12a6397eb1;
    stim[58] = 37'h18b68c58b9;
    stim[59] = 37'h078941017e;
    stim[60] = 37'h0e6c562740;
    stim[61] = 37'h172abf1595;
    stim[62] = 37'h1622cf0d89;
    stim[63] = 37'h048bd2d735;
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
      expv[0] = 43'h00000000000;
      expv[1] = 43'h00000000000;
      expv[2] = 43'h00000000000;
      expv[3] = 43'h00000000000;
      expv[4] = 43'h56900000569;
      expv[5] = 43'h56900000000;
      expv[6] = 43'h56900000000;
      expv[7] = 43'h56900000000;
      expv[8] = 43'h56900000000;
      expv[9] = 43'h56900000000;
      expv[10] = 43'h56900000000;
      expv[11] = 43'h00000000000;
      expv[12] = 43'h00000000000;
      expv[13] = 43'h00000000000;
      expv[14] = 43'h00000000000;
      expv[15] = 43'h00000000000;
      expv[16] = 43'h00000000000;
      expv[17] = 43'h00000000000;
      expv[18] = 43'h00000000000;
      expv[19] = 43'h7f700000000;
      expv[20] = 43'h7f7000007f7;
      expv[21] = 43'h7f700000000;
      expv[22] = 43'h7f7000007f7;
      expv[23] = 43'h7f7000007f7;
      expv[24] = 43'h7f7000007f7;
      expv[25] = 43'h7f700000000;
      expv[26] = 43'h7f7000007f7;
      expv[27] = 43'h1e8000001e8;
      expv[28] = 43'h1e8000001e8;
      expv[29] = 43'h1e800000000;
      expv[30] = 43'h1e800000000;
      expv[31] = 43'h1e8000001e8;
      expv[32] = 43'h0b700000000;
      expv[33] = 43'h0b700000000;
      expv[34] = 43'h0b700000000;
      expv[35] = 43'h0b700000000;
      expv[36] = 43'h0b700000000;
      expv[37] = 43'h0b700000000;
      expv[38] = 43'h0b7000000b7;
      expv[39] = 43'h2a600000000;
      expv[40] = 43'h2a600000000;
      expv[41] = 43'h2a6000002a6;
      expv[42] = 43'h2a600000000;
      expv[43] = 43'h2a600000000;
      expv[44] = 43'h2a600000000;
      expv[45] = 43'h2a600000000;
      expv[46] = 43'h2a600000000;
      expv[47] = 43'h2a6000002a6;
      expv[48] = 43'h2a6000002a6;
      expv[49] = 43'h2a600000000;
      expv[50] = 43'h2a600000000;
      expv[51] = 43'h2a600000000;
      expv[52] = 43'h2a600000000;
      expv[53] = 43'h2a6000002a6;
      expv[54] = 43'h2a6000002a6;
      expv[55] = 43'h5e000000000;
      expv[56] = 43'h5e000000000;
      expv[57] = 43'h5e000000000;
      expv[58] = 43'h00000000000;
      expv[59] = 43'h00000000000;
      expv[60] = 43'h00000000000;
      expv[61] = 43'h00000000000;
      expv[62] = 43'h00000000000;
      expv[63] = 43'h00000000000;
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
