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

  autovcoder_071770 dut (
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
    stim[0] = 11'h79c;
    stim[1] = 11'h4dd;
    stim[2] = 11'h363;
    stim[3] = 11'h23f;
    stim[4] = 11'h318;
    stim[5] = 11'h004;
    stim[6] = 11'h194;
    stim[7] = 11'h048;
    stim[8] = 11'h176;
    stim[9] = 11'h1ab;
    stim[10] = 11'h37c;
    stim[11] = 11'h3fd;
    stim[12] = 11'h01d;
    stim[13] = 11'h18a;
    stim[14] = 11'h29d;
    stim[15] = 11'h1f9;
    stim[16] = 11'h10b;
    stim[17] = 11'h024;
    stim[18] = 11'h26e;
    stim[19] = 11'h17a;
    stim[20] = 11'h05c;
    stim[21] = 11'h0e1;
    stim[22] = 11'h1f8;
    stim[23] = 11'h01d;
    stim[24] = 11'h1ce;
    stim[25] = 11'h327;
    stim[26] = 11'h3a9;
    stim[27] = 11'h2da;
    stim[28] = 11'h038;
    stim[29] = 11'h2d2;
    stim[30] = 11'h2c7;
    stim[31] = 11'h199;
    stim[32] = 11'h3fd;
    stim[33] = 11'h07e;
    stim[34] = 11'h6f2;
    stim[35] = 11'h021;
    stim[36] = 11'h0b4;
    stim[37] = 11'h2cb;
    stim[38] = 11'h2f5;
    stim[39] = 11'h1d7;
    stim[40] = 11'h35b;
    stim[41] = 11'h353;
    stim[42] = 11'h260;
    stim[43] = 11'h087;
    stim[44] = 11'h05f;
    stim[45] = 11'h3c4;
    stim[46] = 11'h191;
    stim[47] = 11'h3fd;
    stim[48] = 11'h3bb;
    stim[49] = 11'h0b8;
    stim[50] = 11'h1ff;
    stim[51] = 11'h167;
    stim[52] = 11'h16d;
    stim[53] = 11'h1bc;
    stim[54] = 11'h172;
    stim[55] = 11'h213;
    stim[56] = 11'h1e6;
    stim[57] = 11'h03e;
    stim[58] = 11'h11e;
    stim[59] = 11'h361;
    stim[60] = 11'h0c3;
    stim[61] = 11'h01b;
    stim[62] = 11'h12d;
    stim[63] = 11'h0c3;
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
      expv[3] = 12'hec0;
      expv[4] = 12'hc7d;
      expv[5] = 12'hc7d;
      expv[6] = 12'hc7d;
      expv[7] = 12'hc7d;
      expv[8] = 12'hc7d;
      expv[9] = 12'h47e;
      expv[10] = 12'haed;
      expv[11] = 12'haed;
      expv[12] = 12'hae8;
      expv[13] = 12'hae8;
      expv[14] = 12'hb15;
      expv[15] = 12'hb10;
      expv[16] = 12'hb10;
      expv[17] = 12'ha15;
      expv[18] = 12'ha15;
      expv[19] = 12'h216;
      expv[20] = 12'h216;
      expv[21] = 12'h216;
      expv[22] = 12'hcdd;
      expv[23] = 12'hcdd;
      expv[24] = 12'hcd8;
      expv[25] = 12'hb9d;
      expv[26] = 12'he4d;
      expv[27] = 12'he48;
      expv[28] = 12'hdb5;
      expv[29] = 12'hdb5;
      expv[30] = 12'h5b6;
      expv[31] = 12'hda5;
      expv[32] = 12'hda0;
      expv[33] = 12'hda0;
      expv[34] = 12'h8fd;
      expv[35] = 12'h0f8;
      expv[36] = 12'h8f8;
      expv[37] = 12'h8f8;
      expv[38] = 12'hd95;
      expv[39] = 12'hd90;
      expv[40] = 12'hbad;
      expv[41] = 12'heb5;
      expv[42] = 12'hea5;
      expv[43] = 12'hea5;
      expv[44] = 12'h90d;
      expv[45] = 12'h8bd;
      expv[46] = 12'h8bd;
      expv[47] = 12'h8b8;
      expv[48] = 12'h8b8;
      expv[49] = 12'hf75;
      expv[50] = 12'hf75;
      expv[51] = 12'hbfd;
      expv[52] = 12'hacd;
      expv[53] = 12'hac8;
      expv[54] = 12'hac8;
      expv[55] = 12'hae5;
      expv[56] = 12'hc25;
      expv[57] = 12'h426;
      expv[58] = 12'h426;
      expv[59] = 12'h426;
      expv[60] = 12'hbcd;
      expv[61] = 12'h985;
      expv[62] = 12'h835;
      expv[63] = 12'h830;
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
