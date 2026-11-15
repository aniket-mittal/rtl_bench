// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_116460 dut (
    .clk(clk),
    .reset_n(in_vec[65:65]),
    .start(in_vec[64:64]),
    .a_in(in_vec[63:32]),
    .b_in(in_vec[31:0]),
    .result(out_vec[32:1]),
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
    stim[0] = 66'h11b2d718f1b005804;
    stim[1] = 66'h12a444806c4af86f4;
    stim[2] = 66'h31a94cdb27bbe69f1;
    stim[3] = 66'h3259ba31b5ef78aef;
    stim[4] = 66'h3217bfe20724ee82a;
    stim[5] = 66'h305700b0156a92f16;
    stim[6] = 66'h2bdc1ae9bb8581afb;
    stim[7] = 66'h38f0d214e441cb393;
    stim[8] = 66'h33ac57b5b6259e964;
    stim[9] = 66'h328ef260e4f8b1a4e;
    stim[10] = 66'h228f1061e1338b01c;
    stim[11] = 66'h38c65c15f449afe67;
    stim[12] = 66'h300d6522df0cddac5;
    stim[13] = 66'h268c036fc7f97aa2d;
    stim[14] = 66'h2971c4cb3f9abdbbb;
    stim[15] = 66'h2bd6fef3317c121bc;
    stim[16] = 66'h310c26617e0f50bd8;
    stim[17] = 66'h232dc4113a8f52503;
    stim[18] = 66'h3342b8c8cfc8a79eb;
    stim[19] = 66'h3000169082456653d;
    stim[20] = 66'h3994ab3a9ccb4a315;
    stim[21] = 66'h33801675a84594217;
    stim[22] = 66'h25ad3061ee7c4ae36;
    stim[23] = 66'h20b592540b7e96be8;
    stim[24] = 66'h3d7ac861cf9c9aa4e;
    stim[25] = 66'h20c7a9372118d0da4;
    stim[26] = 66'h30b378b2dbf70e784;
    stim[27] = 66'h3d0884d455d386874;
    stim[28] = 66'h3b848b49240c50e5b;
    stim[29] = 66'h2f687102963781f7a;
    stim[30] = 66'h305a65f794a3176dd;
    stim[31] = 66'h2dcead39e1674b69e;
    stim[32] = 66'h25a26891475ccca32;
    stim[33] = 66'h2e0509cde5da10352;
    stim[34] = 66'h2bd92ccbd3aec2f06;
    stim[35] = 66'h26a9261daa2ad5760;
    stim[36] = 66'h286fb74874222722e;
    stim[37] = 66'h372d5bb137edbbe38;
    stim[38] = 66'h210cc22e6425baf6d;
    stim[39] = 66'h276cebd069752c4de;
    stim[40] = 66'h375837cd5ffcf4f2e;
    stim[41] = 66'h3cca4748776c4b830;
    stim[42] = 66'h3dd6730cc6da1081e;
    stim[43] = 66'h3f7b052e619d092c9;
    stim[44] = 66'h24529eb0f4dfd757f;
    stim[45] = 66'h2cc5b24f59577e14c;
    stim[46] = 66'h34c57268846dbc398;
    stim[47] = 66'h3ea8e7b3b72483c2d;
    stim[48] = 66'h3206b374d8fe47a70;
    stim[49] = 66'h209e942f6b352ff28;
    stim[50] = 66'h39af0af76eddecdfe;
    stim[51] = 66'h2597a8c8a7a59576d;
    stim[52] = 66'h182dd86876c355f0a;
    stim[53] = 66'h3af33aeb0befa7a4e;
    stim[54] = 66'h2de52657f6f06e14f;
    stim[55] = 66'h35a1d6255c4336ed1;
    stim[56] = 66'h2dc1467582c85a0e6;
    stim[57] = 66'h3a754dc1b6bef83ea;
    stim[58] = 66'h267848a5fbe600113;
    stim[59] = 66'h3ea2b0e53d834d4e2;
    stim[60] = 66'h32b71d06dff43c891;
    stim[61] = 66'h36cec50649b483f01;
    stim[62] = 66'h2232fe887c225c853;
    stim[63] = 66'h307e401300b6d97d7;
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
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
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
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
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
