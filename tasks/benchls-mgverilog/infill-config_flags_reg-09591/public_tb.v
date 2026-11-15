// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09591 dut (
    .clock(clk),
    .wrFlags(in_vec[33:33]),
    .config_data(in_vec[32:1]),
    .finish_now(in_vec[0:0]),
    .flags_reg(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h233a9c2f2;
    stim[1] = 34'h3827d9892;
    stim[2] = 34'h043b14a0c;
    stim[3] = 34'h163582348;
    stim[4] = 34'h0cd33b737;
    stim[5] = 34'h1a36d8f02;
    stim[6] = 34'h3834b2ad9;
    stim[7] = 34'h24f1c9696;
    stim[8] = 34'h2aa48b7dd;
    stim[9] = 34'h1da2d21ff;
    stim[10] = 34'h37baec57f;
    stim[11] = 34'h0399130cd;
    stim[12] = 34'h3624ff561;
    stim[13] = 34'h3bbd9c7af;
    stim[14] = 34'h237cd66a4;
    stim[15] = 34'h0ffc84d40;
    stim[16] = 34'h1dac0808d;
    stim[17] = 34'h240905c27;
    stim[18] = 34'h0c9eb3ce7;
    stim[19] = 34'h1d092b18f;
    stim[20] = 34'h16eb37d9f;
    stim[21] = 34'h3cd5112a3;
    stim[22] = 34'h352802ddd;
    stim[23] = 34'h005be93f0;
    stim[24] = 34'h028c19303;
    stim[25] = 34'h1692d4190;
    stim[26] = 34'h224263ad7;
    stim[27] = 34'h0c7c49a8c;
    stim[28] = 34'h1d035abf1;
    stim[29] = 34'h00eeb5881;
    stim[30] = 34'h1946c6cb1;
    stim[31] = 34'h32bf244ae;
    stim[32] = 34'h10bf27d51;
    stim[33] = 34'h0db734506;
    stim[34] = 34'h320242182;
    stim[35] = 34'h08f57febf;
    stim[36] = 34'h13c77a558;
    stim[37] = 34'h221c9b9d5;
    stim[38] = 34'h00134aadd;
    stim[39] = 34'h1e1042032;
    stim[40] = 34'h2d659ae1b;
    stim[41] = 34'h01f0e9648;
    stim[42] = 34'h331f46709;
    stim[43] = 34'h30d617ae0;
    stim[44] = 34'h375e34456;
    stim[45] = 34'h1ebf2155d;
    stim[46] = 34'h15be570e7;
    stim[47] = 34'h047f9275e;
    stim[48] = 34'h33f5a70da;
    stim[49] = 34'h0c9593131;
    stim[50] = 34'h07610f4b3;
    stim[51] = 34'h2760cb079;
    stim[52] = 34'h3710384bb;
    stim[53] = 34'h06e814888;
    stim[54] = 34'h1db13cf65;
    stim[55] = 34'h25f05b610;
    stim[56] = 34'h313aa4cc0;
    stim[57] = 34'h303eff7f5;
    stim[58] = 34'h029b12669;
    stim[59] = 34'h35ce78729;
    stim[60] = 34'h27ad8b815;
    stim[61] = 34'h10065d98a;
    stim[62] = 34'h105ded912;
    stim[63] = 34'h0bd2ff959;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h19d4e179;
      expv[2] = 32'hc13ecc49;
      expv[3] = 32'hc13ecc49;
      expv[4] = 32'hc13ecc49;
      expv[5] = 32'hc13ecc49;
      expv[6] = 32'hc13ecc49;
      expv[7] = 32'hc1a5946c;
      expv[8] = 32'h278e4b4b;
      expv[9] = 32'h55245aee;
      expv[10] = 32'h55245aee;
      expv[11] = 32'hbdd762bf;
      expv[12] = 32'hbdd762bf;
      expv[13] = 32'hb127fab0;
      expv[14] = 32'hddece2d7;
      expv[15] = 32'h1be6b352;
      expv[16] = 32'h1be6b352;
      expv[17] = 32'h1be6b252;
      expv[18] = 32'h20482e13;
      expv[19] = 32'h20482e13;
      expv[20] = 32'h20482e13;
      expv[21] = 32'h20482e13;
      expv[22] = 32'he6a88851;
      expv[23] = 32'ha94016ee;
      expv[24] = 32'ha94016ee;
      expv[25] = 32'ha94016ee;
      expv[26] = 32'ha94016ee;
      expv[27] = 32'h12131c6b;
      expv[28] = 32'h12131c6b;
      expv[29] = 32'h12131c6b;
      expv[30] = 32'h12131c6b;
      expv[31] = 32'h12131c6b;
      expv[32] = 32'h95f92257;
      expv[33] = 32'h95f92257;
      expv[34] = 32'h95f92257;
      expv[35] = 32'h901210c1;
      expv[36] = 32'h901210c1;
      expv[37] = 32'h901210c1;
      expv[38] = 32'h10e4dcea;
      expv[39] = 32'h10e4dcea;
      expv[40] = 32'h10e4dcea;
      expv[41] = 32'h6b2cd60d;
      expv[42] = 32'h6b2cd60d;
      expv[43] = 32'h98fa3284;
      expv[44] = 32'h86b0bd70;
      expv[45] = 32'hbaf1a22b;
      expv[46] = 32'hbaf1a22b;
      expv[47] = 32'hbaf1a22b;
      expv[48] = 32'hbaf1a22b;
      expv[49] = 32'h9fad386d;
      expv[50] = 32'h9fad386d;
      expv[51] = 32'h9fad386d;
      expv[52] = 32'h3b06583c;
      expv[53] = 32'hb881c25d;
      expv[54] = 32'hb881c25d;
      expv[55] = 32'hb881c25d;
      expv[56] = 32'h2f82db08;
      expv[57] = 32'h89d52660;
      expv[58] = 32'h81f7fafa;
      expv[59] = 32'h81f7fafa;
      expv[60] = 32'hae73c294;
      expv[61] = 32'h3d6c5c0a;
      expv[62] = 32'h3d6c5c0a;
      expv[63] = 32'h3d6c5c0a;
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
