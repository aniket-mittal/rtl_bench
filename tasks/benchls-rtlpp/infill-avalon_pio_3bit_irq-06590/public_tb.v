// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06590 dut (
    .clk(clk),
    .address(in_vec[39:38]),
    .chipselect(in_vec[37:37]),
    .in_port(in_vec[36:34]),
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
    stim[0] = 40'h857aebc7ba;
    stim[1] = 40'ha189c6187f;
    stim[2] = 40'hdf2f20a90b;
    stim[3] = 40'h4b03450fac;
    stim[4] = 40'h6fb449ba63;
    stim[5] = 40'hf2153bdfc9;
    stim[6] = 40'h8b07cb98de;
    stim[7] = 40'hdb08c0a8f2;
    stim[8] = 40'h1e4d17b9bd;
    stim[9] = 40'h7baac0b662;
    stim[10] = 40'h764669efff;
    stim[11] = 40'hca87cca738;
    stim[12] = 40'h42d165b1a2;
    stim[13] = 40'hd3c8b1d7b1;
    stim[14] = 40'hfad72db8c9;
    stim[15] = 40'hcb25849d25;
    stim[16] = 40'h4f017e50cc;
    stim[17] = 40'ha3f23eb1d2;
    stim[18] = 40'h9e25a274c7;
    stim[19] = 40'hfa94b0c1cf;
    stim[20] = 40'h97286de2f0;
    stim[21] = 40'ha224e7dab5;
    stim[22] = 40'h4a1fb24c11;
    stim[23] = 40'h7320732353;
    stim[24] = 40'hc35524905e;
    stim[25] = 40'h6ef2a41f98;
    stim[26] = 40'h8ee0b3f881;
    stim[27] = 40'h6fcc82c01d;
    stim[28] = 40'h035014a130;
    stim[29] = 40'h22a97189af;
    stim[30] = 40'h5ba0e4eca9;
    stim[31] = 40'h4bee38739c;
    stim[32] = 40'h0718cbd941;
    stim[33] = 40'h221c5a9a0d;
    stim[34] = 40'hef5c39bfa8;
    stim[35] = 40'h93987fa690;
    stim[36] = 40'h1bbe5ad48c;
    stim[37] = 40'hf6c4140e88;
    stim[38] = 40'ha29ab38cf8;
    stim[39] = 40'h7b356368dd;
    stim[40] = 40'hbfd6265330;
    stim[41] = 40'hd7b232fef8;
    stim[42] = 40'h23b461fa13;
    stim[43] = 40'hb21bf3b49f;
    stim[44] = 40'h626c04a146;
    stim[45] = 40'hde026a4a10;
    stim[46] = 40'h439f733b58;
    stim[47] = 40'h8f7e2273a5;
    stim[48] = 40'h7761fbefbf;
    stim[49] = 40'h52651b4a47;
    stim[50] = 40'h47a202af6a;
    stim[51] = 40'h43901c5174;
    stim[52] = 40'h068ca4ed16;
    stim[53] = 40'h3a4424bd50;
    stim[54] = 40'h77bfc351dd;
    stim[55] = 40'h62975b7ae5;
    stim[56] = 40'hcbfc230a27;
    stim[57] = 40'h8fc46bd5c5;
    stim[58] = 40'h2236d8ee53;
    stim[59] = 40'hc674abe865;
    stim[60] = 40'h9687eec68c;
    stim[61] = 40'ha3193effa9;
    stim[62] = 40'h4f1048a6ae;
    stim[63] = 40'ha3dfaec5fd;
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
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000007;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000004;
      expv[9] = 33'h000000007;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000007;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000007;
      expv[15] = 33'h000000007;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000003;
      expv[21] = 33'h000000000;
      expv[22] = 33'h100000000;
      expv[23] = 33'h100000000;
      expv[24] = 33'h100000000;
      expv[25] = 33'h100000003;
      expv[26] = 33'h100000000;
      expv[27] = 33'h100000005;
      expv[28] = 33'h100000000;
      expv[29] = 33'h100000000;
      expv[30] = 33'h100000000;
      expv[31] = 33'h100000000;
      expv[32] = 33'h100000000;
      expv[33] = 33'h100000001;
      expv[34] = 33'h100000000;
      expv[35] = 33'h100000007;
      expv[36] = 33'h100000005;
      expv[37] = 33'h100000006;
      expv[38] = 33'h000000007;
      expv[39] = 33'h000000005;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000007;
      expv[43] = 33'h000000000;
      expv[44] = 33'h100000000;
      expv[45] = 33'h100000000;
      expv[46] = 33'h100000007;
      expv[47] = 33'h100000000;
      expv[48] = 33'h100000007;
      expv[49] = 33'h100000000;
      expv[50] = 33'h100000000;
      expv[51] = 33'h100000000;
      expv[52] = 33'h100000000;
      expv[53] = 33'h100000001;
      expv[54] = 33'h100000006;
      expv[55] = 33'h100000000;
      expv[56] = 33'h100000000;
      expv[57] = 33'h100000007;
      expv[58] = 33'h100000007;
      expv[59] = 33'h100000000;
      expv[60] = 33'h100000007;
      expv[61] = 33'h100000007;
      expv[62] = 33'h100000007;
      expv[63] = 33'h100000000;
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
