// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_213694 dut (
    .in_A(in_vec[68:37]),
    .in_B(in_vec[36:5]),
    .mode(in_vec[4:2]),
    .enable(in_vec[1:1]),
    .carry_in(in_vec[0:0]),
    .carry_out(out_vec[33:33]),
    .out(out_vec[32:1]),
    .zero_flag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h09adcdb579ba0f1451;
    stim[1] = 69'h06edfe4acd6060a685;
    stim[2] = 69'h06908a22d80e3bf25b;
    stim[3] = 69'h11f7e54ab04a484da7;
    stim[4] = 69'h05f9facbf311255ea2;
    stim[5] = 69'h072017a61cfe3f77ad;
    stim[6] = 69'h19679c8a1ee6bc60cd;
    stim[7] = 69'h05f60b2392c089b690;
    stim[8] = 69'h00c3db5722e0619e8d;
    stim[9] = 69'h18a2e36971e2feec86;
    stim[10] = 69'h14d12c25599fee1377;
    stim[11] = 69'h030a35fc960c11e05d;
    stim[12] = 69'h0456d591452dab9f90;
    stim[13] = 69'h12451790ef222ad525;
    stim[14] = 69'h14e57fab83ac8764f8;
    stim[15] = 69'h173ab462a1a637881a;
    stim[16] = 69'h03cf177b6bb2f494e2;
    stim[17] = 69'h14641b56eee0f0af17;
    stim[18] = 69'h0ef1f25113b42f3da2;
    stim[19] = 69'h145d333394a2b6add5;
    stim[20] = 69'h05814caae1a35b2ce3;
    stim[21] = 69'h102403c0ff09695576;
    stim[22] = 69'h0bbb39fb9c7cd7e8be;
    stim[23] = 69'h0d501530fc333f7515;
    stim[24] = 69'h1b59e01f09ee994bcd;
    stim[25] = 69'h0c1b655ba0d4ca6627;
    stim[26] = 69'h1d9a30d2a969d2d69a;
    stim[27] = 69'h1459aeac970ba3b622;
    stim[28] = 69'h1b71ab3d9334243c99;
    stim[29] = 69'h06cb411710956d56bf;
    stim[30] = 69'h0b98822766c017c55e;
    stim[31] = 69'h0e501949c213e6af43;
    stim[32] = 69'h16ab94d716a262688d;
    stim[33] = 69'h081921ea12db831f4e;
    stim[34] = 69'h1337e650da647ba558;
    stim[35] = 69'h14f653f4301a7d4793;
    stim[36] = 69'h09c20708926f68767a;
    stim[37] = 69'h1424c5e3191895a9e2;
    stim[38] = 69'h080c5b953d8423777d;
    stim[39] = 69'h0dafef555e5ec3fd04;
    stim[40] = 69'h13f9ab270b96456bf4;
    stim[41] = 69'h1f3a9b93ceadbc782f;
    stim[42] = 69'h18352eae2cc76fc395;
    stim[43] = 69'h113d850df28d6c10d7;
    stim[44] = 69'h15c29a373dba6e9cdc;
    stim[45] = 69'h1dd06eb529ef897e50;
    stim[46] = 69'h0bebb2514817cef544;
    stim[47] = 69'h0f11e314ff48a8d810;
    stim[48] = 69'h03d8fc470a3a1852de;
    stim[49] = 69'h1bdf6ddd50146aa739;
    stim[50] = 69'h0670a6e42d4d946c2a;
    stim[51] = 69'h1f5b85eea23d0cc307;
    stim[52] = 69'h1b16f53cc2dd22b869;
    stim[53] = 69'h1075f28ff9393fd0e9;
    stim[54] = 69'h0bddfcf86eac6bac2d;
    stim[55] = 69'h1bd3fc4f558e585a6f;
    stim[56] = 69'h1a7271bcbd5164fb12;
    stim[57] = 69'h084de40a7a935b3384;
    stim[58] = 69'h0b3ca2ac9dede1145e;
    stim[59] = 69'h0b8b7593826218cf86;
    stim[60] = 69'h04a6b15eedf7d8fff9;
    stim[61] = 69'h1dbd8ba4c37d6be980;
    stim[62] = 69'h10aceb766ef9564240;
    stim[63] = 69'h13db5699da7851761a;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'h0e824e308;
      expv[3] = 34'h31ffed4fa;
      expv[4] = 34'h0111204aa;
      expv[5] = 34'h0111204aa;
      expv[6] = 34'h0111204aa;
      expv[7] = 34'h0111204aa;
      expv[8] = 34'h0111204aa;
      expv[9] = 34'h19e2ffede;
      expv[10] = 34'h2b2ed3daa;
      expv[11] = 34'h2b2ed3daa;
      expv[12] = 34'h2b2ed3daa;
      expv[13] = 34'h2b2ed3daa;
      expv[14] = 34'h2b2ed3daa;
      expv[15] = 34'h15947cdaa;
      expv[16] = 34'h038214106;
      expv[17] = 34'h2b9be4a90;
      expv[18] = 34'h02b022110;
      expv[19] = 34'h02b022110;
      expv[20] = 34'h21814828e;
      expv[21] = 34'h0fdbfc3f0;
      expv[22] = 34'h283811e42;
      expv[23] = 34'h283811e42;
      expv[24] = 34'h283811e42;
      expv[25] = 34'h2cdfef7fa;
      expv[26] = 34'h14305dfc2;
      expv[27] = 34'h1409a2a40;
      expv[28] = 34'h1409a2a40;
      expv[29] = 34'h1760ae6da;
      expv[30] = 34'h125899eca;
      expv[31] = 34'h221000094;
      expv[32] = 34'h221000094;
      expv[33] = 34'h103243d40;
      expv[34] = 34'h103243d40;
      expv[35] = 34'h3a7b29fa0;
      expv[36] = 34'h17529e922;
      expv[37] = 34'h100085a10;
      expv[38] = 34'h100085a10;
      expv[39] = 34'h100085a10;
      expv[40] = 34'h100085a10;
      expv[41] = 34'h3e753727a;
      expv[42] = 34'h3e753727a;
      expv[43] = 34'h2ec27af20;
      expv[44] = 34'h2ec27af20;
      expv[45] = 34'h2ec27af20;
      expv[46] = 34'h2ec27af20;
      expv[47] = 34'h2ec27af20;
      expv[48] = 34'h0e131499c;
      expv[49] = 34'h0e131499c;
      expv[50] = 34'h0b3d32880;
      expv[51] = 34'h3f7f8defa;
      expv[52] = 34'h3f7f8defa;
      expv[53] = 34'h3f7f8defa;
      expv[54] = 34'h3f7f8defa;
      expv[55] = 34'h37a7f89ea;
      expv[56] = 34'h2d3938de4;
      expv[57] = 34'h2d3938de4;
      expv[58] = 34'h292a83c0c;
      expv[59] = 34'h0beb7ddf8;
      expv[60] = 34'h0beb7ddf8;
      expv[61] = 34'h0beb7ddf8;
      expv[62] = 34'h0beb7ddf8;
      expv[63] = 34'h19630523c;
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
