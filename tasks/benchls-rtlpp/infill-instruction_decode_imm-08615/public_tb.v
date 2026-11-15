// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08615 dut (
    .clk(clk),
    .rst_n(in_vec[36:36]),
    .write_enable(in_vec[35:35]),
    .write_data(in_vec[34:3]),
    .imm_16_out(in_vec[2:2]),
    .imm_20_out(in_vec[1:1]),
    .sign_extend(in_vec[0:0]),
    .a_out(out_vec[63:32]),
    .current_instruction(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h0947edc50f;
    stim[1] = 37'h0636517310;
    stim[2] = 37'h166da3a6c1;
    stim[3] = 37'h1bbcd2cb1b;
    stim[4] = 37'h125e23e1d8;
    stim[5] = 37'h12ad8337dc;
    stim[6] = 37'h10853ad679;
    stim[7] = 37'h169f63a24a;
    stim[8] = 37'h187a8ad56f;
    stim[9] = 37'h10acbde249;
    stim[10] = 37'h1a15c770db;
    stim[11] = 37'h19e9b3b41b;
    stim[12] = 37'h1d5a6777f6;
    stim[13] = 37'h101a4b0e48;
    stim[14] = 37'h1169d7b5d0;
    stim[15] = 37'h110c5d9b1b;
    stim[16] = 37'h162638c72f;
    stim[17] = 37'h1d4ac5c889;
    stim[18] = 37'h18aeb959a0;
    stim[19] = 37'h1b6d4eded0;
    stim[20] = 37'h162b8caf3b;
    stim[21] = 37'h1ce13489d1;
    stim[22] = 37'h1aa67eed52;
    stim[23] = 37'h11f182a4fb;
    stim[24] = 37'h1c1320963b;
    stim[25] = 37'h1745a966e8;
    stim[26] = 37'h10166d96d5;
    stim[27] = 37'h1b37b784d4;
    stim[28] = 37'h1210d0cf77;
    stim[29] = 37'h132da3e196;
    stim[30] = 37'h10a4266073;
    stim[31] = 37'h1081a043b9;
    stim[32] = 37'h16c4b7d0a5;
    stim[33] = 37'h1bce3bb67d;
    stim[34] = 37'h1d84c5d9e6;
    stim[35] = 37'h14d18eb50a;
    stim[36] = 37'h12a395f107;
    stim[37] = 37'h1ccbfdf059;
    stim[38] = 37'h165b528c59;
    stim[39] = 37'h1cb25c88f8;
    stim[40] = 37'h191780ef36;
    stim[41] = 37'h17ca8590c1;
    stim[42] = 37'h1e550edba1;
    stim[43] = 37'h15368a0ead;
    stim[44] = 37'h13413f95f4;
    stim[45] = 37'h1aa6795c2f;
    stim[46] = 37'h1a98cee6be;
    stim[47] = 37'h1e39244d90;
    stim[48] = 37'h1cd78c264f;
    stim[49] = 37'h1ff5a619b0;
    stim[50] = 37'h13539a88b4;
    stim[51] = 37'h190a9d2e7f;
    stim[52] = 37'h194ce8eeb2;
    stim[53] = 37'h17982f9d78;
    stim[54] = 37'h18dd10f85f;
    stim[55] = 37'h15cb6f0d13;
    stim[56] = 37'h197fbcd127;
    stim[57] = 37'h17e31b410c;
    stim[58] = 37'h1b20dea0ae;
    stim[59] = 37'h1a404dcee6;
    stim[60] = 37'h16ff746f0e;
    stim[61] = 37'h16610a812a;
    stim[62] = 37'h1dbed864c7;
    stim[63] = 37'h103d0269bb;
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
      expv[0] = 64'hxxxxxxxx00000000;
      expv[1] = 64'hxxxxxxxx00000000;
      expv[2] = 64'hxxxxxxxx00000000;
      expv[3] = 64'hxxxxxxxx00000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'hxxxxxxxx779a5963;
      expv[6] = 64'h00005963779a5963;
      expv[7] = 64'hxxxxxxxx779a5963;
      expv[8] = 64'h000a5963779a5963;
      expv[9] = 64'h00005963779a5963;
      expv[10] = 64'hxxxxxxxx0f515aad;
      expv[11] = 64'h00015aad0f515aad;
      expv[12] = 64'hfff8ee1b42b8ee1b;
      expv[13] = 64'h000076833d367683;
      expv[14] = 64'hxxxxxxxxab4ceefe;
      expv[15] = 64'hxxxxxxxxab4ceefe;
      expv[16] = 64'hfffceefeab4ceefe;
      expv[17] = 64'hffffeefeab4ceefe;
      expv[18] = 64'hxxxxxxxxab4ceefe;
      expv[19] = 64'hxxxxxxxxa958b911;
      expv[20] = 64'hxxxxxxxx15d72b34;
      expv[21] = 64'hfff9dbda6da9dbda;
      expv[22] = 64'hxxxxxxxx6da9dbda;
      expv[23] = 64'h0006913a9c26913a;
      expv[24] = 64'hffffddaa54cfddaa;
      expv[25] = 64'hffffddaa54cfddaa;
      expv[26] = 64'hxxxxxxxx826412c7;
      expv[27] = 64'h000012c7826412c7;
      expv[28] = 64'h000012c7826412c7;
      expv[29] = 64'hfffff09a66f6f09a;
      expv[30] = 64'h0000f09a66f6f09a;
      expv[31] = 64'h0006f09a66f6f09a;
      expv[32] = 64'hxxxxxxxx66f6f09a;
      expv[33] = 64'hfffff09a66f6f09a;
      expv[34] = 64'hfffff09a66f6f09a;
      expv[35] = 64'h000076cf79c776cf;
      expv[36] = 64'h0008bb3cb098bb3c;
      expv[37] = 64'hffffbb3cb098bb3c;
      expv[38] = 64'hxxxxxxxxb098bb3c;
      expv[39] = 64'hxxxxxxxx997fbe0b;
      expv[40] = 64'hxxxxxxxx997fbe0b;
      expv[41] = 64'h0000911f964b911f;
      expv[42] = 64'hxxxxxxxx22f01de6;
      expv[43] = 64'hxxxxxxxx22f01de6;
      expv[44] = 64'hffffdb74caa1db74;
      expv[45] = 64'h0000db74caa1db74;
      expv[46] = 64'hffffdb74caa1db74;
      expv[47] = 64'h00002b8554cf2b85;
      expv[48] = 64'hxxxxxxxx5319dcd7;
      expv[49] = 64'hffff89b2c72489b2;
      expv[50] = 64'hxxxxxxxx9af184c9;
      expv[51] = 64'h0000c336feb4c336;
      expv[52] = 64'hffffc336feb4c336;
      expv[53] = 64'h0003a5cf2153a5cf;
      expv[54] = 64'hxxxxxxxx299d1dd6;
      expv[55] = 64'h00001dd6299d1dd6;
      expv[56] = 64'h00021f0b1ba21f0b;
      expv[57] = 64'h00001f0b1ba21f0b;
      expv[58] = 64'h00009a242ff79a24;
      expv[59] = 64'h00009a242ff79a24;
      expv[60] = 64'h0000d415641bd415;
      expv[61] = 64'h0000b9dc4809b9dc;
      expv[62] = 64'h0009b9dc4809b9dc;
      expv[63] = 64'hffffb9dc4809b9dc;
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
