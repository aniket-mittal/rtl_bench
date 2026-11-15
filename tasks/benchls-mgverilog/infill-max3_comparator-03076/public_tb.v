// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 54;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03076 dut (
    .in0(in_vec[53:36]),
    .in1(in_vec[35:18]),
    .in2(in_vec[17:0]),
    .out0(out_vec[17:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 54'h0acc667681eadd;
    stim[1] = 54'h05ccde65d40cc1;
    stim[2] = 54'h06edd91fb4bc82;
    stim[3] = 54'h3f07a4addbd961;
    stim[4] = 54'h26ca0af9d75e09;
    stim[5] = 54'h07d4973dccca86;
    stim[6] = 54'h353bea727ecab6;
    stim[7] = 54'h131ddabd40a2c2;
    stim[8] = 54'h00336945e9d66c;
    stim[9] = 54'h175242e6dc8965;
    stim[10] = 54'h130e73b3a2eb98;
    stim[11] = 54'h2f2b3bb4355294;
    stim[12] = 54'h37a4cdda745f98;
    stim[13] = 54'h295dca40682116;
    stim[14] = 54'h09d81ea0570567;
    stim[15] = 54'h121158607871d2;
    stim[16] = 54'h04e4abbc516878;
    stim[17] = 54'h1752267c1ddabe;
    stim[18] = 54'h109d30fc558b0c;
    stim[19] = 54'h18ed042ff5e8bf;
    stim[20] = 54'h04d2b1a027bdf1;
    stim[21] = 54'h0817db461c8d85;
    stim[22] = 54'h18d41c42c2100f;
    stim[23] = 54'h292aaf4945c3df;
    stim[24] = 54'h165af5b466946d;
    stim[25] = 54'h0be52acbc81221;
    stim[26] = 54'h1b5a91717d63a1;
    stim[27] = 54'h3e8a21bc189956;
    stim[28] = 54'h07a112f33c33d6;
    stim[29] = 54'h143b87f8dd4e8c;
    stim[30] = 54'h2c668155683741;
    stim[31] = 54'h057915a07a4445;
    stim[32] = 54'h16cd930339c7f9;
    stim[33] = 54'h002d5b3528e1fc;
    stim[34] = 54'h3d1bb9f3b15436;
    stim[35] = 54'h38a392f6b3e9a4;
    stim[36] = 54'h173a472d34c1b0;
    stim[37] = 54'h13641a60fcd234;
    stim[38] = 54'h0001e538ecf9a2;
    stim[39] = 54'h0775ea87bf016c;
    stim[40] = 54'h364e5fa031f2fe;
    stim[41] = 54'h21296d5ab346c2;
    stim[42] = 54'h18592b2bc40092;
    stim[43] = 54'h1059fde820a383;
    stim[44] = 54'h064202ec1e8690;
    stim[45] = 54'h1f680b362c3ece;
    stim[46] = 54'h10aa47ad9686e2;
    stim[47] = 54'h1e0846d4745332;
    stim[48] = 54'h0be7304154ef72;
    stim[49] = 54'h12acabd0fca307;
    stim[50] = 54'h276585ca2ebf8b;
    stim[51] = 54'h319354654828ec;
    stim[52] = 54'h2c2606f84e9e37;
    stim[53] = 54'h2b2ab3a64417d5;
    stim[54] = 54'h37fbc49cbe4a99;
    stim[55] = 54'h3c03c0584653a1;
    stim[56] = 54'h108c9f5b895753;
    stim[57] = 54'h3a7110cfafa884;
    stim[58] = 54'h2607fcc6362726;
    stim[59] = 54'h0ba49f8e8dabd9;
    stim[60] = 54'h2848b1f84ba775;
    stim[61] = 54'h2aee2c7bdfa308;
    stim[62] = 54'h1cd83b8db09a3d;
    stim[63] = 54'h13d1ee214b0bf2;
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
      expv[0] = 18'h1eadd;
      expv[1] = 18'h05ccd;
      expv[2] = 18'h0bc82;
      expv[3] = 18'h12b76;
      expv[4] = 18'h35e09;
      expv[5] = 18'h1cf73;
      expv[6] = 18'h353be;
      expv[7] = 18'h131dd;
      expv[8] = 18'h1d66c;
      expv[9] = 18'h17524;
      expv[10] = 18'h130e7;
      expv[11] = 18'h15294;
      expv[12] = 18'h05f98;
      expv[13] = 18'h02116;
      expv[14] = 18'h09d81;
      expv[15] = 18'h12115;
      expv[16] = 18'h16878;
      expv[17] = 18'h1dabe;
      expv[18] = 18'h18b0c;
      expv[19] = 18'h1e8bf;
      expv[20] = 18'h06809;
      expv[21] = 18'h08d85;
      expv[22] = 18'h18d41;
      expv[23] = 18'h1c3df;
      expv[24] = 18'h16d19;
      expv[25] = 18'h0be52;
      expv[26] = 18'h1b5a9;
      expv[27] = 18'h09956;
      expv[28] = 18'h0bccf;
      expv[29] = 18'h1fe37;
      expv[30] = 18'h0555a;
      expv[31] = 18'h1681e;
      expv[32] = 18'h1c7f9;
      expv[33] = 18'h0e1fc;
      expv[34] = 18'h15436;
      expv[35] = 18'h0bdac;
      expv[36] = 18'h1cb4d;
      expv[37] = 18'h13641;
      expv[38] = 18'h14e3b;
      expv[39] = 18'h0775e;
      expv[40] = 18'h1f2fe;
      expv[41] = 18'h356ac;
      expv[42] = 18'h18592;
      expv[43] = 18'h1059f;
      expv[44] = 18'h0bb07;
      expv[45] = 18'h1f680;
      expv[46] = 18'h1eb65;
      expv[47] = 18'h1e084;
      expv[48] = 18'h0ef72;
      expv[49] = 18'h12aca;
      expv[50] = 18'h1728b;
      expv[51] = 18'h11952;
      expv[52] = 18'h1be13;
      expv[53] = 18'h0e991;
      expv[54] = 18'h1272f;
      expv[55] = 18'h01611;
      expv[56] = 18'h15753;
      expv[57] = 18'h033eb;
      expv[58] = 18'h3318d;
      expv[59] = 18'h1abd9;
      expv[60] = 18'h07e12;
      expv[61] = 18'h3a308;
      expv[62] = 18'h1cd83;
      expv[63] = 18'h13d1e;
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
