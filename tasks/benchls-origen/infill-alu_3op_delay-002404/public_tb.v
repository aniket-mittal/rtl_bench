// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_002404 dut (
    .DATA1(in_vec[18:11]),
    .DATA2(in_vec[10:3]),
    .SELECT(in_vec[2:0]),
    .RESULT(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h4ca32;
    stim[1] = 19'h65989;
    stim[2] = 19'h4520c;
    stim[3] = 19'h37005;
    stim[4] = 19'h23d3e;
    stim[5] = 19'h682c1;
    stim[6] = 19'h6aa9f;
    stim[7] = 19'h4c64c;
    stim[8] = 19'h7e9b1;
    stim[9] = 19'h2f47c;
    stim[10] = 19'h1187d;
    stim[11] = 19'h259a9;
    stim[12] = 19'h32120;
    stim[13] = 19'h1c6c6;
    stim[14] = 19'h5fce1;
    stim[15] = 19'h39507;
    stim[16] = 19'h594f6;
    stim[17] = 19'h53cad;
    stim[18] = 19'h56059;
    stim[19] = 19'h7840a;
    stim[20] = 19'h313c5;
    stim[21] = 19'h5a8aa;
    stim[22] = 19'h00790;
    stim[23] = 19'h07231;
    stim[24] = 19'h43c94;
    stim[25] = 19'h51253;
    stim[26] = 19'h12ca4;
    stim[27] = 19'h17b3f;
    stim[28] = 19'h328dc;
    stim[29] = 19'h47f85;
    stim[30] = 19'h44606;
    stim[31] = 19'h7fac0;
    stim[32] = 19'h138c6;
    stim[33] = 19'h584e3;
    stim[34] = 19'h6dcc8;
    stim[35] = 19'h3b227;
    stim[36] = 19'h4d109;
    stim[37] = 19'h29ee5;
    stim[38] = 19'h5c4f9;
    stim[39] = 19'h5a00d;
    stim[40] = 19'h06b4c;
    stim[41] = 19'h2f10d;
    stim[42] = 19'h5e242;
    stim[43] = 19'h738d2;
    stim[44] = 19'h76b58;
    stim[45] = 19'h56ff5;
    stim[46] = 19'h4e420;
    stim[47] = 19'h4f8d2;
    stim[48] = 19'h353e2;
    stim[49] = 19'h68513;
    stim[50] = 19'h44cdd;
    stim[51] = 19'h7cf90;
    stim[52] = 19'h16718;
    stim[53] = 19'h6e1a9;
    stim[54] = 19'h59e3f;
    stim[55] = 19'h25ac0;
    stim[56] = 19'h3209b;
    stim[57] = 19'h145ab;
    stim[58] = 19'h029ac;
    stim[59] = 19'h7a627;
    stim[60] = 19'h5a1ac;
    stim[61] = 19'h5b931;
    stim[62] = 19'h42fc6;
    stim[63] = 19'h2038e;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h00;
      expv[2] = 8'hfc;
      expv[3] = 8'hfc;
      expv[4] = 8'hfc;
      expv[5] = 8'hfc;
      expv[6] = 8'h28;
      expv[7] = 8'h28;
      expv[8] = 8'h28;
      expv[9] = 8'h33;
      expv[10] = 8'h33;
      expv[11] = 8'h33;
      expv[12] = 8'h80;
      expv[13] = 8'h24;
      expv[14] = 8'h24;
      expv[15] = 8'h5b;
      expv[16] = 8'h5b;
      expv[17] = 8'h5b;
      expv[18] = 8'h5b;
      expv[19] = 8'hb7;
      expv[20] = 8'h80;
      expv[21] = 8'h80;
      expv[22] = 8'h15;
      expv[23] = 8'hf2;
      expv[24] = 8'h54;
      expv[25] = 8'h54;
      expv[26] = 8'hea;
      expv[27] = 8'hea;
      expv[28] = 8'hea;
      expv[29] = 8'hea;
      expv[30] = 8'hea;
      expv[31] = 8'hea;
      expv[32] = 8'h58;
      expv[33] = 8'h58;
      expv[34] = 8'hbc;
      expv[35] = 8'h99;
      expv[36] = 8'h99;
      expv[37] = 8'hbb;
      expv[38] = 8'hbb;
      expv[39] = 8'h57;
      expv[40] = 8'h57;
      expv[41] = 8'h57;
      expv[42] = 8'h57;
      expv[43] = 8'h08;
      expv[44] = 8'h02;
      expv[45] = 8'h6b;
      expv[46] = 8'h6b;
      expv[47] = 8'h84;
      expv[48] = 8'h1a;
      expv[49] = 8'h68;
      expv[50] = 8'hf2;
      expv[51] = 8'hf2;
      expv[52] = 8'hf2;
      expv[53] = 8'he3;
      expv[54] = 8'h11;
      expv[55] = 8'h11;
      expv[56] = 8'h58;
      expv[57] = 8'h77;
      expv[58] = 8'hbd;
      expv[59] = 8'hbd;
      expv[60] = 8'hbd;
      expv[61] = 8'hbd;
      expv[62] = 8'hdd;
      expv[63] = 8'hdd;
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
