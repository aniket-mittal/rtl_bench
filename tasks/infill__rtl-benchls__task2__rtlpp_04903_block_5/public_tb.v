// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 84;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04903 dut (
    .clk(clk),
    .iocs(in_vec[59:59]),
    .ioaddr(in_vec[58:56]),
    .din(in_vec[55:40]),
    .iowr(in_vec[39:39]),
    .iord(in_vec[38:38]),
    .rdix(in_vec[37:20]),
    .rdiy(in_vec[19:2]),
    .riv(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .dout(out_vec[83:68]),
    .pttout(out_vec[67:67]),
    .x(out_vec[66:51]),
    .y(out_vec[50:35]),
    .xyv(out_vec[34:34]),
    .m(out_vec[33:18]),
    .p(out_vec[17:6]),
    .mpv(out_vec[5:5]),
    .start(out_vec[4:4]),
    .sync(out_vec[3:3]),
    .dcd(out_vec[2:2]),
    .fcd(out_vec[1:1]),
    .xmtout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'h78002f86518b5cf;
    stim[1] = 60'hc19d5ed1107af19;
    stim[2] = 60'h81fbccd296915ce;
    stim[3] = 60'hadf6346f9bdeb50;
    stim[4] = 60'h38790f0e670a6ec;
    stim[5] = 60'h82c889b9ec4b744;
    stim[6] = 60'hc55d0e4cb34a1b2;
    stim[7] = 60'hea3fbaf3b4771ee;
    stim[8] = 60'hc3e15cc5a82f510;
    stim[9] = 60'hd7cde38962303fe;
    stim[10] = 60'h04f18e1a8447e82;
    stim[11] = 60'h1ec15d562f31338;
    stim[12] = 60'hd762b68012a9b18;
    stim[13] = 60'h9d534f86973c276;
    stim[14] = 60'h2ad860a9dceba7c;
    stim[15] = 60'h5d04bf4260a91d0;
    stim[16] = 60'ha732a04761e7dfc;
    stim[17] = 60'hd51ba10b4a0c40c;
    stim[18] = 60'hc650d3d74b7dc9c;
    stim[19] = 60'hc13c758810b5598;
    stim[20] = 60'h0509ba34c074956;
    stim[21] = 60'he62354c7b92637e;
    stim[22] = 60'h56e9d3a95d9680a;
    stim[23] = 60'hd528a148af8b6a6;
    stim[24] = 60'h0b06283802c3ac2;
    stim[25] = 60'h2ec1e88e1fb0d72;
    stim[26] = 60'h6b902c5d5200b3e;
    stim[27] = 60'hfeb85c4ff067eb4;
    stim[28] = 60'habfb8f78c0f0aa8;
    stim[29] = 60'h18ffbd7c93525ea;
    stim[30] = 60'h8b6e77b4d027536;
    stim[31] = 60'he4403fabc8e7dec;
    stim[32] = 60'he16d456f57be804;
    stim[33] = 60'ha8ea22c816f9a10;
    stim[34] = 60'h705a32ecdc9d68a;
    stim[35] = 60'hcd370c5191e242e;
    stim[36] = 60'hefdf083a63b43ee;
    stim[37] = 60'hd94e7463a4217ac;
    stim[38] = 60'h31c2e049a481510;
    stim[39] = 60'h2f3567d5f65874c;
    stim[40] = 60'h0997041c1da1f7c;
    stim[41] = 60'h6fedc2d18f9d0f6;
    stim[42] = 60'h6373204b0a37640;
    stim[43] = 60'h341e9637035cf34;
    stim[44] = 60'h5291935a3084972;
    stim[45] = 60'ha1ee15f7870f166;
    stim[46] = 60'h219b4cb3ca60608;
    stim[47] = 60'h5396d58bcc014f0;
    stim[48] = 60'hdee8dd74786465c;
    stim[49] = 60'hf8be294297684e0;
    stim[50] = 60'h5c75d7f2b27b62e;
    stim[51] = 60'hcb91812daa0ba34;
    stim[52] = 60'hfccc5beb7d4e1de;
    stim[53] = 60'h295531ce486abe0;
    stim[54] = 60'hb680924a2c604c6;
    stim[55] = 60'hf331b1d4342d9d0;
    stim[56] = 60'heca75958925e674;
    stim[57] = 60'he5866f138b403a8;
    stim[58] = 60'h9968d1c495eb10a;
    stim[59] = 60'h52a5b77514a8592;
    stim[60] = 60'h56634e4f8d5cc58;
    stim[61] = 60'h27f1a57ace08d98;
    stim[62] = 60'hc8f563af677846a;
    stim[63] = 60'h3fae37c3dc2de3e;
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
      expv[0] = 84'hxxxxxxxxxxxxx0000000x;
      expv[1] = 84'hxx00xxxxxxxxx0000000x;
      expv[2] = 84'hxxxxxxxxxxxxx0000000x;
      expv[3] = 84'h0000xxxxxxxxx0000000x;
      expv[4] = 84'h00002c6f000040000003x;
      expv[5] = 84'hx0002c6f00004b1bc003c;
      expv[6] = 84'h2c6f469180004b1bc003c;
      expv[7] = 84'h00004691800051a44003c;
      expv[8] = 84'h00004691800051a44003c;
      expv[9] = 84'h00004691800051a44003c;
      expv[10] = 84'h28004691800051a44003c;
      expv[11] = 84'h46910b9c800051a44003c;
      expv[12] = 84'h20000b9c800042e70003c;
      expv[13] = 84'h28000b9c800042e70003c;
      expv[14] = 84'h20007d72000042e70003c;
      expv[15] = 84'h0b9c7d7200005f5c8003c;
      expv[16] = 84'h28007d7200005f5c8003c;
      expv[17] = 84'h7d724afd00005f5c8003c;
      expv[18] = 84'h28004afd000052bf4003c;
      expv[19] = 84'h00004afd000052bf4003c;
      expv[20] = 84'h00004afd000052bf4003c;
      expv[21] = 84'h4afd4afd000052bf4003c;
      expv[22] = 84'h00004afd000052bf4003c;
      expv[23] = 84'h28004afd000052bf4003c;
      expv[24] = 84'h28004afd000052bf4003c;
      expv[25] = 84'h4afd4afd000052bf4003c;
      expv[26] = 84'h4afd4afd000052bf4003c;
      expv[27] = 84'h00004afd000052bf4003c;
      expv[28] = 84'h28004afd000052bf4003d;
      expv[29] = 84'h4afd4afd000052bf4003d;
      expv[30] = 84'h20002d41800052bf4003d;
      expv[31] = 84'h4afd2d4180004b504003d;
      expv[32] = 84'h00002d4180004b504003d;
      expv[33] = 84'h00002d4180004b504003d;
      expv[34] = 84'h2d410bc180004b504003d;
      expv[35] = 84'h28000bc1800042f04003d;
      expv[36] = 84'h00000bc1800042f04003d;
      expv[37] = 84'h00000bc1800042f04003d;
      expv[38] = 84'h28000bc1800042f04003d;
      expv[39] = 84'h20000bc1800042f04003d;
      expv[40] = 84'h0bc134b4000042f04003d;
      expv[41] = 84'h0bc134b400004d2d0003d;
      expv[42] = 84'h000034b400004d2d0003d;
      expv[43] = 84'h000034b400004d2d0003d;
      expv[44] = 84'h200034b400004d2d0003d;
      expv[45] = 84'h28002ea900004d2d0003d;
      expv[46] = 84'h34b42ea900004baa4003d;
      expv[47] = 84'h2ea92ea900004baa4003d;
      expv[48] = 84'h28002ea900004baa4003d;
      expv[49] = 84'h28005d9700004baa4003d;
      expv[50] = 84'h28005d9700005765c003c;
      expv[51] = 84'h28005d9700005765c003c;
      expv[52] = 84'h00005d9700005765c003c;
      expv[53] = 84'h28005d9700005765c003d;
      expv[54] = 84'h5d97029380005765c003d;
      expv[55] = 84'h20000293800040a4c003d;
      expv[56] = 84'h28005983000040a4c003d;
      expv[57] = 84'h0000598300005660c003d;
      expv[58] = 84'h0000647d80005660c003d;
      expv[59] = 84'h2000647d8000591f4003d;
      expv[60] = 84'h2800647d8000591f4003d;
      expv[61] = 84'h2800647d8000591f4003d;
      expv[62] = 84'h647d647d8000591f4003d;
      expv[63] = 84'h000069d80000591f4003d;
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
