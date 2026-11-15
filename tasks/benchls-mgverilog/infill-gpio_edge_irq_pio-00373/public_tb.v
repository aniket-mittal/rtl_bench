// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00373 dut (
    .clk(clk),
    .address(in_vec[38:37]),
    .chipselect(in_vec[36:36]),
    .in_port(in_vec[35:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h05d133cbe3;
    stim[1] = 39'h0d74b5f7a0;
    stim[2] = 39'h1e69830ac6;
    stim[3] = 39'h47b3143971;
    stim[4] = 39'h3a25ebefc8;
    stim[5] = 39'h479dc7a8d2;
    stim[6] = 39'h4ebb9a190c;
    stim[7] = 39'h2ead5afc90;
    stim[8] = 39'h1e320ed631;
    stim[9] = 39'h7e00c155a2;
    stim[10] = 39'h3adcd95fd3;
    stim[11] = 39'h46c5a20c87;
    stim[12] = 39'h3e4d620c8e;
    stim[13] = 39'h46969cedae;
    stim[14] = 39'h37d39ec8d5;
    stim[15] = 39'h3ee0eda361;
    stim[16] = 39'h623fa6a9ef;
    stim[17] = 39'h5eb27ad3ec;
    stim[18] = 39'h1bbab6a7c4;
    stim[19] = 39'h7f3cec7baa;
    stim[20] = 39'h4a5dbfc3b8;
    stim[21] = 39'h7fd0d0c9d7;
    stim[22] = 39'h62ce2eff6a;
    stim[23] = 39'h33f2879415;
    stim[24] = 39'h33c61ecbaa;
    stim[25] = 39'h663426db01;
    stim[26] = 39'h722a2a8b0c;
    stim[27] = 39'h0382cb37d8;
    stim[28] = 39'h26672f321b;
    stim[29] = 39'h0f6884f1bc;
    stim[30] = 39'h43a3a07632;
    stim[31] = 39'h7eaadc1980;
    stim[32] = 39'h677df7482b;
    stim[33] = 39'h37375a8b53;
    stim[34] = 39'h32b6e5b6f5;
    stim[35] = 39'h069e14a256;
    stim[36] = 39'h26b0cec752;
    stim[37] = 39'h3a0146d24d;
    stim[38] = 39'h0ee6fe79bb;
    stim[39] = 39'h21659c30cb;
    stim[40] = 39'h2f3d1e1cc4;
    stim[41] = 39'h72da2fceb0;
    stim[42] = 39'h6e3a57470a;
    stim[43] = 39'h53261b76a5;
    stim[44] = 39'h02adaf66e1;
    stim[45] = 39'h46912cc1ed;
    stim[46] = 39'h7b7582e438;
    stim[47] = 39'h1fa8722ac4;
    stim[48] = 39'h669df81513;
    stim[49] = 39'h6e0ada7bcd;
    stim[50] = 39'h36cfb973c0;
    stim[51] = 39'h3b7d852b00;
    stim[52] = 39'h468f4cb753;
    stim[53] = 39'h0653cef95e;
    stim[54] = 39'h2b21aee583;
    stim[55] = 39'h56a764701b;
    stim[56] = 39'h3b83d1aee3;
    stim[57] = 39'h5232a421c0;
    stim[58] = 39'h139d9a570e;
    stim[59] = 39'h66a05ecadf;
    stim[60] = 39'h4340f37a8f;
    stim[61] = 39'h2a7fefcf48;
    stim[62] = 39'h6b5b70343d;
    stim[63] = 39'h5f3f3b2177;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000003;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000003;
      expv[10] = 33'h000000003;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000003;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000002;
      expv[20] = 33'h000000003;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000003;
      expv[23] = 33'h000000003;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000003;
      expv[27] = 33'h000000003;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000003;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000003;
      expv[33] = 33'h000000003;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000001;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000003;
      expv[48] = 33'h000000003;
      expv[49] = 33'h000000003;
      expv[50] = 33'h000000003;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000001;
      expv[55] = 33'h000000000;
      expv[56] = 33'h100000000;
      expv[57] = 33'h100000000;
      expv[58] = 33'h000000003;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000003;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000003;
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
