// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_010165 dut (
    .clock_out(clk),
    .io_push_valid(in_vec[24:24]),
    .io_push_payload_data(in_vec[23:8]),
    .io_push_payload_context_context(in_vec[7:3]),
    .io_pop_ready(in_vec[2:2]),
    .io_flush(in_vec[1:1]),
    .clockCtrl_systemReset(in_vec[0:0]),
    .io_push_ready(out_vec[24:24]),
    .io_pop_valid(out_vec[23:23]),
    .io_pop_payload_data(out_vec[22:7]),
    .io_pop_payload_context_context(out_vec[6:2]),
    .io_occupancy(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h0530e23;
    stim[1] = 25'h18573c5;
    stim[2] = 25'h0b5ce8a;
    stim[3] = 25'h0c32ed0;
    stim[4] = 25'h18ebc18;
    stim[5] = 25'h0f3bf10;
    stim[6] = 25'h01be264;
    stim[7] = 25'h1470800;
    stim[8] = 25'h0485948;
    stim[9] = 25'h0200706;
    stim[10] = 25'h0d52754;
    stim[11] = 25'h195a72a;
    stim[12] = 25'h05cf226;
    stim[13] = 25'h049e0ac;
    stim[14] = 25'h1729e82;
    stim[15] = 25'h1095a76;
    stim[16] = 25'h029a068;
    stim[17] = 25'h06ade42;
    stim[18] = 25'h103a3de;
    stim[19] = 25'h0488836;
    stim[20] = 25'h009702e;
    stim[21] = 25'h09bbb6a;
    stim[22] = 25'h106a9aa;
    stim[23] = 25'h17f62fa;
    stim[24] = 25'h1802a0a;
    stim[25] = 25'h11eaf0a;
    stim[26] = 25'h005c31a;
    stim[27] = 25'h0a533c8;
    stim[28] = 25'h1f540d6;
    stim[29] = 25'h046b9f2;
    stim[30] = 25'h099a920;
    stim[31] = 25'h1c4149e;
    stim[32] = 25'h19787a4;
    stim[33] = 25'h1b4c734;
    stim[34] = 25'h1ffd3e2;
    stim[35] = 25'h10c010c;
    stim[36] = 25'h061e04e;
    stim[37] = 25'h0f1cc14;
    stim[38] = 25'h15ab8cc;
    stim[39] = 25'h044d708;
    stim[40] = 25'h1fe2880;
    stim[41] = 25'h1d71868;
    stim[42] = 25'h06bf03e;
    stim[43] = 25'h0557d7a;
    stim[44] = 25'h0f1936c;
    stim[45] = 25'h01cfb52;
    stim[46] = 25'h142a652;
    stim[47] = 25'h08d4938;
    stim[48] = 25'h1dcc912;
    stim[49] = 25'h118d1d6;
    stim[50] = 25'h099d00b;
    stim[51] = 25'h12d115c;
    stim[52] = 25'h0d87a24;
    stim[53] = 25'h0e8f86e;
    stim[54] = 25'h1549efe;
    stim[55] = 25'h1c34552;
    stim[56] = 25'h033cf96;
    stim[57] = 25'h0f18718;
    stim[58] = 25'h0aafec0;
    stim[59] = 25'h104e018;
    stim[60] = 25'h152cb60;
    stim[61] = 25'h03ac0ce;
    stim[62] = 25'h1a7096c;
    stim[63] = 25'h1919dca;
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
      expv[0] = 25'hx29871x;
      expv[1] = 25'h1c2b9e0;
      expv[2] = 25'h15ae744;
      expv[3] = 25'h1619768;
      expv[4] = 25'h1c75e0c;
      expv[5] = 25'h1c75e0d;
      expv[6] = 25'h1c75e0d;
      expv[7] = 25'h1a38400;
      expv[8] = 25'h1a38401;
      expv[9] = 25'h1a38401;
      expv[10] = 25'h16a93a8;
      expv[11] = 25'h1cad394;
      expv[12] = 25'h12e7910;
      expv[13] = 25'h124f054;
      expv[14] = 25'h1b94f40;
      expv[15] = 25'h184ad38;
      expv[16] = 25'h114d034;
      expv[17] = 25'h1356f20;
      expv[18] = 25'h181d1ec;
      expv[19] = 25'h1244418;
      expv[20] = 25'h104b814;
      expv[21] = 25'h14dddb4;
      expv[22] = 25'h18354d4;
      expv[23] = 25'h1bfb17c;
      expv[24] = 25'h1c01504;
      expv[25] = 25'h18f5784;
      expv[26] = 25'h102e18c;
      expv[27] = 25'h15299e4;
      expv[28] = 25'h1faa068;
      expv[29] = 25'h1235cf8;
      expv[30] = 25'h14cd490;
      expv[31] = 25'h1e20a4c;
      expv[32] = 25'h1cbc3d0;
      expv[33] = 25'h1da6398;
      expv[34] = 25'h1ffe9f0;
      expv[35] = 25'h1860084;
      expv[36] = 25'h130f024;
      expv[37] = 25'h178e608;
      expv[38] = 25'h1ad5c64;
      expv[39] = 25'h1226b84;
      expv[40] = 25'h1ff1440;
      expv[41] = 25'h1ff1441;
      expv[42] = 25'h0ff1442;
      expv[43] = 25'h12abebc;
      expv[44] = 25'h178c9b4;
      expv[45] = 25'h10e7da8;
      expv[46] = 25'h1a15328;
      expv[47] = 25'h146a49c;
      expv[48] = 25'h1ee6488;
      expv[49] = 25'h18c68e8;
      expv[50] = 25'h14ce804;
      expv[51] = 25'h19688ac;
      expv[52] = 25'h16c3d10;
      expv[53] = 25'h1747c34;
      expv[54] = 25'h1aa4f7c;
      expv[55] = 25'h1e1a2a8;
      expv[56] = 25'h119e7c8;
      expv[57] = 25'h178c38c;
      expv[58] = 25'h1557f60;
      expv[59] = 25'h182700c;
      expv[60] = 25'h182700d;
      expv[61] = 25'h082700e;
      expv[62] = 25'h1d384b4;
      expv[63] = 25'h1c8cee4;
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
