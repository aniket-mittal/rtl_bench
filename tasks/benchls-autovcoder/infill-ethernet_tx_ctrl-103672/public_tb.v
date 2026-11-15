// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_103672 dut (
    .clk_125(clk),
    .rstn(in_vec[40:40]),
    .enable(in_vec[39:39]),
    .run(in_vec[38:38]),
    .ipg_cnt(in_vec[37:22]),
    .tx_cycles(in_vec[21:6]),
    .loop(in_vec[5:5]),
    .tx_empty(in_vec[4:4]),
    .tx_rdy(in_vec[3:3]),
    .tx_val(in_vec[2:2]),
    .tx_end(in_vec[1:1]),
    .credit_available(in_vec[0:0]),
    .rprst(out_vec[6:6]),
    .tx_cr_read(out_vec[5:5]),
    .tx_d_read(out_vec[4:4]),
    .done(out_vec[3:3]),
    .sm(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h063f2426e79;
    stim[1] = 41'h0f2460f2bf2;
    stim[2] = 41'h1482900c3fc;
    stim[3] = 41'h140a255ca19;
    stim[4] = 41'h155ffa83009;
    stim[5] = 41'h19b79e617c1;
    stim[6] = 41'h117ec5b988c;
    stim[7] = 41'h18bdc2c8795;
    stim[8] = 41'h1ba1e321a2f;
    stim[9] = 41'h1d5864b31ec;
    stim[10] = 41'h15c32f53e5d;
    stim[11] = 41'h1361773c2f9;
    stim[12] = 41'h1efb2004a9b;
    stim[13] = 41'h1e313f6b9b4;
    stim[14] = 41'h11ed2650fd9;
    stim[15] = 41'h11b56734853;
    stim[16] = 41'h195d0b0a50b;
    stim[17] = 41'h1f15a9af2d7;
    stim[18] = 41'h1f7930e511b;
    stim[19] = 41'h1eec5cf7d2f;
    stim[20] = 41'h1d4b64d6265;
    stim[21] = 41'h1d2811964fe;
    stim[22] = 41'h1b53b485e77;
    stim[23] = 41'h1778dc05f3e;
    stim[24] = 41'h18583bd96cb;
    stim[25] = 41'h1d61ff72cb3;
    stim[26] = 41'h17204b19655;
    stim[27] = 41'h1edd582286d;
    stim[28] = 41'h1f35e557b0b;
    stim[29] = 41'h1e51e48983a;
    stim[30] = 41'h1c318ee5f12;
    stim[31] = 41'h176f83112c8;
    stim[32] = 41'h1467bfccd45;
    stim[33] = 41'h1f6f04f0dc2;
    stim[34] = 41'h141f6c38211;
    stim[35] = 41'h10eb9977c76;
    stim[36] = 41'h12aa53c3d67;
    stim[37] = 41'h1ac5a98e37c;
    stim[38] = 41'h1c27f50272f;
    stim[39] = 41'h16faba3543b;
    stim[40] = 41'h174c1b2b575;
    stim[41] = 41'h116e58d01fd;
    stim[42] = 41'h16116afd273;
    stim[43] = 41'h1de9facf8dd;
    stim[44] = 41'h1d6c6d72273;
    stim[45] = 41'h11a2aff9c12;
    stim[46] = 41'h117a7c378b8;
    stim[47] = 41'h1a49554a4af;
    stim[48] = 41'h10d930c8701;
    stim[49] = 41'h177887d3fd7;
    stim[50] = 41'h1e705743117;
    stim[51] = 41'h1fd8d79fd09;
    stim[52] = 41'h1139ba7e5cb;
    stim[53] = 41'h1c1d06a0bfd;
    stim[54] = 41'h18cd8ef6cd7;
    stim[55] = 41'h17d7e69c45a;
    stim[56] = 41'h106486177c4;
    stim[57] = 41'h16ad824ca0d;
    stim[58] = 41'h155f6b93b95;
    stim[59] = 41'h1bf9114649e;
    stim[60] = 41'h1ab76850ea9;
    stim[61] = 41'h18457be49de;
    stim[62] = 41'h1045ca965f5;
    stim[63] = 41'h1ca94fb6a22;
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
      expv[0] = 7'h00;
      expv[1] = 7'h00;
      expv[2] = 7'h00;
      expv[3] = 7'h00;
      expv[4] = 7'h00;
      expv[5] = 7'h00;
      expv[6] = 7'h00;
      expv[7] = 7'h00;
      expv[8] = 7'h00;
      expv[9] = 7'h00;
      expv[10] = 7'h22;
      expv[11] = 7'h13;
      expv[12] = 7'h13;
      expv[13] = 7'h13;
      expv[14] = 7'h13;
      expv[15] = 7'h13;
      expv[16] = 7'h13;
      expv[17] = 7'h13;
      expv[18] = 7'h45;
      expv[19] = 7'h45;
      expv[20] = 7'h45;
      expv[21] = 7'h45;
      expv[22] = 7'h45;
      expv[23] = 7'h45;
      expv[24] = 7'h45;
      expv[25] = 7'h45;
      expv[26] = 7'h45;
      expv[27] = 7'h45;
      expv[28] = 7'h45;
      expv[29] = 7'h45;
      expv[30] = 7'h45;
      expv[31] = 7'h45;
      expv[32] = 7'h45;
      expv[33] = 7'h45;
      expv[34] = 7'h45;
      expv[35] = 7'h45;
      expv[36] = 7'h45;
      expv[37] = 7'h45;
      expv[38] = 7'h45;
      expv[39] = 7'h45;
      expv[40] = 7'h45;
      expv[41] = 7'h45;
      expv[42] = 7'h45;
      expv[43] = 7'h45;
      expv[44] = 7'h45;
      expv[45] = 7'h45;
      expv[46] = 7'h45;
      expv[47] = 7'h45;
      expv[48] = 7'h45;
      expv[49] = 7'h45;
      expv[50] = 7'h45;
      expv[51] = 7'h45;
      expv[52] = 7'h45;
      expv[53] = 7'h45;
      expv[54] = 7'h45;
      expv[55] = 7'h45;
      expv[56] = 7'h45;
      expv[57] = 7'h45;
      expv[58] = 7'h45;
      expv[59] = 7'h45;
      expv[60] = 7'h45;
      expv[61] = 7'h45;
      expv[62] = 7'h45;
      expv[63] = 7'h45;
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
