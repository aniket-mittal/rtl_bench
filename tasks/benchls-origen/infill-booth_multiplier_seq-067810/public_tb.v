// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_067810 dut (
    .clk(clk),
    .start(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .r(out_vec[16:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h16a0f;
    stim[1] = 17'h067a8;
    stim[2] = 17'h11f27;
    stim[3] = 17'h1bf34;
    stim[4] = 17'h1e375;
    stim[5] = 17'h14aa1;
    stim[6] = 17'h0b062;
    stim[7] = 17'h13717;
    stim[8] = 17'h1d2a7;
    stim[9] = 17'h1c4f5;
    stim[10] = 17'h15c19;
    stim[11] = 17'h189fe;
    stim[12] = 17'h0d45d;
    stim[13] = 17'h05b61;
    stim[14] = 17'h08121;
    stim[15] = 17'h0ae96;
    stim[16] = 17'h0dde3;
    stim[17] = 17'h1598f;
    stim[18] = 17'h0687a;
    stim[19] = 17'h124eb;
    stim[20] = 17'h09b71;
    stim[21] = 17'h0b05d;
    stim[22] = 17'h1df17;
    stim[23] = 17'h19e94;
    stim[24] = 17'h089f5;
    stim[25] = 17'h04284;
    stim[26] = 17'h09266;
    stim[27] = 17'h073ad;
    stim[28] = 17'h070a4;
    stim[29] = 17'h13ff9;
    stim[30] = 17'h10a13;
    stim[31] = 17'h19168;
    stim[32] = 17'h1ec23;
    stim[33] = 17'h0f344;
    stim[34] = 17'h07320;
    stim[35] = 17'h13d27;
    stim[36] = 17'h08870;
    stim[37] = 17'h1786e;
    stim[38] = 17'h1b82d;
    stim[39] = 17'h08a54;
    stim[40] = 17'h07e8a;
    stim[41] = 17'h09dce;
    stim[42] = 17'h1debd;
    stim[43] = 17'h1524b;
    stim[44] = 17'h12863;
    stim[45] = 17'h086de;
    stim[46] = 17'h04148;
    stim[47] = 17'h1b48e;
    stim[48] = 17'h04fbd;
    stim[49] = 17'h0acc0;
    stim[50] = 17'h18eec;
    stim[51] = 17'h1c9e5;
    stim[52] = 17'h1cb0e;
    stim[53] = 17'h00105;
    stim[54] = 17'h11de7;
    stim[55] = 17'h160ef;
    stim[56] = 17'h1b68f;
    stim[57] = 17'h1b4a3;
    stim[58] = 17'h0f23c;
    stim[59] = 17'h1699f;
    stim[60] = 17'h1aebd;
    stim[61] = 17'h18bd5;
    stim[62] = 17'h072dc;
    stim[63] = 17'h0ed41;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'hxxxxx;
      expv[2] = 17'hxxxxx;
      expv[3] = 17'hxxxxx;
      expv[4] = 17'hxxxxx;
      expv[5] = 17'h00972;
      expv[6] = 17'h00973;
      expv[7] = 17'hxxxxx;
      expv[8] = 17'hxxxxx;
      expv[9] = 17'hxxxxx;
      expv[10] = 17'h009e2;
      expv[11] = 17'h009e3;
      expv[12] = 17'h009e2;
      expv[13] = 17'h009e2;
      expv[14] = 17'h001dc;
      expv[15] = 17'h001dd;
      expv[16] = 17'hxxxxx;
      expv[17] = 17'hxxxxx;
      expv[18] = 17'hxxxxx;
      expv[19] = 17'hxxxxx;
      expv[20] = 17'h1b16e;
      expv[21] = 17'h1b16f;
      expv[22] = 17'hxxxxx;
      expv[23] = 17'hxxxxx;
      expv[24] = 17'hxxxxx;
      expv[25] = 17'h1fa12;
      expv[26] = 17'h1fa13;
      expv[27] = 17'hxxxxx;
      expv[28] = 17'hxxxxx;
      expv[29] = 17'hxxxxx;
      expv[30] = 17'hxxxxx;
      expv[31] = 17'hxxxxx;
      expv[32] = 17'h1fc8e;
      expv[33] = 17'h1fc8f;
      expv[34] = 17'hxxxxx;
      expv[35] = 17'hxxxxx;
      expv[36] = 17'hxxxxx;
      expv[37] = 17'hxxxxx;
      expv[38] = 17'h01296;
      expv[39] = 17'h01297;
      expv[40] = 17'hxxxxx;
      expv[41] = 17'hxxxxx;
      expv[42] = 17'hxxxxx;
      expv[43] = 17'hxxxxx;
      expv[44] = 17'hxxxxx;
      expv[45] = 17'h011cc;
      expv[46] = 17'h011cd;
      expv[47] = 17'hxxxxx;
      expv[48] = 17'hxxxxx;
      expv[49] = 17'hxxxxx;
      expv[50] = 17'h043b0;
      expv[51] = 17'h043b1;
      expv[52] = 17'h043b0;
      expv[53] = 17'h043b0;
      expv[54] = 17'h00b9a;
      expv[55] = 17'h00b9b;
      expv[56] = 17'h00b9a;
      expv[57] = 17'h00b9a;
      expv[58] = 17'h1f340;
      expv[59] = 17'h1f341;
      expv[60] = 17'h1f340;
      expv[61] = 17'h1f340;
      expv[62] = 17'h1b06e;
      expv[63] = 17'h1b06f;
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
