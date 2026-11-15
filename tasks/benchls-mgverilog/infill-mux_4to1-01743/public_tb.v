// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01743 dut (
    .Sel(in_vec[17:16]),
    .S0(in_vec[15:12]),
    .S1(in_vec[11:8]),
    .S2(in_vec[7:4]),
    .S3(in_vec[3:0]),
    .out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h03a20;
    stim[1] = 18'h1842a;
    stim[2] = 18'h393aa;
    stim[3] = 18'h073fe;
    stim[4] = 18'h102af;
    stim[5] = 18'h1ed7f;
    stim[6] = 18'h35eaf;
    stim[7] = 18'h07f9b;
    stim[8] = 18'h16503;
    stim[9] = 18'h3954d;
    stim[10] = 18'h0fa8d;
    stim[11] = 18'h17470;
    stim[12] = 18'h0e6a4;
    stim[13] = 18'h295b2;
    stim[14] = 18'h31af6;
    stim[15] = 18'h16cfa;
    stim[16] = 18'h12c70;
    stim[17] = 18'h03781;
    stim[18] = 18'h0d759;
    stim[19] = 18'h251ce;
    stim[20] = 18'h3b03a;
    stim[21] = 18'h16e36;
    stim[22] = 18'h194ab;
    stim[23] = 18'h0eaf0;
    stim[24] = 18'h05baa;
    stim[25] = 18'h08af6;
    stim[26] = 18'h0ee69;
    stim[27] = 18'h346c1;
    stim[28] = 18'h23b95;
    stim[29] = 18'h01957;
    stim[30] = 18'h29e6e;
    stim[31] = 18'h0db94;
    stim[32] = 18'h3befc;
    stim[33] = 18'h2cb8a;
    stim[34] = 18'h1dd68;
    stim[35] = 18'h18848;
    stim[36] = 18'h2058b;
    stim[37] = 18'h387e0;
    stim[38] = 18'h3065c;
    stim[39] = 18'h01fdc;
    stim[40] = 18'h3d464;
    stim[41] = 18'h237be;
    stim[42] = 18'h3692a;
    stim[43] = 18'h3c1d1;
    stim[44] = 18'h07381;
    stim[45] = 18'h2732f;
    stim[46] = 18'h2d444;
    stim[47] = 18'h14b1c;
    stim[48] = 18'h3ec7b;
    stim[49] = 18'h34ece;
    stim[50] = 18'h3e59a;
    stim[51] = 18'h27086;
    stim[52] = 18'h3bd17;
    stim[53] = 18'h0474b;
    stim[54] = 18'h3eaaf;
    stim[55] = 18'h11092;
    stim[56] = 18'h1d810;
    stim[57] = 18'h0ce45;
    stim[58] = 18'h093fb;
    stim[59] = 18'h3eeaf;
    stim[60] = 18'h38743;
    stim[61] = 18'h1897f;
    stim[62] = 18'h19d34;
    stim[63] = 18'h13a2e;
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
      expv[0] = 4'h3;
      expv[1] = 4'h4;
      expv[2] = 4'ha;
      expv[3] = 4'h7;
      expv[4] = 4'h2;
      expv[5] = 4'hd;
      expv[6] = 4'hf;
      expv[7] = 4'h7;
      expv[8] = 4'h5;
      expv[9] = 4'hd;
      expv[10] = 4'hf;
      expv[11] = 4'h4;
      expv[12] = 4'he;
      expv[13] = 4'hb;
      expv[14] = 4'h6;
      expv[15] = 4'hc;
      expv[16] = 4'hc;
      expv[17] = 4'h3;
      expv[18] = 4'hd;
      expv[19] = 4'hc;
      expv[20] = 4'ha;
      expv[21] = 4'he;
      expv[22] = 4'h4;
      expv[23] = 4'he;
      expv[24] = 4'h5;
      expv[25] = 4'h8;
      expv[26] = 4'he;
      expv[27] = 4'h1;
      expv[28] = 4'h9;
      expv[29] = 4'h1;
      expv[30] = 4'h6;
      expv[31] = 4'hd;
      expv[32] = 4'hc;
      expv[33] = 4'h8;
      expv[34] = 4'hd;
      expv[35] = 4'h8;
      expv[36] = 4'h8;
      expv[37] = 4'h0;
      expv[38] = 4'hc;
      expv[39] = 4'h1;
      expv[40] = 4'h4;
      expv[41] = 4'hb;
      expv[42] = 4'ha;
      expv[43] = 4'h1;
      expv[44] = 4'h7;
      expv[45] = 4'h2;
      expv[46] = 4'h4;
      expv[47] = 4'hb;
      expv[48] = 4'hb;
      expv[49] = 4'he;
      expv[50] = 4'ha;
      expv[51] = 4'h8;
      expv[52] = 4'h7;
      expv[53] = 4'h4;
      expv[54] = 4'hf;
      expv[55] = 4'h0;
      expv[56] = 4'h8;
      expv[57] = 4'hc;
      expv[58] = 4'h9;
      expv[59] = 4'hf;
      expv[60] = 4'h3;
      expv[61] = 4'h9;
      expv[62] = 4'hd;
      expv[63] = 4'ha;
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
