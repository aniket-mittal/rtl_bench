// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 26;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01931 dut (
    .clock(clk),
    .reset(in_vec[40:40]),
    .ena(in_vec[39:39]),
    .phi_n(in_vec[38:38]),
    .phi_en(in_vec[37:37]),
    .addr(in_vec[36:21]),
    .din(in_vec[20:13]),
    .cpu_di(in_vec[12:5]),
    .m1_n(in_vec[4:4]),
    .iorq_n(in_vec[3:3]),
    .rd_n(in_vec[2:2]),
    .wr_n(in_vec[1:1]),
    .cursor(in_vec[0:0]),
    .dout(out_vec[25:18]),
    .int_n(out_vec[17:17]),
    .nmi(out_vec[16:16]),
    .audio_l(out_vec[15:8]),
    .audio_r(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h140dea42d1d;
    stim[1] = 41'h12f6d00c966;
    stim[2] = 41'h026deb2e340;
    stim[3] = 41'h0b836ec34a6;
    stim[4] = 41'h033c4f29e3d;
    stim[5] = 41'h0850d55e8e1;
    stim[6] = 41'h08743723fb3;
    stim[7] = 41'h036e3a3f434;
    stim[8] = 41'h09216627b14;
    stim[9] = 41'h01310d63bce;
    stim[10] = 41'h0781717ee58;
    stim[11] = 41'h0fa9c2fb3ab;
    stim[12] = 41'h0d034611dd9;
    stim[13] = 41'h0df0e32276f;
    stim[14] = 41'h0447b2000f0;
    stim[15] = 41'h019cfe8ee0c;
    stim[16] = 41'h0f587e67218;
    stim[17] = 41'h086e53c810a;
    stim[18] = 41'h0957169d2ca;
    stim[19] = 41'h07f91666d46;
    stim[20] = 41'h06fd7645b61;
    stim[21] = 41'h014abe87073;
    stim[22] = 41'h0d0058c6b4b;
    stim[23] = 41'h0b8553abd05;
    stim[24] = 41'h0a7c4cabb44;
    stim[25] = 41'h0e7d09a55d0;
    stim[26] = 41'h04a822f6de3;
    stim[27] = 41'h01e1726275e;
    stim[28] = 41'h01801f57d32;
    stim[29] = 41'h081e0256246;
    stim[30] = 41'h026db4df4a5;
    stim[31] = 41'h06aca38f81d;
    stim[32] = 41'h00ee78f112b;
    stim[33] = 41'h0b7994dca09;
    stim[34] = 41'h08fb604c542;
    stim[35] = 41'h03a0550cba4;
    stim[36] = 41'h08333492b26;
    stim[37] = 41'h0a024b1b924;
    stim[38] = 41'h092ad1573da;
    stim[39] = 41'h08658400872;
    stim[40] = 41'h08132581d2b;
    stim[41] = 41'h0e4451028aa;
    stim[42] = 41'h091d3a5a881;
    stim[43] = 41'h0c29f979507;
    stim[44] = 41'h0f06eac5db8;
    stim[45] = 41'h0c7cb873bfe;
    stim[46] = 41'h03e8187c5cb;
    stim[47] = 41'h0139bc857bc;
    stim[48] = 41'h0efc31da402;
    stim[49] = 41'h05130d036fd;
    stim[50] = 41'h0d87ca7e3e6;
    stim[51] = 41'h0b5e88c864f;
    stim[52] = 41'h07567d4a234;
    stim[53] = 41'h0c91ec0b816;
    stim[54] = 41'h01103009d2e;
    stim[55] = 41'h0ba4917d44f;
    stim[56] = 41'h085cc1b6c0f;
    stim[57] = 41'h0595e5c8803;
    stim[58] = 41'h0138149fef9;
    stim[59] = 41'h0018d6e1068;
    stim[60] = 41'h093bb62eaa7;
    stim[61] = 41'h0d7def02922;
    stim[62] = 41'h02c9823a7c2;
    stim[63] = 41'h04fb8385e28;
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
      expv[0] = 26'hxxx0000;
      expv[1] = 26'hxxx0000;
      expv[2] = 26'hxxx0000;
      expv[3] = 26'hxxx0000;
      expv[4] = 26'hxxx0000;
      expv[5] = 26'hxxx0000;
      expv[6] = 26'hxxx0000;
      expv[7] = 26'hxxx0000;
      expv[8] = 26'hxxx0000;
      expv[9] = 26'hxxx0000;
      expv[10] = 26'hxxx0000;
      expv[11] = 26'hxxx0000;
      expv[12] = 26'hxxx0000;
      expv[13] = 26'hxxx0000;
      expv[14] = 26'hxxx0000;
      expv[15] = 26'hxxx0000;
      expv[16] = 26'hxxx0000;
      expv[17] = 26'hxxx0000;
      expv[18] = 26'hxxx0000;
      expv[19] = 26'hxxx0000;
      expv[20] = 26'hxxx0000;
      expv[21] = 26'hxxx0000;
      expv[22] = 26'hxxx0000;
      expv[23] = 26'hxxx0000;
      expv[24] = 26'hxxx0000;
      expv[25] = 26'hxxx0000;
      expv[26] = 26'hxxx0000;
      expv[27] = 26'hxxx0000;
      expv[28] = 26'hxxx0000;
      expv[29] = 26'hxxx0000;
      expv[30] = 26'hxxx0000;
      expv[31] = 26'hxxx0000;
      expv[32] = 26'hxxx0000;
      expv[33] = 26'hxxx0000;
      expv[34] = 26'hxxx0000;
      expv[35] = 26'hxxx0000;
      expv[36] = 26'hxxx0000;
      expv[37] = 26'hxxx0000;
      expv[38] = 26'hxxx0000;
      expv[39] = 26'hxxx0000;
      expv[40] = 26'hxxx0000;
      expv[41] = 26'hxxx0000;
      expv[42] = 26'hxxx0000;
      expv[43] = 26'hxxx0000;
      expv[44] = 26'hxxx0000;
      expv[45] = 26'hxxx0000;
      expv[46] = 26'hxxx0000;
      expv[47] = 26'hxxx0000;
      expv[48] = 26'hxxx0000;
      expv[49] = 26'hxxx0000;
      expv[50] = 26'hxxx0000;
      expv[51] = 26'hxxx0000;
      expv[52] = 26'hxxx0000;
      expv[53] = 26'hxxx0000;
      expv[54] = 26'hxxx0000;
      expv[55] = 26'hxxx0000;
      expv[56] = 26'hxxx0000;
      expv[57] = 26'hxxx0000;
      expv[58] = 26'hxxx0000;
      expv[59] = 26'hxxx0000;
      expv[60] = 26'hxxx0000;
      expv[61] = 26'hxxx0000;
      expv[62] = 26'hxxx0000;
      expv[63] = 26'hxxx0000;
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
