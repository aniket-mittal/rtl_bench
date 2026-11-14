// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .load(in_vec[67:67]),
    .ena(in_vec[66:66]),
    .amount(in_vec[65:64]),
    .data(in_vec[63:0]),
    .q(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hd8e88f69574a6a7f8;
    stim[1] = 68'hddcd58b192c311ecb;
    stim[2] = 68'he1ce4e7637b4ed8ad;
    stim[3] = 68'h2c6e3f8dd1b5c79ca;
    stim[4] = 68'h5dd9e951a6683339b;
    stim[5] = 68'h83f531ec3e0ce4edf;
    stim[6] = 68'hdafa43a856b8131ed;
    stim[7] = 68'ha6a61aa459092eb47;
    stim[8] = 68'h7fb99d9aa6f989a0a;
    stim[9] = 68'h21256c6f94a911644;
    stim[10] = 68'h6461e704242550d44;
    stim[11] = 68'h49ece94bf28f5d49d;
    stim[12] = 68'h1aae0af0dad13620b;
    stim[13] = 68'h3d0cfa3d6fe23b0d0;
    stim[14] = 68'h5ffe8f22cbe5c206f;
    stim[15] = 68'h63a48f12da6491020;
    stim[16] = 68'h62b0ea4022d3b8312;
    stim[17] = 68'h971ad16a517582a61;
    stim[18] = 68'h9d98274c5c425edd7;
    stim[19] = 68'hcc806e20daca2fbb2;
    stim[20] = 68'h4e521934ff8ef67b0;
    stim[21] = 68'h9f377c64be1a7872c;
    stim[22] = 68'h5036fe7c41c906e42;
    stim[23] = 68'h4769d210cc902f499;
    stim[24] = 68'h8595db8359f856430;
    stim[25] = 68'hc786a0f4e4f21620c;
    stim[26] = 68'haed1a9ed6a4b5489f;
    stim[27] = 68'h04e8b41895c01334e;
    stim[28] = 68'h096c78eb68a2d7c82;
    stim[29] = 68'h6fbaf17b52e276268;
    stim[30] = 68'hfb4741a3b8e6f57b0;
    stim[31] = 68'he6300110f63a1aec8;
    stim[32] = 68'hb20deeb71f2720200;
    stim[33] = 68'h69a1a1ad944fa829f;
    stim[34] = 68'h83b883fe56e2c1103;
    stim[35] = 68'h04d525d36701a583a;
    stim[36] = 68'h7a391e3fac85f633a;
    stim[37] = 68'h776735847194332ce;
    stim[38] = 68'h7583ab397fbc06636;
    stim[39] = 68'h3f6b41a4f7fe11c17;
    stim[40] = 68'hd58e09e319af3af5d;
    stim[41] = 68'h0ec85f657dbe1f96e;
    stim[42] = 68'h2137323486a66ab02;
    stim[43] = 68'h24b0141cd3ec98f00;
    stim[44] = 68'hac208e4589725f6e6;
    stim[45] = 68'hd961874949f764484;
    stim[46] = 68'hadf676675b4fca0c9;
    stim[47] = 68'h64e2ceec6235bbb69;
    stim[48] = 68'he485de07a040ce5cb;
    stim[49] = 68'h68de50ada11cf06b2;
    stim[50] = 68'hc9de3c8c6eddfe30d;
    stim[51] = 68'h42c35ff5ed08fc75e;
    stim[52] = 68'h1aff73e27e14ac713;
    stim[53] = 68'h4eb1cafb3ba5dec89;
    stim[54] = 68'heba7133129660114a;
    stim[55] = 68'h6305ed2ef89e1f66b;
    stim[56] = 68'hdcee7fad2fbf8ce9b;
    stim[57] = 68'h7f7268818fd040ad0;
    stim[58] = 68'h574b6fe372b2b35e9;
    stim[59] = 68'h50c2a466763b74e29;
    stim[60] = 68'h86e7e0a59d17cb7aa;
    stim[61] = 68'h7cd24747efc28581f;
    stim[62] = 68'h42dae9cccb0afa2fb;
    stim[63] = 68'ha633e85caa72becac;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'h8e88f69574a6a7f8;
      expv[2] = 64'hdcd58b192c311ecb;
      expv[3] = 64'h1ce4e7637b4ed8ad;
      expv[4] = 64'h1ce4e7637b4ed8ad;
      expv[5] = 64'he4e7637b4ed8ad00;
      expv[6] = 64'h3f531ec3e0ce4edf;
      expv[7] = 64'hafa43a856b8131ed;
      expv[8] = 64'h6a61aa459092eb47;
      expv[9] = 64'h00d4c3548b2125d6;
      expv[10] = 64'h00d4c3548b2125d6;
      expv[11] = 64'h006a61aa459092eb;
      expv[12] = 64'h00d4c3548b2125d6;
      expv[13] = 64'h00d4c3548b2125d6;
      expv[14] = 64'h00d4c3548b2125d6;
      expv[15] = 64'hd4c3548b2125d600;
      expv[16] = 64'hea61aa459092eb00;
      expv[17] = 64'hf530d522c8497580;
      expv[18] = 64'h71ad16a517582a61;
      expv[19] = 64'hd98274c5c425edd7;
      expv[20] = 64'hc806e20daca2fbb2;
      expv[21] = 64'h900dc41b5945f764;
      expv[22] = 64'hf377c64be1a7872c;
      expv[23] = 64'h77c64be1a7872c00;
      expv[24] = 64'hef8c97c34f0e5800;
      expv[25] = 64'h595db8359f856430;
      expv[26] = 64'h786a0f4e4f21620c;
      expv[27] = 64'hed1a9ed6a4b5489f;
      expv[28] = 64'hed1a9ed6a4b5489f;
      expv[29] = 64'hed1a9ed6a4b5489f;
      expv[30] = 64'hf68d4f6b525aa44f;
      expv[31] = 64'hb4741a3b8e6f57b0;
      expv[32] = 64'h6300110f63a1aec8;
      expv[33] = 64'h20deeb71f2720200;
      expv[34] = 64'h106f75b8f9390100;
      expv[35] = 64'h3b883fe56e2c1103;
      expv[36] = 64'h3b883fe56e2c1103;
      expv[37] = 64'h0077107fcadc5822;
      expv[38] = 64'h0000ee20ff95b8b0;
      expv[39] = 64'h000001dc41ff2b71;
      expv[40] = 64'h000001dc41ff2b71;
      expv[41] = 64'h58e09e319af3af5d;
      expv[42] = 64'h58e09e319af3af5d;
      expv[43] = 64'h58e09e319af3af5d;
      expv[44] = 64'h58e09e319af3af5d;
      expv[45] = 64'hc208e4589725f6e6;
      expv[46] = 64'h961874949f764484;
      expv[47] = 64'hdf676675b4fca0c9;
      expv[48] = 64'hefb3b33ada7e5064;
      expv[49] = 64'h485de07a040ce5cb;
      expv[50] = 64'h242ef03d020672e5;
      expv[51] = 64'h9de3c8c6eddfe30d;
      expv[52] = 64'h3bc7918ddbbfc61a;
      expv[53] = 64'h3bc7918ddbbfc61a;
      expv[54] = 64'h778f231bb77f8c34;
      expv[55] = 64'hba7133129660114a;
      expv[56] = 64'hdd3899894b3008a5;
      expv[57] = 64'hcee7fad2fbf8ce9b;
      expv[58] = 64'hff9dcff5a5f7f19d;
      expv[59] = 64'h9dcff5a5f7f19d00;
      expv[60] = 64'hcff5a5f7f19d0000;
      expv[61] = 64'h6e7e0a59d17cb7aa;
      expv[62] = 64'h00dcfc14b3a2f96f;
      expv[63] = 64'h01b9f8296745f2de;
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
