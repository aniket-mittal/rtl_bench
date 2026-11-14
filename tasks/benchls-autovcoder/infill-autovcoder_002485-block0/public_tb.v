// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002485 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .bus_in(in_vec[31:0]),
    .bus_A(out_vec[73:42]),
    .bus_out(out_vec[41:10]),
    .bus_WE(out_vec[9:9]),
    .bus_RE(out_vec[8:8]),
    .current_opcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h14dbd712b;
    stim[1] = 33'h1d5f6252b;
    stim[2] = 33'h0e617c89b;
    stim[3] = 33'h09ad91219;
    stim[4] = 33'h02d1002bf;
    stim[5] = 33'h0fe722cff;
    stim[6] = 33'h05cf22ffb;
    stim[7] = 33'h03be20598;
    stim[8] = 33'h06ff5a09b;
    stim[9] = 33'h094fe822f;
    stim[10] = 33'h0aec33db7;
    stim[11] = 33'h0058c6aad;
    stim[12] = 33'h024afc273;
    stim[13] = 33'h0b15163ab;
    stim[14] = 33'h086a278a9;
    stim[15] = 33'h0a6be603e;
    stim[16] = 33'h0971c819a;
    stim[17] = 33'h0d7860534;
    stim[18] = 33'h05efb6cd5;
    stim[19] = 33'h0a45e0b6d;
    stim[20] = 33'h01fb48578;
    stim[21] = 33'h08a8bd16a;
    stim[22] = 33'h0caf47cf4;
    stim[23] = 33'h01d4f9cd1;
    stim[24] = 33'h029097eab;
    stim[25] = 33'h0c9fc5f2d;
    stim[26] = 33'h0798f026e;
    stim[27] = 33'h06e9b95bd;
    stim[28] = 33'h09b9d5a2e;
    stim[29] = 33'h010e04291;
    stim[30] = 33'h093eff970;
    stim[31] = 33'h055d8b398;
    stim[32] = 33'h0d1576f4a;
    stim[33] = 33'h07695b205;
    stim[34] = 33'h0e192f6bb;
    stim[35] = 33'h00c8ae034;
    stim[36] = 33'h047c6ec58;
    stim[37] = 33'h000f04897;
    stim[38] = 33'h0424f00c9;
    stim[39] = 33'h08680d04f;
    stim[40] = 33'h0e4a4c9e7;
    stim[41] = 33'h0410ec73c;
    stim[42] = 33'h06c3571ea;
    stim[43] = 33'h0a388de95;
    stim[44] = 33'h05f2523ff;
    stim[45] = 33'h06cfb8672;
    stim[46] = 33'h083d535f6;
    stim[47] = 33'h013124df2;
    stim[48] = 33'h013e00f7a;
    stim[49] = 33'h0b6246650;
    stim[50] = 33'h05113e151;
    stim[51] = 33'h03765020c;
    stim[52] = 33'h0b39f1d95;
    stim[53] = 33'h0223e611c;
    stim[54] = 33'h094121707;
    stim[55] = 33'h0a90389e9;
    stim[56] = 33'h0e3f60d7c;
    stim[57] = 33'h0f327d252;
    stim[58] = 33'h0764a4762;
    stim[59] = 33'h043f82d2d;
    stim[60] = 33'h095ca439a;
    stim[61] = 33'h0493a3e23;
    stim[62] = 33'h01183f543;
    stim[63] = 33'h03bfe7557;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h00000000xxxxxxxxxxx;
      expv[2] = 74'h00000000xxxxxxxxx2b;
      expv[3] = 74'h00000000xxxxxxxxx9b;
      expv[4] = 74'h00000000xxxxxxxxx9b;
      expv[5] = 74'hxxxxxxxxxxxxxxxxx9b;
      expv[6] = 74'h00000000xxxxxxxxx9b;
      expv[7] = 74'h00000000xxxxxxxxx9b;
      expv[8] = 74'h00000000xxxxxxxxx98;
      expv[9] = 74'h00000000xxxxxxxxx98;
      expv[10] = 74'hxxxxxxxxxxxxxxxxx98;
      expv[11] = 74'h00000000xxxxxxxxx98;
      expv[12] = 74'h00000000xxxxxxxxx98;
      expv[13] = 74'h00000000xxxxxxxxx73;
      expv[14] = 74'h00000000xxxxxxxxx73;
      expv[15] = 74'hxxxxxxxxxxxxxxxxx73;
      expv[16] = 74'h00000000xxxxxxxxx73;
      expv[17] = 74'h00000000xxxxxxxxx73;
      expv[18] = 74'h00000000xxxxxxxxx34;
      expv[19] = 74'h00000000xxxxxxxxx34;
      expv[20] = 74'hxxxxxxxxxxxxxxxxx34;
      expv[21] = 74'h00000000xxxxxxxxx34;
      expv[22] = 74'h00000001xxxxxxxxx34;
      expv[23] = 74'h00000000xxxxxxxxxf4;
      expv[24] = 74'h00000000xxxxxxxxxf4;
      expv[25] = 74'hxxxxxxxxxxxxxxxxxf4;
      expv[26] = 74'h00000000xxxxxxxxxf4;
      expv[27] = 74'h00000001xxxxxxxxxf4;
      expv[28] = 74'h00000000xxxxxxxxxbd;
      expv[29] = 74'h00000000xxxxxxxxxbd;
      expv[30] = 74'hxxxxxxxxxxxxxxxxxbd;
      expv[31] = 74'h00000000xxxxxxxxxbd;
      expv[32] = 74'h00000001xxxxxxxxxbd;
      expv[33] = 74'h00000000xxxxxxxxx4a;
      expv[34] = 74'h00000000xxxxxxxxx4a;
      expv[35] = 74'hxxxxxxxxxxxxxxxxx4a;
      expv[36] = 74'h00000000xxxxxxxxx4a;
      expv[37] = 74'h00000001xxxxxxxxx4a;
      expv[38] = 74'h00000000xxxxxxxxx97;
      expv[39] = 74'h00000000xxxxxxxxx97;
      expv[40] = 74'hxxxxxxxxxxxxxxxxx97;
      expv[41] = 74'h00000000xxxxxxxxx97;
      expv[42] = 74'h00000001xxxxxxxxx97;
      expv[43] = 74'h00000000xxxxxxxxxea;
      expv[44] = 74'h00000000xxxxxxxxxea;
      expv[45] = 74'hxxxxxxxxxxxxxxxxxea;
      expv[46] = 74'h00000000xxxxxxxxxea;
      expv[47] = 74'h00000002xxxxxxxxxea;
      expv[48] = 74'h00000000xxxxxxxxxf2;
      expv[49] = 74'h00000000xxxxxxxxxf2;
      expv[50] = 74'hxxxxxxxxxxxxxxxxxf2;
      expv[51] = 74'h00000000xxxxxxxxxf2;
      expv[52] = 74'h00000002xxxxxxxxxf2;
      expv[53] = 74'h00000000xxxxxxxxx95;
      expv[54] = 74'h00000000xxxxxxxxx95;
      expv[55] = 74'hxxxxxxxxxxxxxxxxx95;
      expv[56] = 74'h00000000xxxxxxxxx95;
      expv[57] = 74'h00000002xxxxxxxxx95;
      expv[58] = 74'h00000000xxxxxxxxx52;
      expv[59] = 74'h00000000xxxxxxxxx52;
      expv[60] = 74'hxxxxxxxxxxxxxxxxx52;
      expv[61] = 74'h00000000xxxxxxxxx52;
      expv[62] = 74'h00000002xxxxxxxxx52;
      expv[63] = 74'h00000000xxxxxxxxx43;
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
