// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_108400 dut (
    .clk(clk),
    .reset_n(in_vec[46:46]),
    .r(in_vec[45:38]),
    .g(in_vec[37:30]),
    .b(in_vec[29:22]),
    .x_in(in_vec[21:11]),
    .y_in(in_vec[10:0]),
    .is_red(out_vec[27:27]),
    .is_yellow(out_vec[26:26]),
    .is_green(out_vec[25:25]),
    .is_blue(out_vec[24:24]),
    .is_pink(out_vec[23:23]),
    .is_unknown(out_vec[22:22]),
    .x_out(out_vec[21:11]),
    .y_out(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h06390ac845fe;
    stim[1] = 47'h0f0333ac6123;
    stim[2] = 47'h788fae3b4cbf;
    stim[3] = 47'h44b339d31a31;
    stim[4] = 47'h5929f801b9da;
    stim[5] = 47'h5e01b380c4fb;
    stim[6] = 47'h493105f8d1aa;
    stim[7] = 47'h55895cc4de13;
    stim[8] = 47'h78c2cb3f7056;
    stim[9] = 47'h44029743bdf0;
    stim[10] = 47'h5efca38350ae;
    stim[11] = 47'h42d13fb161c0;
    stim[12] = 47'h5ec3cb9d43dc;
    stim[13] = 47'h620b787a3744;
    stim[14] = 47'h77dbae619f1f;
    stim[15] = 47'h7242bd5168b8;
    stim[16] = 47'h7e5479b3fdbc;
    stim[17] = 47'h5d1e82d8301e;
    stim[18] = 47'h4847658cb18b;
    stim[19] = 47'h4b7afde54d70;
    stim[20] = 47'h20b702edb34c;
    stim[21] = 47'h70dd1122316b;
    stim[22] = 47'h61ab99fa80ea;
    stim[23] = 47'h486182730482;
    stim[24] = 47'h5cdf484304de;
    stim[25] = 47'h509e7d9477b0;
    stim[26] = 47'h59e5443713a2;
    stim[27] = 47'h627373ece85d;
    stim[28] = 47'h5934f318c172;
    stim[29] = 47'h7da9b63572cd;
    stim[30] = 47'h6c269b31d23a;
    stim[31] = 47'h4f690335f27d;
    stim[32] = 47'h6b77a0d08e50;
    stim[33] = 47'h4cc12b69d422;
    stim[34] = 47'h5d1fbcab3389;
    stim[35] = 47'h48f372fb0c70;
    stim[36] = 47'h7f346c071abe;
    stim[37] = 47'h7fccdfb8b535;
    stim[38] = 47'h5acf65441767;
    stim[39] = 47'h765bfd340f30;
    stim[40] = 47'h6a27715e36f2;
    stim[41] = 47'h57ff85d7bdca;
    stim[42] = 47'h6e6112b482fc;
    stim[43] = 47'h4d1e3fd8f8e1;
    stim[44] = 47'h56f0486b5cf2;
    stim[45] = 47'h4bbdd678e2f7;
    stim[46] = 47'h72a27afb9ef7;
    stim[47] = 47'h48e70dc04032;
    stim[48] = 47'h785856dde04e;
    stim[49] = 47'h7cdb9e5e2d27;
    stim[50] = 47'h65407d5fa72a;
    stim[51] = 47'h74180b1f4572;
    stim[52] = 47'h571e841d41c5;
    stim[53] = 47'h4452c2e0c6f3;
    stim[54] = 47'h7c4121b2e375;
    stim[55] = 47'h6e0e02c0228b;
    stim[56] = 47'h64b4042d9641;
    stim[57] = 47'h65166e3a0816;
    stim[58] = 47'h42e70d55ddcb;
    stim[59] = 47'h6f0989de479d;
    stim[60] = 47'h598f5d3f8a56;
    stim[61] = 47'h582f86bd49b8;
    stim[62] = 47'h6cabba1317fd;
    stim[63] = 47'h58249aa18f9a;
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
      expv[0] = 28'h0000000;
      expv[1] = 28'h0000000;
      expv[2] = 28'h0000000;
      expv[3] = 28'h0400000;
      expv[4] = 28'h0400000;
      expv[5] = 28'h03b4cbf;
      expv[6] = 28'h1131a31;
      expv[7] = 28'h001b9da;
      expv[8] = 28'h000c4fb;
      expv[9] = 28'h038d1aa;
      expv[10] = 28'h004de13;
      expv[11] = 28'h03f7056;
      expv[12] = 28'h003bdf0;
      expv[13] = 28'h00350ae;
      expv[14] = 28'h03161c0;
      expv[15] = 28'h01d43dc;
      expv[16] = 28'h03a3744;
      expv[17] = 28'h0219f1f;
      expv[18] = 28'h01168b8;
      expv[19] = 28'h033fdbc;
      expv[20] = 28'h0000000;
      expv[21] = 28'h0000000;
      expv[22] = 28'h0400000;
      expv[23] = 28'h0400000;
      expv[24] = 28'h022316b;
      expv[25] = 28'h03a80ea;
      expv[26] = 28'h0330482;
      expv[27] = 28'h00304de;
      expv[28] = 28'h01477b0;
      expv[29] = 28'h03713a2;
      expv[30] = 28'h02ce85d;
      expv[31] = 28'h098c172;
      expv[32] = 28'h03572cd;
      expv[33] = 28'h031d23a;
      expv[34] = 28'h235f27d;
      expv[35] = 28'h0108e50;
      expv[36] = 28'h129d422;
      expv[37] = 28'h02b3389;
      expv[38] = 28'h03b0c70;
      expv[39] = 28'h0071abe;
      expv[40] = 28'h038b535;
      expv[41] = 28'h0041767;
      expv[42] = 28'h0340f30;
      expv[43] = 28'h01e36f2;
      expv[44] = 28'h017bdca;
      expv[45] = 28'h03482fc;
      expv[46] = 28'h018f8e1;
      expv[47] = 28'h22b5cf2;
      expv[48] = 28'h038e2f7;
      expv[49] = 28'h03b9ef7;
      expv[50] = 28'h0004032;
      expv[51] = 28'h81de04e;
      expv[52] = 28'h01e2d27;
      expv[53] = 28'h01fa72a;
      expv[54] = 28'h01f4572;
      expv[55] = 28'h21d41c5;
      expv[56] = 28'h020c6f3;
      expv[57] = 28'h832e375;
      expv[58] = 28'h000228b;
      expv[59] = 28'h02d9641;
      expv[60] = 28'h03a0816;
      expv[61] = 28'h015ddcb;
      expv[62] = 28'h01e479d;
      expv[63] = 28'h03f8a56;
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
