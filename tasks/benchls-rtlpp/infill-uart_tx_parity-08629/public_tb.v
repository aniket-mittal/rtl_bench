// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08629 dut (
    .clk(clk),
    .rst_n(in_vec[35:35]),
    .TxD(in_vec[34:27]),
    .ctrl(in_vec[26:16]),
    .startTx(in_vec[15:15]),
    .baudRate(in_vec[14:0]),
    .finished(out_vec[1:1]),
    .Tx(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h2d3e4f8ba;
    stim[1] = 36'h1457e4770;
    stim[2] = 36'hb6ca614c3;
    stim[3] = 36'hde1a51b9e;
    stim[4] = 36'h9d8b922ac;
    stim[5] = 36'hd80ce7a20;
    stim[6] = 36'hf7e1a8f0e;
    stim[7] = 36'ha8d5567df;
    stim[8] = 36'h83585529d;
    stim[9] = 36'h9fd3eef7e;
    stim[10] = 36'hc6733fbce;
    stim[11] = 36'hb331d9d80;
    stim[12] = 36'hb56ffbf33;
    stim[13] = 36'hc940a9c8c;
    stim[14] = 36'hafc3a592d;
    stim[15] = 36'hbca71361a;
    stim[16] = 36'h99bf65015;
    stim[17] = 36'h9a3237aaf;
    stim[18] = 36'hdb8bc7b45;
    stim[19] = 36'h8e59c80f0;
    stim[20] = 36'hdcf2c8a40;
    stim[21] = 36'hf7a705cf2;
    stim[22] = 36'hd130ae617;
    stim[23] = 36'h9aaa427a5;
    stim[24] = 36'hfc23cb705;
    stim[25] = 36'h9fa8e5aa3;
    stim[26] = 36'hf7e8b9224;
    stim[27] = 36'hcbfe8d70e;
    stim[28] = 36'hfd427c54e;
    stim[29] = 36'h9824e3c6d;
    stim[30] = 36'hdbb3df2bd;
    stim[31] = 36'h838bc74b9;
    stim[32] = 36'hc2df7372b;
    stim[33] = 36'h9ce3d0cbb;
    stim[34] = 36'h00d01b74a;
    stim[35] = 36'ha1385ae54;
    stim[36] = 36'hf2b773da1;
    stim[37] = 36'h408d03dad;
    stim[38] = 36'hd4723c092;
    stim[39] = 36'hb9b9eab08;
    stim[40] = 36'h90e4bc05b;
    stim[41] = 36'hd928ec026;
    stim[42] = 36'hcae941abe;
    stim[43] = 36'ha06831c5d;
    stim[44] = 36'hf99574741;
    stim[45] = 36'hf4f389549;
    stim[46] = 36'h81c4bb65d;
    stim[47] = 36'hd670f5d36;
    stim[48] = 36'hffbb7e5d2;
    stim[49] = 36'hb785e3138;
    stim[50] = 36'hf17917cb1;
    stim[51] = 36'hb4b128c4e;
    stim[52] = 36'hdefcd424b;
    stim[53] = 36'hb524fe21b;
    stim[54] = 36'hd080cb63d;
    stim[55] = 36'hf2d9203a7;
    stim[56] = 36'he45976229;
    stim[57] = 36'hfac07543a;
    stim[58] = 36'hae87cc1a2;
    stim[59] = 36'ha2dd56a61;
    stim[60] = 36'h8b03dfcfe;
    stim[61] = 36'hf075566c8;
    stim[62] = 36'h9149b0600;
    stim[63] = 36'hfc333e737;
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
      expv[0] = 2'h1;
      expv[1] = 2'h1;
      expv[2] = 2'h1;
      expv[3] = 2'h1;
      expv[4] = 2'h1;
      expv[5] = 2'h1;
      expv[6] = 2'h1;
      expv[7] = 2'h1;
      expv[8] = 2'h1;
      expv[9] = 2'h1;
      expv[10] = 2'h1;
      expv[11] = 2'h1;
      expv[12] = 2'h1;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h1;
      expv[19] = 2'h1;
      expv[20] = 2'h1;
      expv[21] = 2'h1;
      expv[22] = 2'h1;
      expv[23] = 2'h1;
      expv[24] = 2'h1;
      expv[25] = 2'h1;
      expv[26] = 2'h1;
      expv[27] = 2'h1;
      expv[28] = 2'h1;
      expv[29] = 2'h1;
      expv[30] = 2'h1;
      expv[31] = 2'h1;
      expv[32] = 2'h1;
      expv[33] = 2'h1;
      expv[34] = 2'h1;
      expv[35] = 2'h1;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h1;
      expv[39] = 2'h1;
      expv[40] = 2'h1;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h1;
      expv[44] = 2'h1;
      expv[45] = 2'h1;
      expv[46] = 2'h1;
      expv[47] = 2'h1;
      expv[48] = 2'h1;
      expv[49] = 2'h1;
      expv[50] = 2'h1;
      expv[51] = 2'h1;
      expv[52] = 2'h1;
      expv[53] = 2'h1;
      expv[54] = 2'h1;
      expv[55] = 2'h1;
      expv[56] = 2'h1;
      expv[57] = 2'h1;
      expv[58] = 2'h1;
      expv[59] = 2'h1;
      expv[60] = 2'h1;
      expv[61] = 2'h1;
      expv[62] = 2'h1;
      expv[63] = 2'h1;
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
