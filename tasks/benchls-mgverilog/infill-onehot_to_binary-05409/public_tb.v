// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05409 dut (
    .onehot(in_vec[15:0]),
    .bin(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h137b;
    stim[1] = 16'h62f6;
    stim[2] = 16'h8fcd;
    stim[3] = 16'h6b94;
    stim[4] = 16'hf5c3;
    stim[5] = 16'h9c56;
    stim[6] = 16'hda0a;
    stim[7] = 16'habba;
    stim[8] = 16'h81b4;
    stim[9] = 16'h11a2;
    stim[10] = 16'hc684;
    stim[11] = 16'h8286;
    stim[12] = 16'hc3ac;
    stim[13] = 16'hf180;
    stim[14] = 16'h7506;
    stim[15] = 16'h6225;
    stim[16] = 16'h92b6;
    stim[17] = 16'hd872;
    stim[18] = 16'h1592;
    stim[19] = 16'h5b3c;
    stim[20] = 16'h4162;
    stim[21] = 16'h0e89;
    stim[22] = 16'h856e;
    stim[23] = 16'hd553;
    stim[24] = 16'h6ba0;
    stim[25] = 16'h7f69;
    stim[26] = 16'h14cb;
    stim[27] = 16'h186d;
    stim[28] = 16'hb98f;
    stim[29] = 16'h4af0;
    stim[30] = 16'h6a95;
    stim[31] = 16'hf1e1;
    stim[32] = 16'hda99;
    stim[33] = 16'h0066;
    stim[34] = 16'hd716;
    stim[35] = 16'he7a5;
    stim[36] = 16'h9fec;
    stim[37] = 16'hf45d;
    stim[38] = 16'he329;
    stim[39] = 16'h41c9;
    stim[40] = 16'hd507;
    stim[41] = 16'hedef;
    stim[42] = 16'h2fc9;
    stim[43] = 16'h7957;
    stim[44] = 16'h8be9;
    stim[45] = 16'h5ad4;
    stim[46] = 16'h257f;
    stim[47] = 16'hc3e6;
    stim[48] = 16'h3c05;
    stim[49] = 16'h8b7f;
    stim[50] = 16'h1ed4;
    stim[51] = 16'h9c2b;
    stim[52] = 16'h5797;
    stim[53] = 16'h083a;
    stim[54] = 16'h2657;
    stim[55] = 16'he15e;
    stim[56] = 16'h705c;
    stim[57] = 16'h7422;
    stim[58] = 16'h8df2;
    stim[59] = 16'h6e14;
    stim[60] = 16'h4d7c;
    stim[61] = 16'h5495;
    stim[62] = 16'h21a4;
    stim[63] = 16'h93a4;
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
      expv[0] = 4'hf;
      expv[1] = 4'hf;
      expv[2] = 4'hf;
      expv[3] = 4'hf;
      expv[4] = 4'hf;
      expv[5] = 4'hf;
      expv[6] = 4'hf;
      expv[7] = 4'hf;
      expv[8] = 4'hf;
      expv[9] = 4'hf;
      expv[10] = 4'hf;
      expv[11] = 4'hf;
      expv[12] = 4'hf;
      expv[13] = 4'hf;
      expv[14] = 4'hf;
      expv[15] = 4'hf;
      expv[16] = 4'hf;
      expv[17] = 4'hf;
      expv[18] = 4'hf;
      expv[19] = 4'hf;
      expv[20] = 4'hf;
      expv[21] = 4'hf;
      expv[22] = 4'hf;
      expv[23] = 4'hf;
      expv[24] = 4'hf;
      expv[25] = 4'hf;
      expv[26] = 4'hf;
      expv[27] = 4'hf;
      expv[28] = 4'hf;
      expv[29] = 4'hf;
      expv[30] = 4'hf;
      expv[31] = 4'hf;
      expv[32] = 4'hf;
      expv[33] = 4'h7;
      expv[34] = 4'hf;
      expv[35] = 4'hf;
      expv[36] = 4'hf;
      expv[37] = 4'hf;
      expv[38] = 4'hf;
      expv[39] = 4'hf;
      expv[40] = 4'hf;
      expv[41] = 4'hf;
      expv[42] = 4'hf;
      expv[43] = 4'hf;
      expv[44] = 4'hf;
      expv[45] = 4'hf;
      expv[46] = 4'hf;
      expv[47] = 4'hf;
      expv[48] = 4'hf;
      expv[49] = 4'hf;
      expv[50] = 4'hf;
      expv[51] = 4'hf;
      expv[52] = 4'hf;
      expv[53] = 4'hf;
      expv[54] = 4'hf;
      expv[55] = 4'hf;
      expv[56] = 4'hf;
      expv[57] = 4'hf;
      expv[58] = 4'hf;
      expv[59] = 4'hf;
      expv[60] = 4'hf;
      expv[61] = 4'hf;
      expv[62] = 4'hf;
      expv[63] = 4'hf;
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
