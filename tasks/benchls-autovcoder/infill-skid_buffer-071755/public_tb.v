// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071755 dut (
    .sclk(clk),
    .reset(in_vec[10:10]),
    .s_data(in_vec[9:2]),
    .s_valid(in_vec[1:1]),
    .m_ready(in_vec[0:0]),
    .s_ready(out_vec[11:11]),
    .m_data(out_vec[10:3]),
    .m_valid(out_vec[2:2]),
    .num_data_valid(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h799;
    stim[1] = 11'h4fd;
    stim[2] = 11'h27d;
    stim[3] = 11'h2b6;
    stim[4] = 11'h788;
    stim[5] = 11'h1e5;
    stim[6] = 11'h371;
    stim[7] = 11'h0d5;
    stim[8] = 11'h1d5;
    stim[9] = 11'h384;
    stim[10] = 11'h02a;
    stim[11] = 11'h286;
    stim[12] = 11'h21b;
    stim[13] = 11'h388;
    stim[14] = 11'h02f;
    stim[15] = 11'h1b2;
    stim[16] = 11'h105;
    stim[17] = 11'h206;
    stim[18] = 11'h277;
    stim[19] = 11'h179;
    stim[20] = 11'h1e2;
    stim[21] = 11'h12f;
    stim[22] = 11'h3c2;
    stim[23] = 11'h0fb;
    stim[24] = 11'h28f;
    stim[25] = 11'h033;
    stim[26] = 11'h0ac;
    stim[27] = 11'h322;
    stim[28] = 11'h3d5;
    stim[29] = 11'h3ed;
    stim[30] = 11'h207;
    stim[31] = 11'h3b5;
    stim[32] = 11'h0e8;
    stim[33] = 11'h10e;
    stim[34] = 11'h176;
    stim[35] = 11'h24c;
    stim[36] = 11'h36e;
    stim[37] = 11'h21d;
    stim[38] = 11'h213;
    stim[39] = 11'h351;
    stim[40] = 11'h20b;
    stim[41] = 11'h39b;
    stim[42] = 11'h318;
    stim[43] = 11'h0c3;
    stim[44] = 11'h2e1;
    stim[45] = 11'h3b5;
    stim[46] = 11'h272;
    stim[47] = 11'h251;
    stim[48] = 11'h2fb;
    stim[49] = 11'h274;
    stim[50] = 11'h3a0;
    stim[51] = 11'h0a7;
    stim[52] = 11'h2e6;
    stim[53] = 11'h361;
    stim[54] = 11'h210;
    stim[55] = 11'h3a1;
    stim[56] = 11'h0f2;
    stim[57] = 11'h1af;
    stim[58] = 11'h358;
    stim[59] = 11'h28d;
    stim[60] = 11'h04b;
    stim[61] = 11'h146;
    stim[62] = 11'h050;
    stim[63] = 11'h0e9;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'hxxx;
      expv[4] = 12'hd6d;
      expv[5] = 12'h568;
      expv[6] = 12'hd68;
      expv[7] = 12'hd68;
      expv[8] = 12'hd68;
      expv[9] = 12'hd68;
      expv[10] = 12'hd68;
      expv[11] = 12'h855;
      expv[12] = 12'h056;
      expv[13] = 12'hd0d;
      expv[14] = 12'hd0d;
      expv[15] = 12'h85d;
      expv[16] = 12'h05e;
      expv[17] = 12'hb65;
      expv[18] = 12'h366;
      expv[19] = 12'hc0d;
      expv[20] = 12'hc08;
      expv[21] = 12'hbc5;
      expv[22] = 12'ha5d;
      expv[23] = 12'h25e;
      expv[24] = 12'hf85;
      expv[25] = 12'hd1d;
      expv[26] = 12'h865;
      expv[27] = 12'h865;
      expv[28] = 12'h066;
      expv[29] = 12'he45;
      expv[30] = 12'he40;
      expv[31] = 12'hc0d;
      expv[32] = 12'hc08;
      expv[33] = 12'hc08;
      expv[34] = 12'ha1d;
      expv[35] = 12'h21e;
      expv[36] = 12'h21e;
      expv[37] = 12'h21e;
      expv[38] = 12'haed;
      expv[39] = 12'hc25;
      expv[40] = 12'hc20;
      expv[41] = 12'hc15;
      expv[42] = 12'hf35;
      expv[43] = 12'hf35;
      expv[44] = 12'h985;
      expv[45] = 12'h980;
      expv[46] = 12'h980;
      expv[47] = 12'hce5;
      expv[48] = 12'hce0;
      expv[49] = 12'hdf5;
      expv[50] = 12'hdf5;
      expv[51] = 12'hdf5;
      expv[52] = 12'h94d;
      expv[53] = 12'h14e;
      expv[54] = 12'hdcd;
      expv[55] = 12'hdcd;
      expv[56] = 12'hdc8;
      expv[57] = 12'h9e5;
      expv[58] = 12'hb5d;
      expv[59] = 12'hb5d;
      expv[60] = 12'hb58;
      expv[61] = 12'h895;
      expv[62] = 12'h096;
      expv[63] = 12'h096;
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
