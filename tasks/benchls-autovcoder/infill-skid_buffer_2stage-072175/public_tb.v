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

  autovcoder_072175 dut (
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
    stim[0] = 11'h624;
    stim[1] = 11'h74a;
    stim[2] = 11'h05d;
    stim[3] = 11'h19f;
    stim[4] = 11'h055;
    stim[5] = 11'h5fe;
    stim[6] = 11'h268;
    stim[7] = 11'h3e8;
    stim[8] = 11'h08d;
    stim[9] = 11'h08d;
    stim[10] = 11'h05a;
    stim[11] = 11'h0c7;
    stim[12] = 11'h336;
    stim[13] = 11'h107;
    stim[14] = 11'h0d8;
    stim[15] = 11'h1dc;
    stim[16] = 11'h1ca;
    stim[17] = 11'h26a;
    stim[18] = 11'h1c4;
    stim[19] = 11'h2af;
    stim[20] = 11'h376;
    stim[21] = 11'h34a;
    stim[22] = 11'h3a8;
    stim[23] = 11'h148;
    stim[24] = 11'h399;
    stim[25] = 11'h7ee;
    stim[26] = 11'h18f;
    stim[27] = 11'h04b;
    stim[28] = 11'h348;
    stim[29] = 11'h290;
    stim[30] = 11'h12a;
    stim[31] = 11'h225;
    stim[32] = 11'h048;
    stim[33] = 11'h16a;
    stim[34] = 11'h1a4;
    stim[35] = 11'h048;
    stim[36] = 11'h4cd;
    stim[37] = 11'h349;
    stim[38] = 11'h2de;
    stim[39] = 11'h28b;
    stim[40] = 11'h150;
    stim[41] = 11'h24b;
    stim[42] = 11'h328;
    stim[43] = 11'h130;
    stim[44] = 11'h303;
    stim[45] = 11'h30f;
    stim[46] = 11'h00f;
    stim[47] = 11'h2a8;
    stim[48] = 11'h35d;
    stim[49] = 11'h3aa;
    stim[50] = 11'h384;
    stim[51] = 11'h0fb;
    stim[52] = 11'h0c8;
    stim[53] = 11'h02a;
    stim[54] = 11'h202;
    stim[55] = 11'h3dd;
    stim[56] = 11'h2fa;
    stim[57] = 11'h34f;
    stim[58] = 11'h354;
    stim[59] = 11'h291;
    stim[60] = 11'h367;
    stim[61] = 11'h2ee;
    stim[62] = 11'h37e;
    stim[63] = 11'h011;
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
      expv[2] = 12'h690;
      expv[3] = 12'he90;
      expv[4] = 12'hb3d;
      expv[5] = 12'hb38;
      expv[6] = 12'h3f8;
      expv[7] = 12'hbf8;
      expv[8] = 12'hbf8;
      expv[9] = 12'hbf8;
      expv[10] = 12'hbf8;
      expv[11] = 12'h8b5;
      expv[12] = 12'h98d;
      expv[13] = 12'h18e;
      expv[14] = 12'he6d;
      expv[15] = 12'he6d;
      expv[16] = 12'he6d;
      expv[17] = 12'h66e;
      expv[18] = 12'h66e;
      expv[19] = 12'h66e;
      expv[20] = 12'hb95;
      expv[21] = 12'h396;
      expv[22] = 12'h396;
      expv[23] = 12'h396;
      expv[24] = 12'h396;
      expv[25] = 12'heed;
      expv[26] = 12'h6e8;
      expv[27] = 12'hb18;
      expv[28] = 12'h895;
      expv[29] = 12'h895;
      expv[30] = 12'h895;
      expv[31] = 12'h096;
      expv[32] = 12'ha55;
      expv[33] = 12'ha55;
      expv[34] = 12'h256;
      expv[35] = 12'h256;
      expv[36] = 12'h256;
      expv[37] = 12'h2d0;
      expv[38] = 12'had0;
      expv[39] = 12'hdbd;
      expv[40] = 12'hd15;
      expv[41] = 12'hd15;
      expv[42] = 12'hc95;
      expv[43] = 12'hc95;
      expv[44] = 12'hc95;
      expv[45] = 12'he05;
      expv[46] = 12'he1d;
      expv[47] = 12'h81d;
      expv[48] = 12'h81d;
      expv[49] = 12'h818;
      expv[50] = 12'hf55;
      expv[51] = 12'hf55;
      expv[52] = 12'h9f5;
      expv[53] = 12'h9f5;
      expv[54] = 12'h1f6;
      expv[55] = 12'h1f6;
      expv[56] = 12'h855;
      expv[57] = 12'h056;
      expv[58] = 12'hdf5;
      expv[59] = 12'hdf5;
      expv[60] = 12'hdf0;
      expv[61] = 12'hecd;
      expv[62] = 12'h6ce;
      expv[63] = 12'h6ce;
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
