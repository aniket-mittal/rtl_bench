// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071821 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hc95;
    stim[1] = 12'hb8c;
    stim[2] = 12'h2ff;
    stim[3] = 12'h00b;
    stim[4] = 12'h1e7;
    stim[5] = 12'h6c0;
    stim[6] = 12'h7c9;
    stim[7] = 12'h752;
    stim[8] = 12'h6e0;
    stim[9] = 12'h526;
    stim[10] = 12'h45b;
    stim[11] = 12'h159;
    stim[12] = 12'h316;
    stim[13] = 12'he2a;
    stim[14] = 12'h231;
    stim[15] = 12'h637;
    stim[16] = 12'h4a7;
    stim[17] = 12'h00b;
    stim[18] = 12'h73b;
    stim[19] = 12'h766;
    stim[20] = 12'h037;
    stim[21] = 12'h751;
    stim[22] = 12'h432;
    stim[23] = 12'h01f;
    stim[24] = 12'h477;
    stim[25] = 12'h4e7;
    stim[26] = 12'h5bc;
    stim[27] = 12'h067;
    stim[28] = 12'h176;
    stim[29] = 12'h761;
    stim[30] = 12'h109;
    stim[31] = 12'h0f6;
    stim[32] = 12'h8a9;
    stim[33] = 12'h7f4;
    stim[34] = 12'h53e;
    stim[35] = 12'h7dd;
    stim[36] = 12'h52a;
    stim[37] = 12'h17e;
    stim[38] = 12'h0c2;
    stim[39] = 12'h057;
    stim[40] = 12'h6cf;
    stim[41] = 12'h156;
    stim[42] = 12'h01c;
    stim[43] = 12'h3f3;
    stim[44] = 12'h310;
    stim[45] = 12'h6b7;
    stim[46] = 12'h76b;
    stim[47] = 12'h2f1;
    stim[48] = 12'h3b5;
    stim[49] = 12'h620;
    stim[50] = 12'h2de;
    stim[51] = 12'h124;
    stim[52] = 12'h689;
    stim[53] = 12'h570;
    stim[54] = 12'h186;
    stim[55] = 12'h717;
    stim[56] = 12'h0d9;
    stim[57] = 12'h46a;
    stim[58] = 12'h5e0;
    stim[59] = 12'h24d;
    stim[60] = 12'h287;
    stim[61] = 12'h3df;
    stim[62] = 12'h140;
    stim[63] = 12'h282;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h100;
      expv[4] = 10'h100;
      expv[5] = 10'h100;
      expv[6] = 10'h1xx;
      expv[7] = 10'h1xx;
      expv[8] = 10'h3c9;
      expv[9] = 10'h352;
      expv[10] = 10'h352;
      expv[11] = 10'h352;
      expv[12] = 10'h352;
      expv[13] = 10'h352;
      expv[14] = 10'h100;
      expv[15] = 10'h100;
      expv[16] = 10'h126;
      expv[17] = 10'h126;
      expv[18] = 10'h126;
      expv[19] = 10'h126;
      expv[20] = 10'h33b;
      expv[21] = 10'h33b;
      expv[22] = 10'h366;
      expv[23] = 10'h366;
      expv[24] = 10'h366;
      expv[25] = 10'h366;
      expv[26] = 10'h366;
      expv[27] = 10'h366;
      expv[28] = 10'h366;
      expv[29] = 10'h366;
      expv[30] = 10'h351;
      expv[31] = 10'h351;
      expv[32] = 10'h351;
      expv[33] = 10'h100;
      expv[34] = 10'h161;
      expv[35] = 10'h3f4;
      expv[36] = 10'h33e;
      expv[37] = 10'h33e;
      expv[38] = 10'h33e;
      expv[39] = 10'h33e;
      expv[40] = 10'h33e;
      expv[41] = 10'h3dd;
      expv[42] = 10'h3dd;
      expv[43] = 10'h3dd;
      expv[44] = 10'h3dd;
      expv[45] = 10'h3dd;
      expv[46] = 10'h32a;
      expv[47] = 10'h12a;
      expv[48] = 10'h12a;
      expv[49] = 10'h12a;
      expv[50] = 10'h36b;
      expv[51] = 10'h36b;
      expv[52] = 10'h36b;
      expv[53] = 10'h16b;
      expv[54] = 10'h16b;
      expv[55] = 10'h16b;
      expv[56] = 10'h370;
      expv[57] = 10'h370;
      expv[58] = 10'h370;
      expv[59] = 10'h370;
      expv[60] = 10'h370;
      expv[61] = 10'h370;
      expv[62] = 10'h370;
      expv[63] = 10'h370;
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
