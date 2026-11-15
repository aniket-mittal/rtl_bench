// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_060339 dut (
    .instruction(in_vec[31:0]),
    .uAdr(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h6bcf628f;
    stim[1] = 32'ha28a461a;
    stim[2] = 32'hce51ff01;
    stim[3] = 32'h7df8bf77;
    stim[4] = 32'h3428c1d9;
    stim[5] = 32'h2121483d;
    stim[6] = 32'h2764f57d;
    stim[7] = 32'h2dcb93cd;
    stim[8] = 32'hcfece3cc;
    stim[9] = 32'h84dbde39;
    stim[10] = 32'h078ad71a;
    stim[11] = 32'h7b624506;
    stim[12] = 32'h51778212;
    stim[13] = 32'h944f50c7;
    stim[14] = 32'h5f8fbae3;
    stim[15] = 32'hff0e233b;
    stim[16] = 32'h1b48ab18;
    stim[17] = 32'hce76d0de;
    stim[18] = 32'hede650e7;
    stim[19] = 32'h549ae2c0;
    stim[20] = 32'h06769abd;
    stim[21] = 32'h9bc8d041;
    stim[22] = 32'h65edb669;
    stim[23] = 32'hddb6f665;
    stim[24] = 32'hd4dab6b7;
    stim[25] = 32'h336e5d62;
    stim[26] = 32'h91c59b64;
    stim[27] = 32'h822341e7;
    stim[28] = 32'h0dfacbca;
    stim[29] = 32'h53461a20;
    stim[30] = 32'h74494d27;
    stim[31] = 32'had6a5d36;
    stim[32] = 32'h8a3e27ad;
    stim[33] = 32'h85c1e13c;
    stim[34] = 32'h8214015b;
    stim[35] = 32'h48e37888;
    stim[36] = 32'h988d385a;
    stim[37] = 32'h2753c8d5;
    stim[38] = 32'h80d9e164;
    stim[39] = 32'hed2a8e3c;
    stim[40] = 32'hf96e83a6;
    stim[41] = 32'h677e3112;
    stim[42] = 32'h64d4364f;
    stim[43] = 32'h6bb761bd;
    stim[44] = 32'h50d47ffb;
    stim[45] = 32'hd7e9dcd3;
    stim[46] = 32'h7c08f48a;
    stim[47] = 32'h11d2cb3c;
    stim[48] = 32'hefa9a01a;
    stim[49] = 32'h84295f7e;
    stim[50] = 32'h5ae59386;
    stim[51] = 32'hb828c0c6;
    stim[52] = 32'ha341c4c9;
    stim[53] = 32'h19f918be;
    stim[54] = 32'hc2f48c41;
    stim[55] = 32'h22f93fc3;
    stim[56] = 32'h4e69b4ae;
    stim[57] = 32'hd8a0df82;
    stim[58] = 32'haa936260;
    stim[59] = 32'h3ae9341a;
    stim[60] = 32'h204d8267;
    stim[61] = 32'h4061ac35;
    stim[62] = 32'h37b131bf;
    stim[63] = 32'h9d097da6;
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
      expv[0] = 6'h07;
      expv[1] = 6'h0e;
      expv[2] = 6'h16;
      expv[3] = 6'h08;
      expv[4] = 6'h04;
      expv[5] = 6'h12;
      expv[6] = 6'h12;
      expv[7] = 6'h14;
      expv[8] = 6'h17;
      expv[9] = 6'h0a;
      expv[10] = 6'h22;
      expv[11] = 6'h08;
      expv[12] = 6'h06;
      expv[13] = 6'h0b;
      expv[14] = 6'h06;
      expv[15] = 6'h1d;
      expv[16] = 6'h21;
      expv[17] = 6'h17;
      expv[18] = 6'h1b;
      expv[19] = 6'h06;
      expv[20] = 6'h22;
      expv[21] = 6'h0b;
      expv[22] = 6'h07;
      expv[23] = 6'h18;
      expv[24] = 6'h19;
      expv[25] = 6'h04;
      expv[26] = 6'h0b;
      expv[27] = 6'h09;
      expv[28] = 6'h22;
      expv[29] = 6'h06;
      expv[30] = 6'h08;
      expv[31] = 6'h0d;
      expv[32] = 6'h0a;
      expv[33] = 6'h0a;
      expv[34] = 6'h09;
      expv[35] = 6'h05;
      expv[36] = 6'h0c;
      expv[37] = 6'h14;
      expv[38] = 6'h09;
      expv[39] = 6'h1a;
      expv[40] = 6'h1d;
      expv[41] = 6'h07;
      expv[42] = 6'h07;
      expv[43] = 6'h07;
      expv[44] = 6'h06;
      expv[45] = 6'h18;
      expv[46] = 6'h08;
      expv[47] = 6'h21;
      expv[48] = 6'h1a;
      expv[49] = 6'h0a;
      expv[50] = 6'h06;
      expv[51] = 6'h10;
      expv[52] = 6'h0e;
      expv[53] = 6'h03;
      expv[54] = 6'h17;
      expv[55] = 6'h14;
      expv[56] = 6'h05;
      expv[57] = 6'h19;
      expv[58] = 6'h0e;
      expv[59] = 6'h04;
      expv[60] = 6'h12;
      expv[61] = 6'h05;
      expv[62] = 6'h04;
      expv[63] = 6'h0b;
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
