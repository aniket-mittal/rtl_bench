// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 26;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  instr_splitter_r dut (
    .instruction(in_vec[31:0]),
    .rs(out_vec[25:21]),
    .rt(out_vec[20:16]),
    .rd(out_vec[15:11]),
    .shamt(out_vec[10:6]),
    .funct(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h56b77680;
    stim[1] = 32'hbe0ca192;
    stim[2] = 32'h5d8a69a5;
    stim[3] = 32'hfe91fdcc;
    stim[4] = 32'h68cb5759;
    stim[5] = 32'h276b2d1a;
    stim[6] = 32'h26de58be;
    stim[7] = 32'he43e20bf;
    stim[8] = 32'hcda2a386;
    stim[9] = 32'hb7f760b7;
    stim[10] = 32'h5ada11ee;
    stim[11] = 32'h37d66b6d;
    stim[12] = 32'hfae1a735;
    stim[13] = 32'hb90e3a39;
    stim[14] = 32'hcb06cbf3;
    stim[15] = 32'h64a3eaa8;
    stim[16] = 32'h4c432dbe;
    stim[17] = 32'ha928032a;
    stim[18] = 32'h4c7b32c1;
    stim[19] = 32'h6f6ceaf2;
    stim[20] = 32'heb034bb7;
    stim[21] = 32'hbd7f697a;
    stim[22] = 32'h8c0bead1;
    stim[23] = 32'hcd22845d;
    stim[24] = 32'h2b179e90;
    stim[25] = 32'h903a74e9;
    stim[26] = 32'ha8c90bd4;
    stim[27] = 32'hc8862e78;
    stim[28] = 32'heb32523c;
    stim[29] = 32'h99695d25;
    stim[30] = 32'hfb0f2c25;
    stim[31] = 32'h0c22f2e4;
    stim[32] = 32'he48363e4;
    stim[33] = 32'h88746fc2;
    stim[34] = 32'ha6178905;
    stim[35] = 32'hc5c4a0f1;
    stim[36] = 32'ha57e1932;
    stim[37] = 32'h291f1465;
    stim[38] = 32'haf817157;
    stim[39] = 32'h24417b38;
    stim[40] = 32'hb6d000b2;
    stim[41] = 32'he20b4349;
    stim[42] = 32'h49705fdd;
    stim[43] = 32'h824753c5;
    stim[44] = 32'hb9249fa4;
    stim[45] = 32'hac198478;
    stim[46] = 32'h7fccdfc4;
    stim[47] = 32'h6ea6c871;
    stim[48] = 32'h58b043e1;
    stim[49] = 32'h280fec62;
    stim[50] = 32'h1fa2c116;
    stim[51] = 32'h0a84df53;
    stim[52] = 32'h49ad3721;
    stim[53] = 32'h6b198d25;
    stim[54] = 32'h2495e208;
    stim[55] = 32'h8bcda827;
    stim[56] = 32'h6ffc26c3;
    stim[57] = 32'hfb184e5e;
    stim[58] = 32'h50606738;
    stim[59] = 32'hbf83489d;
    stim[60] = 32'h342caa40;
    stim[61] = 32'h8ae637d9;
    stim[62] = 32'h11dfc5b1;
    stim[63] = 32'hf144ab33;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 26'h2b77680;
      expv[1] = 26'h20ca192;
      expv[2] = 26'h18a69a5;
      expv[3] = 26'h291fdcc;
      expv[4] = 26'h0cb5759;
      expv[5] = 26'h36b2d1a;
      expv[6] = 26'h2de58be;
      expv[7] = 26'h03e20bf;
      expv[8] = 26'h1a2a386;
      expv[9] = 26'h3f760b7;
      expv[10] = 26'h2da11ee;
      expv[11] = 26'h3d66b6d;
      expv[12] = 26'h2e1a735;
      expv[13] = 26'h10e3a39;
      expv[14] = 26'h306cbf3;
      expv[15] = 26'h0a3eaa8;
      expv[16] = 26'h0432dbe;
      expv[17] = 26'h128032a;
      expv[18] = 26'h07b32c1;
      expv[19] = 26'h36ceaf2;
      expv[20] = 26'h3034bb7;
      expv[21] = 26'h17f697a;
      expv[22] = 26'h00bead1;
      expv[23] = 26'h122845d;
      expv[24] = 26'h3179e90;
      expv[25] = 26'h03a74e9;
      expv[26] = 26'h0c90bd4;
      expv[27] = 26'h0862e78;
      expv[28] = 26'h332523c;
      expv[29] = 26'h1695d25;
      expv[30] = 26'h30f2c25;
      expv[31] = 26'h022f2e4;
      expv[32] = 26'h08363e4;
      expv[33] = 26'h0746fc2;
      expv[34] = 26'h2178905;
      expv[35] = 26'h1c4a0f1;
      expv[36] = 26'h17e1932;
      expv[37] = 26'h11f1465;
      expv[38] = 26'h3817157;
      expv[39] = 26'h0417b38;
      expv[40] = 26'h2d000b2;
      expv[41] = 26'h20b4349;
      expv[42] = 26'h1705fdd;
      expv[43] = 26'h24753c5;
      expv[44] = 26'h1249fa4;
      expv[45] = 26'h0198478;
      expv[46] = 26'h3ccdfc4;
      expv[47] = 26'h2a6c871;
      expv[48] = 26'h0b043e1;
      expv[49] = 26'h00fec62;
      expv[50] = 26'h3a2c116;
      expv[51] = 26'h284df53;
      expv[52] = 26'h1ad3721;
      expv[53] = 26'h3198d25;
      expv[54] = 26'h095e208;
      expv[55] = 26'h3cda827;
      expv[56] = 26'h3fc26c3;
      expv[57] = 26'h3184e5e;
      expv[58] = 26'h0606738;
      expv[59] = 26'h383489d;
      expv[60] = 26'h02caa40;
      expv[61] = 26'h2e637d9;
      expv[62] = 26'h1dfc5b1;
      expv[63] = 26'h144ab33;
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
