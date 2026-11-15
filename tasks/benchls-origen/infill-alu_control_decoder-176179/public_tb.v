// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_176179 dut (
    .ALUOp(in_vec[11:6]),
    .ALUFunction(in_vec[5:0]),
    .ALUOperation(out_vec[4:1]),
    .JrFlag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hbef;
    stim[1] = 12'haf3;
    stim[2] = 12'h7d0;
    stim[3] = 12'h85b;
    stim[4] = 12'hebf;
    stim[5] = 12'h8dd;
    stim[6] = 12'ha9b;
    stim[7] = 12'hd65;
    stim[8] = 12'h2c3;
    stim[9] = 12'hd8e;
    stim[10] = 12'h94a;
    stim[11] = 12'h02e;
    stim[12] = 12'ha13;
    stim[13] = 12'h936;
    stim[14] = 12'hcdd;
    stim[15] = 12'he63;
    stim[16] = 12'h0b6;
    stim[17] = 12'h1ec;
    stim[18] = 12'h76c;
    stim[19] = 12'haeb;
    stim[20] = 12'h23b;
    stim[21] = 12'h721;
    stim[22] = 12'hcb2;
    stim[23] = 12'hb51;
    stim[24] = 12'h173;
    stim[25] = 12'h929;
    stim[26] = 12'h0a5;
    stim[27] = 12'h264;
    stim[28] = 12'h3ef;
    stim[29] = 12'h7ee;
    stim[30] = 12'h329;
    stim[31] = 12'h287;
    stim[32] = 12'hc02;
    stim[33] = 12'hc68;
    stim[34] = 12'h379;
    stim[35] = 12'hbb9;
    stim[36] = 12'h5e5;
    stim[37] = 12'h4f3;
    stim[38] = 12'h5cb;
    stim[39] = 12'hbf2;
    stim[40] = 12'h571;
    stim[41] = 12'h04d;
    stim[42] = 12'h524;
    stim[43] = 12'h0c6;
    stim[44] = 12'hffc;
    stim[45] = 12'h4bc;
    stim[46] = 12'hf77;
    stim[47] = 12'hbf9;
    stim[48] = 12'h2ea;
    stim[49] = 12'hb29;
    stim[50] = 12'hda8;
    stim[51] = 12'hd69;
    stim[52] = 12'he75;
    stim[53] = 12'hbd8;
    stim[54] = 12'h651;
    stim[55] = 12'h334;
    stim[56] = 12'haa6;
    stim[57] = 12'h798;
    stim[58] = 12'h089;
    stim[59] = 12'h472;
    stim[60] = 12'hc4f;
    stim[61] = 12'hd0e;
    stim[62] = 12'h89d;
    stim[63] = 12'h8f1;
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
      expv[0] = 5'h1f;
      expv[1] = 5'h00;
      expv[2] = 5'h1f;
      expv[3] = 5'h1f;
      expv[4] = 5'h1f;
      expv[5] = 5'h00;
      expv[6] = 5'h1f;
      expv[7] = 5'h1f;
      expv[8] = 5'h1f;
      expv[9] = 5'h1f;
      expv[10] = 5'h1f;
      expv[11] = 5'h1f;
      expv[12] = 5'h1f;
      expv[13] = 5'h1f;
      expv[14] = 5'h1f;
      expv[15] = 5'h1f;
      expv[16] = 5'h1f;
      expv[17] = 5'h1f;
      expv[18] = 5'h1f;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h1f;
      expv[22] = 5'h1f;
      expv[23] = 5'h1f;
      expv[24] = 5'h02;
      expv[25] = 5'h1f;
      expv[26] = 5'h1f;
      expv[27] = 5'h1f;
      expv[28] = 5'h0e;
      expv[29] = 5'h1f;
      expv[30] = 5'h1f;
      expv[31] = 5'h1f;
      expv[32] = 5'h1f;
      expv[33] = 5'h1f;
      expv[34] = 5'h06;
      expv[35] = 5'h1f;
      expv[36] = 5'h1f;
      expv[37] = 5'h1f;
      expv[38] = 5'h1f;
      expv[39] = 5'h1f;
      expv[40] = 5'h1f;
      expv[41] = 5'h1f;
      expv[42] = 5'h1f;
      expv[43] = 5'h1f;
      expv[44] = 5'h1f;
      expv[45] = 5'h1f;
      expv[46] = 5'h1f;
      expv[47] = 5'h1f;
      expv[48] = 5'h1f;
      expv[49] = 5'h1f;
      expv[50] = 5'h1f;
      expv[51] = 5'h1f;
      expv[52] = 5'h1f;
      expv[53] = 5'h1f;
      expv[54] = 5'h1f;
      expv[55] = 5'h1f;
      expv[56] = 5'h1f;
      expv[57] = 5'h1f;
      expv[58] = 5'h1f;
      expv[59] = 5'h1f;
      expv[60] = 5'h1f;
      expv[61] = 5'h1f;
      expv[62] = 5'h1f;
      expv[63] = 5'h00;
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
