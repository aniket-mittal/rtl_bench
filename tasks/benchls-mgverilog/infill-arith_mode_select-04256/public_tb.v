// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04256 dut (
    .A(in_vec[13:6]),
    .mode(in_vec[5:0]),
    .Y(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h221b;
    stim[1] = 14'h3e2a;
    stim[2] = 14'h0cf7;
    stim[3] = 14'h10f7;
    stim[4] = 14'h2a02;
    stim[5] = 14'h14d9;
    stim[6] = 14'h0a33;
    stim[7] = 14'h31f6;
    stim[8] = 14'h37f5;
    stim[9] = 14'h186c;
    stim[10] = 14'h1215;
    stim[11] = 14'h3b5d;
    stim[12] = 14'h144c;
    stim[13] = 14'h3877;
    stim[14] = 14'h33ab;
    stim[15] = 14'h3394;
    stim[16] = 14'h0ff8;
    stim[17] = 14'h20c3;
    stim[18] = 14'h2903;
    stim[19] = 14'h2a5b;
    stim[20] = 14'h0233;
    stim[21] = 14'h232d;
    stim[22] = 14'h175d;
    stim[23] = 14'h38f9;
    stim[24] = 14'h1beb;
    stim[25] = 14'h0c3f;
    stim[26] = 14'h3a87;
    stim[27] = 14'h27d4;
    stim[28] = 14'h1477;
    stim[29] = 14'h1c59;
    stim[30] = 14'h3e72;
    stim[31] = 14'h27f4;
    stim[32] = 14'h2934;
    stim[33] = 14'h111b;
    stim[34] = 14'h3cfb;
    stim[35] = 14'h1e28;
    stim[36] = 14'h0c23;
    stim[37] = 14'h3427;
    stim[38] = 14'h3dfb;
    stim[39] = 14'h13bb;
    stim[40] = 14'h2f91;
    stim[41] = 14'h2ebb;
    stim[42] = 14'h2d1a;
    stim[43] = 14'h1b20;
    stim[44] = 14'h0ea3;
    stim[45] = 14'h3cca;
    stim[46] = 14'h211a;
    stim[47] = 14'h345e;
    stim[48] = 14'h364f;
    stim[49] = 14'h382a;
    stim[50] = 14'h00e8;
    stim[51] = 14'h0226;
    stim[52] = 14'h38fd;
    stim[53] = 14'h11e3;
    stim[54] = 14'h1357;
    stim[55] = 14'h3ba9;
    stim[56] = 14'h0af3;
    stim[57] = 14'h0541;
    stim[58] = 14'h3f3a;
    stim[59] = 14'h2f6d;
    stim[60] = 14'h1790;
    stim[61] = 14'h04a8;
    stim[62] = 14'h14e1;
    stim[63] = 14'h31c2;
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
      expv[0] = 8'hf1;
      expv[1] = 8'h01;
      expv[2] = 8'h30;
      expv[3] = 8'h30;
      expv[4] = 8'h00;
      expv[5] = 8'h03;
      expv[6] = 8'h80;
      expv[7] = 8'h70;
      expv[8] = 8'hf0;
      expv[9] = 8'hf8;
      expv[10] = 8'h24;
      expv[11] = 8'h68;
      expv[12] = 8'h0a;
      expv[13] = 8'h10;
      expv[14] = 8'hfe;
      expv[15] = 8'hce;
      expv[16] = 8'hf0;
      expv[17] = 8'h83;
      expv[18] = 8'ha4;
      expv[19] = 8'hf6;
      expv[20] = 8'h80;
      expv[21] = 8'hc0;
      expv[22] = 8'he8;
      expv[23] = 8'h30;
      expv[24] = 8'h07;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h9f;
      expv[28] = 8'h10;
      expv[29] = 8'h01;
      expv[30] = 8'h90;
      expv[31] = 8'hf0;
      expv[32] = 8'h40;
      expv[33] = 8'h08;
      expv[34] = 8'h30;
      expv[35] = 8'h00;
      expv[36] = 8'hd0;
      expv[37] = 8'h0c;
      expv[38] = 8'h70;
      expv[39] = 8'he0;
      expv[40] = 8'h00;
      expv[41] = 8'ha0;
      expv[42] = 8'hd0;
      expv[43] = 8'h00;
      expv[44] = 8'hc6;
      expv[45] = 8'h03;
      expv[46] = 8'h10;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'h04;
      expv[50] = 8'h03;
      expv[51] = 8'hf0;
      expv[52] = 8'h30;
      expv[53] = 8'hb9;
      expv[54] = 8'h9a;
      expv[55] = 8'h48;
      expv[56] = 8'hb0;
      expv[57] = 8'hxx;
      expv[58] = 8'hc0;
      expv[59] = 8'hd0;
      expv[60] = 8'hxx;
      expv[61] = 8'h02;
      expv[62] = 8'had;
      expv[63] = 8'h00;
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
