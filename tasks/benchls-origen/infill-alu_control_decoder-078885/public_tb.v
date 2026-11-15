// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_078885 dut (
    .nfuncao(in_vec[6:1]),
    .onOP(in_vec[0:0]),
    .controle(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h16;
    stim[1] = 7'h64;
    stim[2] = 7'h75;
    stim[3] = 7'h67;
    stim[4] = 7'h20;
    stim[5] = 7'h70;
    stim[6] = 7'h75;
    stim[7] = 7'h26;
    stim[8] = 7'h4f;
    stim[9] = 7'h02;
    stim[10] = 7'h08;
    stim[11] = 7'h03;
    stim[12] = 7'h35;
    stim[13] = 7'h15;
    stim[14] = 7'h75;
    stim[15] = 7'h03;
    stim[16] = 7'h1e;
    stim[17] = 7'h28;
    stim[18] = 7'h78;
    stim[19] = 7'h74;
    stim[20] = 7'h20;
    stim[21] = 7'h75;
    stim[22] = 7'h01;
    stim[23] = 7'h39;
    stim[24] = 7'h6e;
    stim[25] = 7'h55;
    stim[26] = 7'h33;
    stim[27] = 7'h5d;
    stim[28] = 7'h31;
    stim[29] = 7'h61;
    stim[30] = 7'h1b;
    stim[31] = 7'h31;
    stim[32] = 7'h03;
    stim[33] = 7'h74;
    stim[34] = 7'h07;
    stim[35] = 7'h12;
    stim[36] = 7'h30;
    stim[37] = 7'h31;
    stim[38] = 7'h7a;
    stim[39] = 7'h65;
    stim[40] = 7'h24;
    stim[41] = 7'h4b;
    stim[42] = 7'h00;
    stim[43] = 7'h5f;
    stim[44] = 7'h7e;
    stim[45] = 7'h03;
    stim[46] = 7'h04;
    stim[47] = 7'h4a;
    stim[48] = 7'h46;
    stim[49] = 7'h4d;
    stim[50] = 7'h2d;
    stim[51] = 7'h13;
    stim[52] = 7'h59;
    stim[53] = 7'h25;
    stim[54] = 7'h6d;
    stim[55] = 7'h56;
    stim[56] = 7'h3f;
    stim[57] = 7'h76;
    stim[58] = 7'h37;
    stim[59] = 7'h48;
    stim[60] = 7'h4f;
    stim[61] = 7'h29;
    stim[62] = 7'h43;
    stim[63] = 7'h6c;
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
      expv[0] = 4'hx;
      expv[1] = 4'hx;
      expv[2] = 4'hx;
      expv[3] = 4'hx;
      expv[4] = 4'hx;
      expv[5] = 4'hx;
      expv[6] = 4'hx;
      expv[7] = 4'hx;
      expv[8] = 4'hx;
      expv[9] = 4'hx;
      expv[10] = 4'hx;
      expv[11] = 4'h0;
      expv[12] = 4'hx;
      expv[13] = 4'h5;
      expv[14] = 4'hx;
      expv[15] = 4'h0;
      expv[16] = 4'hx;
      expv[17] = 4'hx;
      expv[18] = 4'hx;
      expv[19] = 4'hx;
      expv[20] = 4'hx;
      expv[21] = 4'hx;
      expv[22] = 4'h0;
      expv[23] = 4'hx;
      expv[24] = 4'hx;
      expv[25] = 4'hx;
      expv[26] = 4'hx;
      expv[27] = 4'hx;
      expv[28] = 4'hx;
      expv[29] = 4'hx;
      expv[30] = 4'h7;
      expv[31] = 4'hx;
      expv[32] = 4'h0;
      expv[33] = 4'hx;
      expv[34] = 4'h1;
      expv[35] = 4'hx;
      expv[36] = 4'hx;
      expv[37] = 4'hx;
      expv[38] = 4'hx;
      expv[39] = 4'hx;
      expv[40] = 4'hx;
      expv[41] = 4'hx;
      expv[42] = 4'hx;
      expv[43] = 4'hx;
      expv[44] = 4'hx;
      expv[45] = 4'h0;
      expv[46] = 4'hx;
      expv[47] = 4'hx;
      expv[48] = 4'hx;
      expv[49] = 4'hx;
      expv[50] = 4'hx;
      expv[51] = 4'h4;
      expv[52] = 4'hx;
      expv[53] = 4'hd;
      expv[54] = 4'hx;
      expv[55] = 4'hx;
      expv[56] = 4'hx;
      expv[57] = 4'hx;
      expv[58] = 4'hx;
      expv[59] = 4'hx;
      expv[60] = 4'hx;
      expv[61] = 4'hx;
      expv[62] = 4'hx;
      expv[63] = 4'hx;
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
