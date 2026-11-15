// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132813 dut (
    .clk(clk),
    .rst(in_vec[65:65]),
    .data_in(in_vec[64:33]),
    .address(in_vec[32:1]),
    .enable(in_vec[0:0]),
    .data_out(out_vec[33:2]),
    .rw_status(out_vec[1:1]),
    .data_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h2b34d6ae9b7b0700c;
    stim[1] = 66'h2e62116ccae420adb;
    stim[2] = 66'h0e57051de66870eb2;
    stim[3] = 66'h029f87be222546d22;
    stim[4] = 66'h172337a658881b2d6;
    stim[5] = 66'h115d1e6b7b193d401;
    stim[6] = 66'h003b3e706f9e02eee;
    stim[7] = 66'h1d7484eec4fca2b4d;
    stim[8] = 66'h06891bbbd044c0821;
    stim[9] = 66'h0debaaec2c745984a;
    stim[10] = 66'h0e116ea3861bc5331;
    stim[11] = 66'h086f1490e6ceeecce;
    stim[12] = 66'h1ed35b621adef109b;
    stim[13] = 66'h0bb4d1166d6d8cb1b;
    stim[14] = 66'h08aebf1967d9315c5;
    stim[15] = 66'h00ac18b1459c275aa;
    stim[16] = 66'h09e1a7c9d3f5cffd9;
    stim[17] = 66'h13d73bc033f8fe972;
    stim[18] = 66'h013f15d0549fcbba0;
    stim[19] = 66'h1a089deb593a5e79d;
    stim[20] = 66'h12cbee9a43c1db64c;
    stim[21] = 66'h10d53a8a410f05d4b;
    stim[22] = 66'h0ea00d448eab4873f;
    stim[23] = 66'h1b2a5709bda688aa1;
    stim[24] = 66'h018a5895ca34d340d;
    stim[25] = 66'h0682b21364db52b30;
    stim[26] = 66'h1afbd46515b9a1c19;
    stim[27] = 66'h16d4285de3e3cc241;
    stim[28] = 66'h15c8bec961db002e0;
    stim[29] = 66'h1cf8d2a5ef4d0a6a9;
    stim[30] = 66'h001b0341d639cfab1;
    stim[31] = 66'h0b69e5f5762c3ca5c;
    stim[32] = 66'h02a90fe85934e1fa7;
    stim[33] = 66'h08a0a563fc3eaec34;
    stim[34] = 66'h001c04977adf85e18;
    stim[35] = 66'h1956eabfab5c4b0c6;
    stim[36] = 66'h1bde54cb4ede1bb49;
    stim[37] = 66'h04705b3fa23a59ae1;
    stim[38] = 66'h03465c8bc36575ca9;
    stim[39] = 66'h136e6f0f04397305d;
    stim[40] = 66'h0099fa5c85011a816;
    stim[41] = 66'h1a2f641e2c4a6086e;
    stim[42] = 66'h04c50f75b632779ed;
    stim[43] = 66'h0f0899197f94a80a8;
    stim[44] = 66'h12401f8d32b7a6aad;
    stim[45] = 66'h04e562b0632db1277;
    stim[46] = 66'h19c3af36319188f36;
    stim[47] = 66'h1970683f0e67d2c6f;
    stim[48] = 66'h17959002fcd2fa2d2;
    stim[49] = 66'h38b9c46da97aa47b6;
    stim[50] = 66'h123d12139dc61f87d;
    stim[51] = 66'h1464313aa285c21eb;
    stim[52] = 66'h0285e90e7b48c95b2;
    stim[53] = 66'h0eee0c09cd3aa5081;
    stim[54] = 66'h1808594f3f8bea468;
    stim[55] = 66'h15a6e43da41c0d932;
    stim[56] = 66'h160d7743cd097e122;
    stim[57] = 66'h074bc16889cb166b0;
    stim[58] = 66'h1441581ca92a14709;
    stim[59] = 66'h0a6f81f65944133dc;
    stim[60] = 66'h1d535efa8e5396484;
    stim[61] = 66'h1560d78aa87f19675;
    stim[62] = 66'h0115fa81ec741c282;
    stim[63] = 66'h16624767c32ac090e;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h000000000;
      expv[6] = 34'h000000000;
      expv[7] = 34'h000000000;
      expv[8] = 34'h3ae909ddb;
      expv[9] = 34'h3ae909dd8;
      expv[10] = 34'h3ae909dd8;
      expv[11] = 34'h3ae909dd8;
      expv[12] = 34'h3ae909dd8;
      expv[13] = 34'h3ae909dd8;
      expv[14] = 34'h3ae909dda;
      expv[15] = 34'h3ae909dd8;
      expv[16] = 34'h3ae909dd8;
      expv[17] = 34'h3ae909dd8;
      expv[18] = 34'h3ae909dd8;
      expv[19] = 34'h3ae909dd8;
      expv[20] = 34'h3ae909dda;
      expv[21] = 34'h3ae909dd8;
      expv[22] = 34'h3ae909dd8;
      expv[23] = 34'h3ae909dd8;
      expv[24] = 34'h3654ae137;
      expv[25] = 34'h3654ae134;
      expv[26] = 34'h3654ae134;
      expv[27] = 34'h3654ae134;
      expv[28] = 34'h3654ae134;
      expv[29] = 34'h3654ae134;
      expv[30] = 34'h3654ae136;
      expv[31] = 34'h3654ae134;
      expv[32] = 34'h3654ae134;
      expv[33] = 34'h3654ae134;
      expv[34] = 34'h3654ae134;
      expv[35] = 34'h3654ae134;
      expv[36] = 34'h3654ae136;
      expv[37] = 34'h3654ae134;
      expv[38] = 34'h3654ae134;
      expv[39] = 34'h068cb917b;
      expv[40] = 34'h068cb9178;
      expv[41] = 34'h068cb9178;
      expv[42] = 34'h345ec83c7;
      expv[43] = 34'h345ec83c4;
      expv[44] = 34'h345ec83c4;
      expv[45] = 34'h345ec83c4;
      expv[46] = 34'h345ec83c4;
      expv[47] = 34'h345ec83c4;
      expv[48] = 34'h345ec83c6;
      expv[49] = 34'h000000000;
      expv[50] = 34'h000000000;
      expv[51] = 34'h000000000;
      expv[52] = 34'h000000000;
      expv[53] = 34'h050bd21cf;
      expv[54] = 34'h050bd21cc;
      expv[55] = 34'h050bd21cc;
      expv[56] = 34'h050bd21cc;
      expv[57] = 34'h050bd21cc;
      expv[58] = 34'h050bd21cc;
      expv[59] = 34'h050bd21ce;
      expv[60] = 34'h050bd21cc;
      expv[61] = 34'h050bd21cc;
      expv[62] = 34'h050bd21cc;
      expv[63] = 34'h050bd21cc;
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
