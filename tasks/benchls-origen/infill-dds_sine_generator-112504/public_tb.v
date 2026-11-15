// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_112504 dut (
    .clk(clk),
    .rst(in_vec[65:65]),
    .en(in_vec[64:64]),
    .freq(in_vec[63:32]),
    .phase(in_vec[31:0]),
    .sin(out_vec[23:12]),
    .cos(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h26091642c5cd34328;
    stim[1] = 66'h2a865893ed8c677b1;
    stim[2] = 66'h0b6cf001d071133f3;
    stim[3] = 66'h13a6381d439bbb8bb;
    stim[4] = 66'h18b0d126c005e511b;
    stim[5] = 66'h0df37e11712c7c617;
    stim[6] = 66'h1cc54c08e00e097f0;
    stim[7] = 66'h02465d9826e966911;
    stim[8] = 66'h1c95e3705aed3ae14;
    stim[9] = 66'h1cf0b2ae69c5fb862;
    stim[10] = 66'h1c07ad60afce664dd;
    stim[11] = 66'h103d0d67dde257b9a;
    stim[12] = 66'h08fd9d62451dcd489;
    stim[13] = 66'h0cfcb878eb931e324;
    stim[14] = 66'h04d0bca9dd55a5479;
    stim[15] = 66'h0aa2e8cc3172865d9;
    stim[16] = 66'h02932b595737fa95a;
    stim[17] = 66'h0147d58dd012e00cc;
    stim[18] = 66'h03aa7d6c26a3f9f59;
    stim[19] = 66'h155286b43f8696883;
    stim[20] = 66'h07e6caf773f41038b;
    stim[21] = 66'h0f00659940ae6e0b6;
    stim[22] = 66'h02840e3ee48ce8992;
    stim[23] = 66'h1125565fd76686aa1;
    stim[24] = 66'h1865df47f511e57e5;
    stim[25] = 66'h1c34bc297a1a5b902;
    stim[26] = 66'h106ddeb0782c4968f;
    stim[27] = 66'h1e02b78de866bcf65;
    stim[28] = 66'h035206db9968d4a72;
    stim[29] = 66'h1ed159fc20e04e9a0;
    stim[30] = 66'h198a404d784f7b5ba;
    stim[31] = 66'h0a93c307cdbbf1e58;
    stim[32] = 66'h1a83999cfc103bf00;
    stim[33] = 66'h1812f6e42f80ed1c0;
    stim[34] = 66'h1a13047b6d0990790;
    stim[35] = 66'h121566fd63cca0d23;
    stim[36] = 66'h00957277654959a5e;
    stim[37] = 66'h1c9d539983865a5af;
    stim[38] = 66'h1aec07e06ff1e49e4;
    stim[39] = 66'h114d884edf83c2d3a;
    stim[40] = 66'h102187dcddd31c5a5;
    stim[41] = 66'h15fdeb8dc97f75695;
    stim[42] = 66'h1afd2202a61193610;
    stim[43] = 66'h05208da3bfc3d8f03;
    stim[44] = 66'h0cb33ef6f73ca9e53;
    stim[45] = 66'h02923cabb29fa71f0;
    stim[46] = 66'h1a1f8a913c1817162;
    stim[47] = 66'h0b6936979fafe02f7;
    stim[48] = 66'h1815fb5b7439569e9;
    stim[49] = 66'h3c6f47a38712695e1;
    stim[50] = 66'h04f2ffa49ec2c1738;
    stim[51] = 66'h1992e0f8cedc468c1;
    stim[52] = 66'h2a8871434d9e52656;
    stim[53] = 66'h1f0934da8e8199109;
    stim[54] = 66'h0a6f0302bf6224a1e;
    stim[55] = 66'h1f83b62b3088ebffb;
    stim[56] = 66'h1efb6994a6ce5ee5a;
    stim[57] = 66'h1ce965089d1a44a42;
    stim[58] = 66'h0c4c11b46d22718e4;
    stim[59] = 66'h13c9ee4345790446e;
    stim[60] = 66'h0ab556cf5971882e6;
    stim[61] = 66'h10c4c45f30efecc74;
    stim[62] = 66'h1d2f8062f81ff2c71;
    stim[63] = 66'h1c848156e20ce970c;
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
      expv[0] = 24'h000000;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'h000000;
      expv[4] = 24'h000000;
      expv[5] = 24'h7e613b;
      expv[6] = 24'h7e613b;
      expv[7] = 24'h7ee107;
      expv[8] = 24'h7ee107;
      expv[9] = 24'h81a13b;
      expv[10] = 24'h7fefe4;
      expv[11] = 24'he597d2;
      expv[12] = 24'h68b498;
      expv[13] = 24'h68b498;
      expv[14] = 24'h68b498;
      expv[15] = 24'h68b498;
      expv[16] = 24'h68b498;
      expv[17] = 24'h68b498;
      expv[18] = 24'h68b498;
      expv[19] = 24'h68b498;
      expv[20] = 24'h8311b4;
      expv[21] = 24'h8311b4;
      expv[22] = 24'h8311b4;
      expv[23] = 24'h8311b4;
      expv[24] = 24'hb61685;
      expv[25] = 24'h818ed4;
      expv[26] = 24'h975b68;
      expv[27] = 24'h067804;
      expv[28] = 24'h5f9550;
      expv[29] = 24'h5f9550;
      expv[30] = 24'h72139d;
      expv[31] = 24'hc1d904;
      expv[32] = 24'hc1d904;
      expv[33] = 24'he937de;
      expv[34] = 24'h86f293;
      expv[35] = 24'h8e5c57;
      expv[36] = 24'h13e7e5;
      expv[37] = 24'h13e7e5;
      expv[38] = 24'h3b9713;
      expv[39] = 24'h7702ef;
      expv[40] = 24'h80203e;
      expv[41] = 24'h44193c;
      expv[42] = 24'h53b9f5;
      expv[43] = 24'h5a05ae;
      expv[44] = 24'h5a05ae;
      expv[45] = 24'h5a05ae;
      expv[46] = 24'h5a05ae;
      expv[47] = 24'h7cfe49;
      expv[48] = 24'h7cfe49;
      expv[49] = 24'h000000;
      expv[50] = 24'h000000;
      expv[51] = 24'h000000;
      expv[52] = 24'h000000;
      expv[53] = 24'h000000;
      expv[54] = 24'h000000;
      expv[55] = 24'h000000;
      expv[56] = 24'hb926a7;
      expv[57] = 24'hea97e1;
      expv[58] = 24'h6e3bf2;
      expv[59] = 24'h6e3bf2;
      expv[60] = 24'h922bea;
      expv[61] = 24'h922bea;
      expv[62] = 24'hfbb7fd;
      expv[63] = 24'hd6f792;
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
