// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06969 dut (
    .u(in_vec[35:0]),
    .y(out_vec[17:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hdd974cd6c;
    stim[1] = 36'hf72f2c6a0;
    stim[2] = 36'h44d359cb4;
    stim[3] = 36'h8ff8cf0fc;
    stim[4] = 36'h22e14ae96;
    stim[5] = 36'h254106de4;
    stim[6] = 36'h3274f4347;
    stim[7] = 36'h11f1525e2;
    stim[8] = 36'hf0ca3072e;
    stim[9] = 36'h26f180487;
    stim[10] = 36'h4d8f509f9;
    stim[11] = 36'h46e0847a2;
    stim[12] = 36'h3d0c563c3;
    stim[13] = 36'h205483106;
    stim[14] = 36'h0e1b0fa8d;
    stim[15] = 36'hc826034a2;
    stim[16] = 36'h6358937fe;
    stim[17] = 36'h18591a373;
    stim[18] = 36'h08b256af2;
    stim[19] = 36'h36b1452dc;
    stim[20] = 36'hb6a2e7fbd;
    stim[21] = 36'h1611e93a8;
    stim[22] = 36'hebe4b4d01;
    stim[23] = 36'h06e77025d;
    stim[24] = 36'h565ff4cf8;
    stim[25] = 36'h95aa273f9;
    stim[26] = 36'hab49d7f30;
    stim[27] = 36'hdd3fd48cf;
    stim[28] = 36'h809d499b5;
    stim[29] = 36'h96efa3272;
    stim[30] = 36'ha5f828c09;
    stim[31] = 36'h34cdc3f7e;
    stim[32] = 36'hbca6792ac;
    stim[33] = 36'hfbc90ea3c;
    stim[34] = 36'he28690cd4;
    stim[35] = 36'h78a96fc35;
    stim[36] = 36'hc74d9041f;
    stim[37] = 36'he918d6ecb;
    stim[38] = 36'h05605555e;
    stim[39] = 36'h4ecd0d751;
    stim[40] = 36'ha1e1bd2db;
    stim[41] = 36'hf07bf02bb;
    stim[42] = 36'h8f1359b56;
    stim[43] = 36'h62235731c;
    stim[44] = 36'h1a1e6b410;
    stim[45] = 36'hbc43eca2e;
    stim[46] = 36'he225e1d29;
    stim[47] = 36'h8655e11ee;
    stim[48] = 36'h71d9f96cb;
    stim[49] = 36'hf7694b609;
    stim[50] = 36'h486d11a4c;
    stim[51] = 36'h4aef0da7c;
    stim[52] = 36'he96aebaeb;
    stim[53] = 36'h58c578938;
    stim[54] = 36'hd8b59fee0;
    stim[55] = 36'hfdd18f21c;
    stim[56] = 36'ha0057563d;
    stim[57] = 36'h22ae3e27c;
    stim[58] = 36'hcff9c67d7;
    stim[59] = 36'hf154d3f8e;
    stim[60] = 36'h9eba2a1c0;
    stim[61] = 36'hf346989bc;
    stim[62] = 36'h2f6984ade;
    stim[63] = 36'h529d5fe5a;
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
      expv[0] = 18'h0cd6c;
      expv[1] = 18'h2c6a0;
      expv[2] = 18'h19cb4;
      expv[3] = 18'h0f0fc;
      expv[4] = 18'h0ae96;
      expv[5] = 18'h06de4;
      expv[6] = 18'h34347;
      expv[7] = 18'h125e2;
      expv[8] = 18'h3072e;
      expv[9] = 18'h00487;
      expv[10] = 18'h109f9;
      expv[11] = 18'h047a2;
      expv[12] = 18'h163c3;
      expv[13] = 18'h03106;
      expv[14] = 18'h0fa8d;
      expv[15] = 18'h034a2;
      expv[16] = 18'h137fe;
      expv[17] = 18'h1a373;
      expv[18] = 18'h16af2;
      expv[19] = 18'h052dc;
      expv[20] = 18'h27fbd;
      expv[21] = 18'h293a8;
      expv[22] = 18'h34d01;
      expv[23] = 18'h3025d;
      expv[24] = 18'h34cf8;
      expv[25] = 18'h273f9;
      expv[26] = 18'h17f30;
      expv[27] = 18'h148cf;
      expv[28] = 18'h099b5;
      expv[29] = 18'h23272;
      expv[30] = 18'h28c09;
      expv[31] = 18'h03f7e;
      expv[32] = 18'h392ac;
      expv[33] = 18'h0ea3c;
      expv[34] = 18'h10cd4;
      expv[35] = 18'h2fc35;
      expv[36] = 18'h1041f;
      expv[37] = 18'h16ecb;
      expv[38] = 18'h1555e;
      expv[39] = 18'h0d751;
      expv[40] = 18'h3d2db;
      expv[41] = 18'h302bb;
      expv[42] = 18'h19b56;
      expv[43] = 18'h1731c;
      expv[44] = 18'h2b410;
      expv[45] = 18'h2ca2e;
      expv[46] = 18'h21d29;
      expv[47] = 18'h211ee;
      expv[48] = 18'h396cb;
      expv[49] = 18'h0b609;
      expv[50] = 18'h11a4c;
      expv[51] = 18'h0da7c;
      expv[52] = 18'h2baeb;
      expv[53] = 18'h38938;
      expv[54] = 18'h1fee0;
      expv[55] = 18'h0f21c;
      expv[56] = 18'h3563d;
      expv[57] = 18'h3e27c;
      expv[58] = 18'h067d7;
      expv[59] = 18'h13f8e;
      expv[60] = 18'h2a1c0;
      expv[61] = 18'h189bc;
      expv[62] = 18'h04ade;
      expv[63] = 18'h1fe5a;
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
