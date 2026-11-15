// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_014613 dut (
    .SW(in_vec[17:0]),
    .LEDR(out_vec[52:35]),
    .HEX4(out_vec[34:28]),
    .HEX3(out_vec[27:21]),
    .HEX2(out_vec[20:14]),
    .HEX1(out_vec[13:7]),
    .HEX0(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h234b6;
    stim[1] = 18'h3056a;
    stim[2] = 18'h0a297;
    stim[3] = 18'h11bbe;
    stim[4] = 18'h2432a;
    stim[5] = 18'h08471;
    stim[6] = 18'h2bfd5;
    stim[7] = 18'h11b12;
    stim[8] = 18'h0a571;
    stim[9] = 18'h195b7;
    stim[10] = 18'h38c2c;
    stim[11] = 18'h00f07;
    stim[12] = 18'h0f892;
    stim[13] = 18'h08a0d;
    stim[14] = 18'h06844;
    stim[15] = 18'h01437;
    stim[16] = 18'h38867;
    stim[17] = 18'h216bb;
    stim[18] = 18'h0a9b1;
    stim[19] = 18'h3138c;
    stim[20] = 18'h0ea8b;
    stim[21] = 18'h2d79a;
    stim[22] = 18'h009b5;
    stim[23] = 18'h09765;
    stim[24] = 18'h02112;
    stim[25] = 18'h31f6d;
    stim[26] = 18'h1aec3;
    stim[27] = 18'h19bc3;
    stim[28] = 18'h2c3f5;
    stim[29] = 18'h3f6d0;
    stim[30] = 18'h1ff72;
    stim[31] = 18'h39775;
    stim[32] = 18'h1d750;
    stim[33] = 18'h282f6;
    stim[34] = 18'h14bd5;
    stim[35] = 18'h0aab7;
    stim[36] = 18'h08239;
    stim[37] = 18'h1d735;
    stim[38] = 18'h22e54;
    stim[39] = 18'h1f8ec;
    stim[40] = 18'h3e5ee;
    stim[41] = 18'h039e8;
    stim[42] = 18'h3c1ba;
    stim[43] = 18'h28b44;
    stim[44] = 18'h32014;
    stim[45] = 18'h12ace;
    stim[46] = 18'h3b7b4;
    stim[47] = 18'h259ce;
    stim[48] = 18'h01abd;
    stim[49] = 18'h38ec3;
    stim[50] = 18'h003e0;
    stim[51] = 18'h1c0fd;
    stim[52] = 18'h2e8ae;
    stim[53] = 18'h28453;
    stim[54] = 18'h2d7fc;
    stim[55] = 18'h172f4;
    stim[56] = 18'h29604;
    stim[57] = 18'h27516;
    stim[58] = 18'h156df;
    stim[59] = 18'h0eaad;
    stim[60] = 18'h27ff2;
    stim[61] = 18'h1266e;
    stim[62] = 18'h324fe;
    stim[63] = 18'h156bd;
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
      expv[0] = 53'h11a5b244808130;
      expv[1] = 53'h182b5242449240;
      expv[2] = 53'h0514bf849e5224;
      expv[3] = 53'h08ddf7805e4902;
      expv[4] = 53'h12195793249219;
      expv[5] = 53'h04238f98093c82;
      expv[6] = 53'h15feaf8f090930;
      expv[7] = 53'h08d892449e4919;
      expv[8] = 53'h052b8f94890902;
      expv[9] = 53'h0cadb8205e3ca4;
      expv[10] = 53'h1c616028048cc0;
      expv[11] = 53'h00783c0f066078;
      expv[12] = 53'h07c4924f065224;
      expv[13] = 53'h0450692804a079;
      expv[14] = 53'h034220233e6019;
      expv[15] = 53'h00a1bf94900178;
      expv[16] = 53'h1c43399f267c40;
      expv[17] = 53'h10b5db049e1879;
      expv[18] = 53'h054d8f94864102;
      expv[19] = 53'h189c67905e4cf9;
      expv[20] = 53'h07545b00449279;
      expv[21] = 53'h16bcd3004c1212;
      expv[22] = 53'h004dac03208112;
      expv[23] = 53'h04bb292f2c0919;
      expv[24] = 53'h01089248065224;
      expv[25] = 53'h18fb6f82448979;
      expv[26] = 53'h0d761b080c1278;
      expv[27] = 53'h0cde1f880c3c92;
      expv[28] = 53'h161faf9f008919;
      expv[29] = 53'h1fb68306092078;
      expv[30] = 53'h0ffb9120493c78;
      expv[31] = 53'h1cbbab02408979;
      expv[32] = 53'h0eba8124900930;
      expv[33] = 53'h1417b796008140;
      expv[34] = 53'h0a5eaa42464978;
      expv[35] = 53'h0555bf84849202;
      expv[36] = 53'h0411cf981e6078;
      expv[37] = 53'h0eb9a990448930;
      expv[38] = 53'h1172a78f290ca4;
      expv[39] = 53'h0fc76302467c19;
      expv[40] = 53'h1f2f724f048102;
      expv[41] = 53'h01cf43033e0940;
      expv[42] = 53'h1e0dd4005e1219;
      expv[43] = 53'h145a2122500cc0;
      expv[44] = 53'h1900a408090ca4;
      expv[45] = 53'h09567790490930;
      expv[46] = 53'h1dbda300408cb0;
      expv[47] = 53'h12ce719f1e4112;
      expv[48] = 53'h00d5ef92493c12;
      expv[49] = 53'h1c761f86101840;
      expv[50] = 53'h001f040f3e0cc0;
      expv[51] = 53'h0e07eb0f048cc0;
      expv[52] = 53'h17457194848102;
      expv[53] = 53'h14229a4f291840;
      expv[54] = 53'h16bfe30f1e0c92;
      expv[55] = 53'h0b97a0233e3cb0;
      expv[56] = 53'h14b02308100cf9;
      expv[57] = 53'h13a8b243290178;
      expv[58] = 53'h0ab6fb0f049830;
      expv[59] = 53'h07556920449212;
      expv[60] = 53'h13ff978f009278;
      expv[61] = 53'h09337120491879;
      expv[62] = 53'h1927f2461e0124;
      expv[63] = 53'h0ab5ef82449824;
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
