// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10745 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h2c02c731;
    stim[1] = 31'h37d2226c;
    stim[2] = 31'h4d0b5e82;
    stim[3] = 31'h5d9a38cc;
    stim[4] = 31'h5d666505;
    stim[5] = 31'h68f2e872;
    stim[6] = 31'h5bf80901;
    stim[7] = 31'h72ca2f14;
    stim[8] = 31'h70f45cc0;
    stim[9] = 31'h55402400;
    stim[10] = 31'h6029a4ac;
    stim[11] = 31'h4676751b;
    stim[12] = 31'h226dfc0c;
    stim[13] = 31'h78c3006d;
    stim[14] = 31'h5a5ab0da;
    stim[15] = 31'h470bffbe;
    stim[16] = 31'h55d056cd;
    stim[17] = 31'h428ebd8e;
    stim[18] = 31'h588b51fd;
    stim[19] = 31'h488538be;
    stim[20] = 31'h4a9a7fe8;
    stim[21] = 31'h74a70004;
    stim[22] = 31'h6a88d616;
    stim[23] = 31'h5f530bc1;
    stim[24] = 31'h6609465f;
    stim[25] = 31'h6eda88b7;
    stim[26] = 31'h7146d7c3;
    stim[27] = 31'h609f50fd;
    stim[28] = 31'h549c947e;
    stim[29] = 31'h72a59eea;
    stim[30] = 31'h4ac0bb41;
    stim[31] = 31'h7653306a;
    stim[32] = 31'h4c8db4d0;
    stim[33] = 31'h15add57b;
    stim[34] = 31'h63c50eed;
    stim[35] = 31'h577f82a6;
    stim[36] = 31'h7ae9e48f;
    stim[37] = 31'h516aaf83;
    stim[38] = 31'h52bbab06;
    stim[39] = 31'h323e1b46;
    stim[40] = 31'h64b29f6d;
    stim[41] = 31'h6e5cc013;
    stim[42] = 31'h5c36f7a2;
    stim[43] = 31'h57b432ae;
    stim[44] = 31'h65c5688b;
    stim[45] = 31'h6afe41e2;
    stim[46] = 31'h6d911455;
    stim[47] = 31'h5c4f3aba;
    stim[48] = 31'h55cab0b5;
    stim[49] = 31'h52d11566;
    stim[50] = 31'h7b7a1eac;
    stim[51] = 31'h7326f304;
    stim[52] = 31'h6d357120;
    stim[53] = 31'h6cd060f4;
    stim[54] = 31'h58db698b;
    stim[55] = 31'h11a4343e;
    stim[56] = 31'h74a162e9;
    stim[57] = 31'h4fd7709e;
    stim[58] = 31'h2ae52eaa;
    stim[59] = 31'h7b996936;
    stim[60] = 31'h4811da35;
    stim[61] = 31'h6cbfaa77;
    stim[62] = 31'h402bb3b2;
    stim[63] = 31'h661793c2;
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
      expv[0] = 36'hxxxxxxxxe;
      expv[1] = 36'hxxxxxxxxc;
      expv[2] = 36'hxxxxxxxxe;
      expv[3] = 36'hxxxxxxxx1;
      expv[4] = 36'hxxxxxxxxb;
      expv[5] = 36'hxxxxxxxxe;
      expv[6] = 36'h000004804;
      expv[7] = 36'h000004803;
      expv[8] = 36'h000002cfe;
      expv[9] = 36'h000003fc1;
      expv[10] = 36'h000003fc1;
      expv[11] = 36'h0000025f4;
      expv[12] = 36'h0000025f3;
      expv[13] = 36'h0000025fc;
      expv[14] = 36'h000000004;
      expv[15] = 36'h000000006;
      expv[16] = 36'h00000000e;
      expv[17] = 36'h00000000e;
      expv[18] = 36'h000000001;
      expv[19] = 36'h000000004;
      expv[20] = 36'h000000003;
      expv[21] = 36'h00000000e;
      expv[22] = 36'h000007e39;
      expv[23] = 36'h0000012d3;
      expv[24] = 36'h0000012d3;
      expv[25] = 36'h000003cbe;
      expv[26] = 36'h0000002b9;
      expv[27] = 36'h000001199;
      expv[28] = 36'h0000022e6;
      expv[29] = 36'h0000022eb;
      expv[30] = 36'h00000381c;
      expv[31] = 36'h000003811;
      expv[32] = 36'h000001586;
      expv[33] = 36'h00000158c;
      expv[34] = 36'h000001583;
      expv[35] = 36'h00000000c;
      expv[36] = 36'h000000006;
      expv[37] = 36'h000001b4b;
      expv[38] = 36'h000001b4c;
      expv[39] = 36'h000001b4e;
      expv[40] = 36'h000001b4b;
      expv[41] = 36'h00000000e;
      expv[42] = 36'h0000004b4;
      expv[43] = 36'h0000004bb;
      expv[44] = 36'h0000004be;
      expv[45] = 36'h0000046fc;
      expv[46] = 36'h000000cb1;
      expv[47] = 36'h0000017b3;
      expv[48] = 36'h0000017bc;
      expv[49] = 36'h0000017b1;
      expv[50] = 36'h0000017bb;
      expv[51] = 36'h000006a3c;
      expv[52] = 36'h0000005b1;
      expv[53] = 36'h0000018d4;
      expv[54] = 36'h00000261b;
      expv[55] = 36'h00000261e;
      expv[56] = 36'h00000261c;
      expv[57] = 36'h000000001;
      expv[58] = 36'h00000000b;
      expv[59] = 36'h00000000c;
      expv[60] = 36'h000000009;
      expv[61] = 36'h000000004;
      expv[62] = 36'h0000023a4;
      expv[63] = 36'h0000023a6;
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
