// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_215927 dut (
    .TMCLK(clk),
    .DSPCLK(in_vec[27:27]),
    .T_RST(in_vec[26:26]),
    .TMODE(in_vec[25:25]),
    .DMD(in_vec[24:9]),
    .selTSR(in_vec[8:8]),
    .selTCR(in_vec[7:7]),
    .selTPR(in_vec[6:6]),
    .TSR_we(in_vec[5:5]),
    .TCR_we(in_vec[4:4]),
    .TPR_we(in_vec[3:3]),
    .MSTAT5(in_vec[2:2]),
    .MMR_web(in_vec[1:1]),
    .ICE_ST(in_vec[0:0]),
    .TMOUT(out_vec[16:1]),
    .TINT(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'h5a3dc8c;
    stim[1] = 28'he44f556;
    stim[2] = 28'h25109e1;
    stim[3] = 28'h9e718b3;
    stim[4] = 28'h9e17da3;
    stim[5] = 28'h8e4c15e;
    stim[6] = 28'h12f26c3;
    stim[7] = 28'hbc893b4;
    stim[8] = 28'h301d9be;
    stim[9] = 28'ha9fd972;
    stim[10] = 28'h9f3ef8e;
    stim[11] = 28'hb96c56b;
    stim[12] = 28'ha97ba2d;
    stim[13] = 28'hba3d494;
    stim[14] = 28'h0983d4e;
    stim[15] = 28'h9b6e3d5;
    stim[16] = 28'h24e8ed3;
    stim[17] = 28'had0e3ca;
    stim[18] = 28'h8ef8cea;
    stim[19] = 28'h20fe741;
    stim[20] = 28'hbf582c2;
    stim[21] = 28'h1cb3606;
    stim[22] = 28'h3554535;
    stim[23] = 28'h8285c9f;
    stim[24] = 28'h162b7df;
    stim[25] = 28'h8431416;
    stim[26] = 28'hb6291b4;
    stim[27] = 28'h378c70c;
    stim[28] = 28'h081b10a;
    stim[29] = 28'h2798f88;
    stim[30] = 28'h8d65d4c;
    stim[31] = 28'ha1b4368;
    stim[32] = 28'h2a86c6b;
    stim[33] = 28'h32fe4f3;
    stim[34] = 28'h18c75c1;
    stim[35] = 28'h9157b30;
    stim[36] = 28'h3d8ec87;
    stim[37] = 28'h33defc2;
    stim[38] = 28'ha5e5531;
    stim[39] = 28'h0e8a6cf;
    stim[40] = 28'h35137ec;
    stim[41] = 28'h8f2de51;
    stim[42] = 28'h1d84219;
    stim[43] = 28'h343d2fe;
    stim[44] = 28'ha9c30fe;
    stim[45] = 28'h2c5ed71;
    stim[46] = 28'hb9d76e0;
    stim[47] = 28'h190e548;
    stim[48] = 28'h21ab6f0;
    stim[49] = 28'ha0b1985;
    stim[50] = 28'hb93abea;
    stim[51] = 28'h1b3d375;
    stim[52] = 28'haacb7c7;
    stim[53] = 28'ha35f246;
    stim[54] = 28'h35dee97;
    stim[55] = 28'h3ca6dfd;
    stim[56] = 28'h2194c50;
    stim[57] = 28'h9646d92;
    stim[58] = 28'h8264ec7;
    stim[59] = 28'h82aecb2;
    stim[60] = 28'h36bbac3;
    stim[61] = 28'h8916d99;
    stim[62] = 28'h11ada61;
    stim[63] = 28'h9efd422;
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
      expv[3] = 17'h044fx;
      expv[4] = 17'h1e71x;
      expv[5] = 17'h1e17x;
      expv[6] = 17'h0e4cx;
      expv[7] = 17'h1e17x;
      expv[8] = 17'h1c89x;
      expv[9] = 17'h101dx;
      expv[10] = 17'h09fdx;
      expv[11] = 17'h09fdx;
      expv[12] = 17'h196cx;
      expv[13] = 17'h09fdx;
      expv[14] = 17'h097bx;
      expv[15] = 17'h097bx;
      expv[16] = 17'h1b6ex;
      expv[17] = 17'h097bx;
      expv[18] = 17'h04e8x;
      expv[19] = 17'h0ef8x;
      expv[20] = 17'h04e8x;
      expv[21] = 17'h0ef8x;
      expv[22] = 17'h0ef8x;
      expv[23] = 17'h1554x;
      expv[24] = 17'h1554x;
      expv[25] = 17'h162bx;
      expv[26] = 17'h1554x;
      expv[27] = 17'h1629x;
      expv[28] = 17'h1629x;
      expv[29] = 17'h1629x;
      expv[30] = 17'h1629x;
      expv[31] = 17'h1629x;
      expv[32] = 17'h01b4x;
      expv[33] = 17'h1629x;
      expv[34] = 17'h12fex;
      expv[35] = 17'h12fex;
      expv[36] = 17'h1157x;
      expv[37] = 17'h1157x;
      expv[38] = 17'h1157x;
      expv[39] = 17'h05e5x;
      expv[40] = 17'h05e5x;
      expv[41] = 17'h1513x;
      expv[42] = 17'h1513x;
      expv[43] = 17'h1d84x;
      expv[44] = 17'h143dx;
      expv[45] = 17'h09c3x;
      expv[46] = 17'h0c5ex;
      expv[47] = 17'h19d7x;
      expv[48] = 17'h0c5ex;
      expv[49] = 17'h01abx;
      expv[50] = 17'h01abx;
      expv[51] = 17'h193ax;
      expv[52] = 17'h1b3dx;
      expv[53] = 17'h193ax;
      expv[54] = 17'h1b3dx;
      expv[55] = 17'h1b3dx;
      expv[56] = 17'h1ca6x;
      expv[57] = 17'h1ca6x;
      expv[58] = 17'h1646x;
      expv[59] = 17'h1646x;
      expv[60] = 17'h02aex;
      expv[61] = 17'h02aex;
      expv[62] = 17'h0916x;
      expv[63] = 17'h0916x;
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
