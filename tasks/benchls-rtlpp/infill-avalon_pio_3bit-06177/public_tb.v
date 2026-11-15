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

  rtlpp_06177 dut (
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
    stim[0] = 40'h0c6fa54d51;
    stim[1] = 40'hc11cb7eb98;
    stim[2] = 40'hea506cae62;
    stim[3] = 40'h5be2725aec;
    stim[4] = 40'h23ee93d8c5;
    stim[5] = 40'h574c461514;
    stim[6] = 40'h2a651e6db5;
    stim[7] = 40'h5746236a08;
    stim[8] = 40'hf795677f13;
    stim[9] = 40'h47130992e5;
    stim[10] = 40'hf2349e955a;
    stim[11] = 40'hdb71b4f74e;
    stim[12] = 40'h42babf6cd6;
    stim[13] = 40'h366cc4f390;
    stim[14] = 40'h065dcde89e;
    stim[15] = 40'h62901f4523;
    stim[16] = 40'hf2011afbf8;
    stim[17] = 40'h32e1bde700;
    stim[18] = 40'haadae1b073;
    stim[19] = 40'hafed7b9b32;
    stim[20] = 40'h3aae732ef9;
    stim[21] = 40'h6f2ae87db2;
    stim[22] = 40'h9bba7693db;
    stim[23] = 40'h4fec565904;
    stim[24] = 40'hf776d02f4b;
    stim[25] = 40'hbe8e81823c;
    stim[26] = 40'h43fe5a81fa;
    stim[27] = 40'h9f63dfc436;
    stim[28] = 40'h1331bfd3f6;
    stim[29] = 40'h72f0f30db3;
    stim[30] = 40'hd61eabf1f0;
    stim[31] = 40'hc3c3fe3c3e;
    stim[32] = 40'hc6c3a028f3;
    stim[33] = 40'hcfc430dac6;
    stim[34] = 40'h5fba61a23e;
    stim[35] = 40'h8e52126f86;
    stim[36] = 40'h37e051c22c;
    stim[37] = 40'hbb247bcff9;
    stim[38] = 40'h7723bde179;
    stim[39] = 40'h07e148fd5a;
    stim[40] = 40'h8e5600c8ad;
    stim[41] = 40'hea8d636485;
    stim[42] = 40'h8acf0239b3;
    stim[43] = 40'h729aa8adb9;
    stim[44] = 40'h3bb0433e9f;
    stim[45] = 40'he6719e5211;
    stim[46] = 40'hcb409a643e;
    stim[47] = 40'h13d04ae029;
    stim[48] = 40'hab5842c186;
    stim[49] = 40'h7a462a7657;
    stim[50] = 40'hf87a6a16d1;
    stim[51] = 40'h57e82728e9;
    stim[52] = 40'hce4932903f;
    stim[53] = 40'h937446d86b;
    stim[54] = 40'h8a27dbc0e7;
    stim[55] = 40'h4f1453261e;
    stim[56] = 40'h73b3fc5c49;
    stim[57] = 40'h1f8cf5728e;
    stim[58] = 40'h9ec3a2b8f7;
    stim[59] = 40'h6a7d925a84;
    stim[60] = 40'h2e87cecbe8;
    stim[61] = 40'h27f87ef32d;
    stim[62] = 40'h02bb846055;
    stim[63] = 40'h134ebca4a2;
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
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000002;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000007;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000007;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000005;
      expv[15] = 33'h000000001;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000007;
      expv[18] = 33'h000000004;
      expv[19] = 33'h000000000;
      expv[20] = 33'h100000003;
      expv[21] = 33'h100000006;
      expv[22] = 33'h100000000;
      expv[23] = 33'h100000003;
      expv[24] = 33'h100000000;
      expv[25] = 33'h100000007;
      expv[26] = 33'h100000003;
      expv[27] = 33'h100000000;
      expv[28] = 33'h100000004;
      expv[29] = 33'h100000004;
      expv[30] = 33'h100000000;
      expv[31] = 33'h100000007;
      expv[32] = 33'h100000007;
      expv[33] = 33'h100000007;
      expv[34] = 33'h100000007;
      expv[35] = 33'h100000000;
      expv[36] = 33'h100000004;
      expv[37] = 33'h100000005;
      expv[38] = 33'h100000004;
      expv[39] = 33'h100000000;
      expv[40] = 33'h100000001;
      expv[41] = 33'h100000004;
      expv[42] = 33'h000000007;
      expv[43] = 33'h000000004;
      expv[44] = 33'h000000000;
      expv[45] = 33'h100000006;
      expv[46] = 33'h000000004;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000004;
      expv[49] = 33'h100000004;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000007;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000003;
      expv[62] = 33'h000000001;
      expv[63] = 33'h000000000;
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
