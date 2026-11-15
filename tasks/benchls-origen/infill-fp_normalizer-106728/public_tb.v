// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_106728 dut (
    .in_e(in_vec[32:25]),
    .in_m(in_vec[24:0]),
    .out_e(out_vec[32:25]),
    .out_m(out_vec[24:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h12c0c6843;
    stim[1] = 33'h07bb08729;
    stim[2] = 33'h1c44df0a2;
    stim[3] = 33'h1aa5c7e8d;
    stim[4] = 33'h0f66d89f1;
    stim[5] = 33'h0cda23eaa;
    stim[6] = 33'h09cbf45cf;
    stim[7] = 33'h075ee8f57;
    stim[8] = 33'h1ce6514e0;
    stim[9] = 33'h081bd1fbd;
    stim[10] = 33'h19e362cfa;
    stim[11] = 33'h184a229d4;
    stim[12] = 33'h118b03868;
    stim[13] = 33'h011bf6343;
    stim[14] = 33'h0c27e49a8;
    stim[15] = 33'h1027b3e31;
    stim[16] = 33'h1d7ead6a7;
    stim[17] = 33'h15ee0c228;
    stim[18] = 33'h1f3662a1a;
    stim[19] = 33'h030b98d58;
    stim[20] = 33'h1e252502e;
    stim[21] = 33'h06f891718;
    stim[22] = 33'h1385586ba;
    stim[23] = 33'h06e608efa;
    stim[24] = 33'h12b4a97ed;
    stim[25] = 33'h0590374da;
    stim[26] = 33'h1edd6a8e6;
    stim[27] = 33'h187081dbf;
    stim[28] = 33'h16e1e5198;
    stim[29] = 33'h09178de44;
    stim[30] = 33'h1b8361f20;
    stim[31] = 33'h0692be092;
    stim[32] = 33'h0a735ad84;
    stim[33] = 33'h08189fce1;
    stim[34] = 33'h16ae0e574;
    stim[35] = 33'h09745acbf;
    stim[36] = 33'h1e14de845;
    stim[37] = 33'h0dbb4b120;
    stim[38] = 33'h06593da5f;
    stim[39] = 33'h04233e892;
    stim[40] = 33'h070a2e3ba;
    stim[41] = 33'h1ba48822f;
    stim[42] = 33'h13fdac424;
    stim[43] = 33'h0641f842e;
    stim[44] = 33'h185515820;
    stim[45] = 33'h0ec8435bf;
    stim[46] = 33'h087de0bfe;
    stim[47] = 33'h0f669c630;
    stim[48] = 33'h0efa62f67;
    stim[49] = 33'h187e3fbb1;
    stim[50] = 33'h058414df9;
    stim[51] = 33'h16ea898e1;
    stim[52] = 33'h062061e61;
    stim[53] = 33'h07d06fb8c;
    stim[54] = 33'h14800643a;
    stim[55] = 33'h040437303;
    stim[56] = 33'h0c8ab7b99;
    stim[57] = 33'h1cf298c8e;
    stim[58] = 33'h073bf4be3;
    stim[59] = 33'h011d932e2;
    stim[60] = 33'h186dda712;
    stim[61] = 33'h1ba9d137f;
    stim[62] = 33'h058a32a6d;
    stim[63] = 33'h010c7d3a0;
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
      expv[0] = 33'h124c68430;
      expv[1] = 33'h07bb08729;
      expv[2] = 33'h1c29be144;
      expv[3] = 33'h1a8b8fd1a;
      expv[4] = 33'h0f4db13e2;
      expv[5] = 33'h0cda23eaa;
      expv[6] = 33'h09cbf45cf;
      expv[7] = 33'h075ee8f57;
      expv[8] = 33'h1ccca29c0;
      expv[9] = 33'h081bd1fbd;
      expv[10] = 33'h19ad8b3e8;
      expv[11] = 33'h184a229d4;
      expv[12] = 33'h118b03868;
      expv[13] = 33'h011bf6343;
      expv[14] = 33'h0c0fc9350;
      expv[15] = 33'h100f67c62;
      expv[16] = 33'h1d7ead6a7;
      expv[17] = 33'h15ee0c228;
      expv[18] = 33'h1f0cc5434;
      expv[19] = 33'h030b98d58;
      expv[20] = 33'h1e0a4a05c;
      expv[21] = 33'h06f891718;
      expv[22] = 33'h136ab0d74;
      expv[23] = 33'h06cc11df4;
      expv[24] = 33'h128952fda;
      expv[25] = 33'h04cdd3680;
      expv[26] = 33'h1edd6a8e6;
      expv[27] = 33'h17e81dbf0;
      expv[28] = 33'h168f28cc0;
      expv[29] = 33'h08ef1bc88;
      expv[30] = 33'h1b4d87c80;
      expv[31] = 33'h064af8248;
      expv[32] = 33'h0a2d6b610;
      expv[33] = 33'h08189fce1;
      expv[34] = 33'h16ae0e574;
      expv[35] = 33'h0948b597e;
      expv[36] = 33'h1de9bd08a;
      expv[37] = 33'h0dbb4b120;
      expv[38] = 33'h06593da5f;
      expv[39] = 33'h03ecfa248;
      expv[40] = 33'h070a2e3ba;
      expv[41] = 33'h1b891045e;
      expv[42] = 33'h13fdac424;
      expv[43] = 33'h05efc2170;
      expv[44] = 33'h182a2b040;
      expv[45] = 33'h0ec8435bf;
      expv[46] = 33'h087de0bfe;
      expv[47] = 33'h0f4d38c60;
      expv[48] = 33'h0efa62f67;
      expv[49] = 33'h187e3fbb1;
      expv[50] = 33'h056829bf2;
      expv[51] = 33'h16ea898e1;
      expv[52] = 33'h058c3cc20;
      expv[53] = 33'h072df7180;
      expv[54] = 33'h136c87400;
      expv[55] = 33'h03e86e606;
      expv[56] = 33'h0c8ab7b99;
      expv[57] = 33'h1caa63238;
      expv[58] = 33'h073bf4be3;
      expv[59] = 33'h011d932e2;
      expv[60] = 33'h186dda712;
      expv[61] = 33'h1ba9d137f;
      expv[62] = 33'h058a32a6d;
      expv[63] = 33'h010c7d3a0;
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
