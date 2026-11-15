// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08619 dut (
    .CLK(clk),
    .Din(in_vec[31:0]),
    .Dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'ha438fee4;
    stim[1] = 32'hb9622a84;
    stim[2] = 32'he7b689d9;
    stim[3] = 32'he3025fa7;
    stim[4] = 32'hfa26277b;
    stim[5] = 32'hf466a5cf;
    stim[6] = 32'h063329cc;
    stim[7] = 32'he0e0d3f6;
    stim[8] = 32'h2708fcb3;
    stim[9] = 32'h40bd0b37;
    stim[10] = 32'h89c3e995;
    stim[11] = 32'hd366b7ca;
    stim[12] = 32'hdade9456;
    stim[13] = 32'h9e455a0d;
    stim[14] = 32'hc9464f77;
    stim[15] = 32'hafdd3d3a;
    stim[16] = 32'h43dc5b7a;
    stim[17] = 32'h5946a6eb;
    stim[18] = 32'h739ac75b;
    stim[19] = 32'hef9edd4f;
    stim[20] = 32'h46bae901;
    stim[21] = 32'ha860f50c;
    stim[22] = 32'hbc6f3775;
    stim[23] = 32'he4cb8698;
    stim[24] = 32'hf2570099;
    stim[25] = 32'ha0d6621e;
    stim[26] = 32'h246aa9ee;
    stim[27] = 32'he38c673d;
    stim[28] = 32'h982b63d5;
    stim[29] = 32'ha5b8de7a;
    stim[30] = 32'h4424be27;
    stim[31] = 32'hbbc41f6a;
    stim[32] = 32'h0f9cc3d3;
    stim[33] = 32'h80be1290;
    stim[34] = 32'h28b81623;
    stim[35] = 32'h17da149c;
    stim[36] = 32'h64fdfd81;
    stim[37] = 32'h4fb5f540;
    stim[38] = 32'h2683d58d;
    stim[39] = 32'h7be87184;
    stim[40] = 32'h816231a5;
    stim[41] = 32'h5676b446;
    stim[42] = 32'h28c61e0b;
    stim[43] = 32'h3fa67c32;
    stim[44] = 32'h08c71776;
    stim[45] = 32'h33a2048b;
    stim[46] = 32'h37581eea;
    stim[47] = 32'ha1a755e8;
    stim[48] = 32'h577815c6;
    stim[49] = 32'h349c6379;
    stim[50] = 32'hf96f9901;
    stim[51] = 32'ha5a6ade8;
    stim[52] = 32'h9d691a8b;
    stim[53] = 32'hd726578c;
    stim[54] = 32'hf904c1d4;
    stim[55] = 32'h7a25e20d;
    stim[56] = 32'h1914a64c;
    stim[57] = 32'h217bab25;
    stim[58] = 32'h15d947fc;
    stim[59] = 32'h2361f2eb;
    stim[60] = 32'h72b0f78c;
    stim[61] = 32'h1752b226;
    stim[62] = 32'h7fc1c9ac;
    stim[63] = 32'he32850a9;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'ha438fee4;
      expv[3] = 32'hb9622a84;
      expv[4] = 32'he7b689d9;
      expv[5] = 32'he3025fa7;
      expv[6] = 32'hfa26277b;
      expv[7] = 32'hf466a5cf;
      expv[8] = 32'h063329cc;
      expv[9] = 32'he0e0d3f6;
      expv[10] = 32'h2708fcb3;
      expv[11] = 32'h40bd0b37;
      expv[12] = 32'h89c3e995;
      expv[13] = 32'hd366b7ca;
      expv[14] = 32'hdade9456;
      expv[15] = 32'h9e455a0d;
      expv[16] = 32'hc9464f77;
      expv[17] = 32'hafdd3d3a;
      expv[18] = 32'h43dc5b7a;
      expv[19] = 32'h5946a6eb;
      expv[20] = 32'h739ac75b;
      expv[21] = 32'hef9edd4f;
      expv[22] = 32'h46bae901;
      expv[23] = 32'ha860f50c;
      expv[24] = 32'hbc6f3775;
      expv[25] = 32'he4cb8698;
      expv[26] = 32'hf2570099;
      expv[27] = 32'ha0d6621e;
      expv[28] = 32'h246aa9ee;
      expv[29] = 32'he38c673d;
      expv[30] = 32'h982b63d5;
      expv[31] = 32'ha5b8de7a;
      expv[32] = 32'h4424be27;
      expv[33] = 32'hbbc41f6a;
      expv[34] = 32'h0f9cc3d3;
      expv[35] = 32'h80be1290;
      expv[36] = 32'h28b81623;
      expv[37] = 32'h17da149c;
      expv[38] = 32'h64fdfd81;
      expv[39] = 32'h4fb5f540;
      expv[40] = 32'h2683d58d;
      expv[41] = 32'h7be87184;
      expv[42] = 32'h816231a5;
      expv[43] = 32'h5676b446;
      expv[44] = 32'h28c61e0b;
      expv[45] = 32'h3fa67c32;
      expv[46] = 32'h08c71776;
      expv[47] = 32'h33a2048b;
      expv[48] = 32'h37581eea;
      expv[49] = 32'ha1a755e8;
      expv[50] = 32'h577815c6;
      expv[51] = 32'h349c6379;
      expv[52] = 32'hf96f9901;
      expv[53] = 32'ha5a6ade8;
      expv[54] = 32'h9d691a8b;
      expv[55] = 32'hd726578c;
      expv[56] = 32'hf904c1d4;
      expv[57] = 32'h7a25e20d;
      expv[58] = 32'h1914a64c;
      expv[59] = 32'h217bab25;
      expv[60] = 32'h15d947fc;
      expv[61] = 32'h2361f2eb;
      expv[62] = 32'h72b0f78c;
      expv[63] = 32'h1752b226;
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
