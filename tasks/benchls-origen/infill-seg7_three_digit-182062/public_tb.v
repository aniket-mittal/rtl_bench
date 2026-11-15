// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_182062 dut (
    .hundreds(in_vec[11:8]),
    .tens(in_vec[7:4]),
    .ones(in_vec[3:0]),
    .display_0(out_vec[20:14]),
    .display_1(out_vec[13:7]),
    .display_2(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h846;
    stim[1] = 12'h084;
    stim[2] = 12'h0d6;
    stim[3] = 12'h4a6;
    stim[4] = 12'hb5e;
    stim[5] = 12'h903;
    stim[6] = 12'h4d3;
    stim[7] = 12'hc6a;
    stim[8] = 12'h3c3;
    stim[9] = 12'h79a;
    stim[10] = 12'h59d;
    stim[11] = 12'h970;
    stim[12] = 12'hb05;
    stim[13] = 12'h15c;
    stim[14] = 12'h6c6;
    stim[15] = 12'h0be;
    stim[16] = 12'heac;
    stim[17] = 12'h28a;
    stim[18] = 12'h685;
    stim[19] = 12'h7c0;
    stim[20] = 12'he6d;
    stim[21] = 12'h723;
    stim[22] = 12'h405;
    stim[23] = 12'he42;
    stim[24] = 12'h999;
    stim[25] = 12'h6dc;
    stim[26] = 12'h438;
    stim[27] = 12'h9b5;
    stim[28] = 12'hbc8;
    stim[29] = 12'h016;
    stim[30] = 12'hdb6;
    stim[31] = 12'h3a6;
    stim[32] = 12'h4fb;
    stim[33] = 12'h72e;
    stim[34] = 12'h6c9;
    stim[35] = 12'hf44;
    stim[36] = 12'h32b;
    stim[37] = 12'h49d;
    stim[38] = 12'h139;
    stim[39] = 12'h4e1;
    stim[40] = 12'h45b;
    stim[41] = 12'ha6b;
    stim[42] = 12'h05b;
    stim[43] = 12'h962;
    stim[44] = 12'h8f6;
    stim[45] = 12'h5e3;
    stim[46] = 12'hdff;
    stim[47] = 12'h6e7;
    stim[48] = 12'hd74;
    stim[49] = 12'h53d;
    stim[50] = 12'h08f;
    stim[51] = 12'h47f;
    stim[52] = 12'h190;
    stim[53] = 12'ha3d;
    stim[54] = 12'hcd5;
    stim[55] = 12'h4bb;
    stim[56] = 12'hfa2;
    stim[57] = 12'haea;
    stim[58] = 12'h091;
    stim[59] = 12'h07a;
    stim[60] = 12'ha41;
    stim[61] = 12'hec8;
    stim[62] = 12'h90a;
    stim[63] = 12'hb7e;
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
      expv[0] = 21'h008c80;
      expv[1] = 21'h064040;
      expv[2] = 21'h00bfc0;
      expv[3] = 21'h00bf99;
      expv[4] = 21'h1fc97f;
      expv[5] = 21'h0c2018;
      expv[6] = 21'h0c3f99;
      expv[7] = 21'h1fc17f;
      expv[8] = 21'h0c3fb0;
      expv[9] = 21'h1fcc78;
      expv[10] = 21'h1fcc12;
      expv[11] = 21'h103c18;
      expv[12] = 21'h04a07f;
      expv[13] = 21'h1fc979;
      expv[14] = 21'h00bf82;
      expv[15] = 21'h1fffc0;
      expv[16] = 21'h1fffff;
      expv[17] = 21'h1fc024;
      expv[18] = 21'h048002;
      expv[19] = 21'h103ff8;
      expv[20] = 21'h1fc17f;
      expv[21] = 21'h0c1278;
      expv[22] = 21'h04a019;
      expv[23] = 21'h090cff;
      expv[24] = 21'h060c18;
      expv[25] = 21'h1fff82;
      expv[26] = 21'h001819;
      expv[27] = 21'h04bf98;
      expv[28] = 21'h003fff;
      expv[29] = 21'h00bcc0;
      expv[30] = 21'h00bfff;
      expv[31] = 21'h00bfb0;
      expv[32] = 21'h1fff99;
      expv[33] = 21'h1fd278;
      expv[34] = 21'h063f82;
      expv[35] = 21'h064cff;
      expv[36] = 21'h1fd230;
      expv[37] = 21'h1fcc19;
      expv[38] = 21'h061879;
      expv[39] = 21'h1e7f99;
      expv[40] = 21'h1fc919;
      expv[41] = 21'h1fc17f;
      expv[42] = 21'h1fc940;
      expv[43] = 21'h090118;
      expv[44] = 21'h00bf80;
      expv[45] = 21'h0c3f92;
      expv[46] = 21'h1fffff;
      expv[47] = 21'h1e3f82;
      expv[48] = 21'h067c7f;
      expv[49] = 21'h1fd812;
      expv[50] = 21'h1fc040;
      expv[51] = 21'h1ffc19;
      expv[52] = 21'h100c79;
      expv[53] = 21'h1fd87f;
      expv[54] = 21'h04bfff;
      expv[55] = 21'h1fff99;
      expv[56] = 21'h093fff;
      expv[57] = 21'h1fffff;
      expv[58] = 21'h1e4c40;
      expv[59] = 21'h1ffc40;
      expv[60] = 21'h1e4cff;
      expv[61] = 21'h003fff;
      expv[62] = 21'h1fe018;
      expv[63] = 21'h1ffc7f;
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
