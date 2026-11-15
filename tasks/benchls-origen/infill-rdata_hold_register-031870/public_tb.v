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

  origen_031870 dut (
    .clk(clk),
    .resetn(in_vec[33:33]),
    .wren(in_vec[32:32]),
    .data(in_vec[31:0]),
    .q(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h130749dd0;
    stim[1] = 34'h02fc0c777;
    stim[2] = 34'h29f4ce99d;
    stim[3] = 34'h3394c3707;
    stim[4] = 34'h24726ebb6;
    stim[5] = 34'h32e6d9a88;
    stim[6] = 34'h2cc832bac;
    stim[7] = 34'h37662ab2f;
    stim[8] = 34'h374006dff;
    stim[9] = 34'h36ca9938f;
    stim[10] = 34'h2081a0d60;
    stim[11] = 34'h2302afd95;
    stim[12] = 34'h246729ee5;
    stim[13] = 34'h205cee0ed;
    stim[14] = 34'h3fd397104;
    stim[15] = 34'h3940e09c5;
    stim[16] = 34'h2800b59c6;
    stim[17] = 34'h24393eed5;
    stim[18] = 34'h2c35b0c7f;
    stim[19] = 34'h3ac4b529e;
    stim[20] = 34'h334ccfc7a;
    stim[21] = 34'h29865d0d4;
    stim[22] = 34'h25787af38;
    stim[23] = 34'h29adfa2c0;
    stim[24] = 34'h3d6034cc9;
    stim[25] = 34'h2385ab0b9;
    stim[26] = 34'h37741be99;
    stim[27] = 34'h202c2db86;
    stim[28] = 34'h107e596f5;
    stim[29] = 34'h279b868eb;
    stim[30] = 34'h305806b7c;
    stim[31] = 34'h3c7d8c438;
    stim[32] = 34'h22dc99c15;
    stim[33] = 34'h2513452f6;
    stim[34] = 34'h3235222c9;
    stim[35] = 34'h2897d3acc;
    stim[36] = 34'h38532d177;
    stim[37] = 34'h3ef35e783;
    stim[38] = 34'h3823261e3;
    stim[39] = 34'h305e2d75a;
    stim[40] = 34'h23231c893;
    stim[41] = 34'h3c0657d9b;
    stim[42] = 34'h212e5ee6e;
    stim[43] = 34'h35c31720a;
    stim[44] = 34'h187fe2a77;
    stim[45] = 34'h3f1acb5e7;
    stim[46] = 34'h3408bbc79;
    stim[47] = 34'h3b53f19ff;
    stim[48] = 34'h2e963431f;
    stim[49] = 34'h22ea6ed0e;
    stim[50] = 34'h340e707fb;
    stim[51] = 34'h3e8d77e36;
    stim[52] = 34'h2c13607d1;
    stim[53] = 34'h20874e844;
    stim[54] = 34'h39d22dbbb;
    stim[55] = 34'h3caf347fd;
    stim[56] = 34'h30fdf5014;
    stim[57] = 34'h33e95e6a6;
    stim[58] = 34'h34221fa7b;
    stim[59] = 34'h2df9581b4;
    stim[60] = 34'h2af6f5fb2;
    stim[61] = 34'h3e1c488f5;
    stim[62] = 34'h258345b89;
    stim[63] = 34'h3e020636d;
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
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h394c3707;
      expv[5] = 32'h394c3707;
      expv[6] = 32'h2e6d9a88;
      expv[7] = 32'h2e6d9a88;
      expv[8] = 32'h7662ab2f;
      expv[9] = 32'h74006dff;
      expv[10] = 32'h6ca9938f;
      expv[11] = 32'h6ca9938f;
      expv[12] = 32'h6ca9938f;
      expv[13] = 32'h6ca9938f;
      expv[14] = 32'h6ca9938f;
      expv[15] = 32'hfd397104;
      expv[16] = 32'h940e09c5;
      expv[17] = 32'h940e09c5;
      expv[18] = 32'h940e09c5;
      expv[19] = 32'h940e09c5;
      expv[20] = 32'hac4b529e;
      expv[21] = 32'h34ccfc7a;
      expv[22] = 32'h34ccfc7a;
      expv[23] = 32'h34ccfc7a;
      expv[24] = 32'h34ccfc7a;
      expv[25] = 32'hd6034cc9;
      expv[26] = 32'hd6034cc9;
      expv[27] = 32'h7741be99;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h05806b7c;
      expv[32] = 32'hc7d8c438;
      expv[33] = 32'hc7d8c438;
      expv[34] = 32'hc7d8c438;
      expv[35] = 32'h235222c9;
      expv[36] = 32'h235222c9;
      expv[37] = 32'h8532d177;
      expv[38] = 32'hef35e783;
      expv[39] = 32'h823261e3;
      expv[40] = 32'h05e2d75a;
      expv[41] = 32'h05e2d75a;
      expv[42] = 32'hc0657d9b;
      expv[43] = 32'hc0657d9b;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'hf1acb5e7;
      expv[47] = 32'h408bbc79;
      expv[48] = 32'hb53f19ff;
      expv[49] = 32'hb53f19ff;
      expv[50] = 32'hb53f19ff;
      expv[51] = 32'h40e707fb;
      expv[52] = 32'he8d77e36;
      expv[53] = 32'he8d77e36;
      expv[54] = 32'he8d77e36;
      expv[55] = 32'h9d22dbbb;
      expv[56] = 32'hcaf347fd;
      expv[57] = 32'h0fdf5014;
      expv[58] = 32'h3e95e6a6;
      expv[59] = 32'h4221fa7b;
      expv[60] = 32'h4221fa7b;
      expv[61] = 32'h4221fa7b;
      expv[62] = 32'he1c488f5;
      expv[63] = 32'he1c488f5;
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
