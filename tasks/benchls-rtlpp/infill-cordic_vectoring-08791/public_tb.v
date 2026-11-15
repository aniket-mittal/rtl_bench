// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08791 dut (
    .clk(clk),
    .rst(in_vec[40:40]),
    .x_input(in_vec[39:20]),
    .y_input(in_vec[19:0]),
    .z_res(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h1253c154ae5;
    stim[1] = 41'h12d66ea1108;
    stim[2] = 41'h0461bf2e44b;
    stim[3] = 41'h065eee6d601;
    stim[4] = 41'h0f7c1beec21;
    stim[5] = 41'h093c11c7fcf;
    stim[6] = 41'h0c2705acc37;
    stim[7] = 41'h1c2a9590a09;
    stim[8] = 41'h0abb43e5729;
    stim[9] = 41'h0fc45166132;
    stim[10] = 41'h0c50b1a113b;
    stim[11] = 41'h0cf3120a05d;
    stim[12] = 41'h0a6a8cddf1c;
    stim[13] = 41'h093967f1a26;
    stim[14] = 41'h06b4e81f5db;
    stim[15] = 41'h08ab6b16a9f;
    stim[16] = 41'h0a56e2eacb4;
    stim[17] = 41'h0d34230fa36;
    stim[18] = 41'h0bc795c406d;
    stim[19] = 41'h0f01fd84499;
    stim[20] = 41'h0051876cf20;
    stim[21] = 41'h05442cb1de2;
    stim[22] = 41'h0c4be6ee8b4;
    stim[23] = 41'h0158d77e9ca;
    stim[24] = 41'h0093c849094;
    stim[25] = 41'h06a118a735f;
    stim[26] = 41'h0b450fb5944;
    stim[27] = 41'h0ec2e030a7a;
    stim[28] = 41'h05c3653548d;
    stim[29] = 41'h049eaba4284;
    stim[30] = 41'h0795c7df5be;
    stim[31] = 41'h088be675cfc;
    stim[32] = 41'h0e4ec135c39;
    stim[33] = 41'h08a6082ed9d;
    stim[34] = 41'h04ad468cf8d;
    stim[35] = 41'h0cd86804523;
    stim[36] = 41'h021e502d8b5;
    stim[37] = 41'h0c1441c10d0;
    stim[38] = 41'h0f2f55b1dc9;
    stim[39] = 41'h14d120ac64c;
    stim[40] = 41'h02f7ac7b7ee;
    stim[41] = 41'h06358d6ae8a;
    stim[42] = 41'h02108773aa1;
    stim[43] = 41'h057637ecc84;
    stim[44] = 41'h099867891ea;
    stim[45] = 41'h0fe4535c883;
    stim[46] = 41'h16e6df8bfd3;
    stim[47] = 41'h0002c24c529;
    stim[48] = 41'h0f0ecd05c47;
    stim[49] = 41'h00d3b6311fc;
    stim[50] = 41'h0436256e1f1;
    stim[51] = 41'h0bdc113ad19;
    stim[52] = 41'h0a56f99abe5;
    stim[53] = 41'h0ca4ca75d06;
    stim[54] = 41'h0948d722586;
    stim[55] = 41'h009b829d53d;
    stim[56] = 41'h0675be988b8;
    stim[57] = 41'h0938c292d4c;
    stim[58] = 41'h018584c74b2;
    stim[59] = 41'h0f9dc038bb6;
    stim[60] = 41'h09a820baeb2;
    stim[61] = 41'h019b9be099a;
    stim[62] = 41'h08279778e97;
    stim[63] = 41'h0cb22ed4334;
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
      expv[0] = 20'hxxxxx;
      expv[1] = 20'hxxxxx;
      expv[2] = 20'h1fe00;
      expv[3] = 20'h00000;
      expv[4] = 20'h00000;
      expv[5] = 20'h00000;
      expv[6] = 20'h00000;
      expv[7] = 20'h00000;
      expv[8] = 20'h1fe00;
      expv[9] = 20'h00000;
      expv[10] = 20'h00000;
      expv[11] = 20'h00000;
      expv[12] = 20'h00000;
      expv[13] = 20'h00000;
      expv[14] = 20'h00000;
      expv[15] = 20'h00000;
      expv[16] = 20'h00000;
      expv[17] = 20'h00000;
      expv[18] = 20'h00000;
      expv[19] = 20'h00000;
      expv[20] = 20'h00000;
      expv[21] = 20'h00000;
      expv[22] = 20'h00000;
      expv[23] = 20'h00000;
      expv[24] = 20'h00000;
      expv[25] = 20'h00000;
      expv[26] = 20'h00000;
      expv[27] = 20'h00000;
      expv[28] = 20'h00000;
      expv[29] = 20'h00000;
      expv[30] = 20'h00000;
      expv[31] = 20'h00000;
      expv[32] = 20'h00000;
      expv[33] = 20'h00000;
      expv[34] = 20'h00000;
      expv[35] = 20'h00000;
      expv[36] = 20'h00000;
      expv[37] = 20'h00000;
      expv[38] = 20'h00000;
      expv[39] = 20'h00000;
      expv[40] = 20'h1fe00;
      expv[41] = 20'h00000;
      expv[42] = 20'h00000;
      expv[43] = 20'h00000;
      expv[44] = 20'h00000;
      expv[45] = 20'h00000;
      expv[46] = 20'h00000;
      expv[47] = 20'h1fe00;
      expv[48] = 20'h00000;
      expv[49] = 20'h00000;
      expv[50] = 20'h00000;
      expv[51] = 20'h00000;
      expv[52] = 20'h00000;
      expv[53] = 20'h00000;
      expv[54] = 20'h00000;
      expv[55] = 20'h00000;
      expv[56] = 20'h00000;
      expv[57] = 20'h00000;
      expv[58] = 20'h00000;
      expv[59] = 20'h00000;
      expv[60] = 20'h00000;
      expv[61] = 20'h00000;
      expv[62] = 20'h00000;
      expv[63] = 20'h00000;
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
