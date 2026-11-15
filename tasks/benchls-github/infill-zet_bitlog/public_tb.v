// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  zet_bitlog dut (
    .x(in_vec[15:0]),
    .o(out_vec[17:2]),
    .cfo(out_vec[1:1]),
    .ofo(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h6d6f;
    stim[1] = 16'hdde8;
    stim[2] = 16'h4dc6;
    stim[3] = 16'h6cc4;
    stim[4] = 16'hbffa;
    stim[5] = 16'h74aa;
    stim[6] = 16'hb4c7;
    stim[7] = 16'h55da;
    stim[8] = 16'heb6f;
    stim[9] = 16'h927a;
    stim[10] = 16'h7a94;
    stim[11] = 16'h5964;
    stim[12] = 16'h2f4a;
    stim[13] = 16'hc652;
    stim[14] = 16'h9522;
    stim[15] = 16'hde48;
    stim[16] = 16'ha263;
    stim[17] = 16'h9dd7;
    stim[18] = 16'hf7a4;
    stim[19] = 16'hfd3a;
    stim[20] = 16'h300b;
    stim[21] = 16'hb54a;
    stim[22] = 16'h3826;
    stim[23] = 16'h2cff;
    stim[24] = 16'ha7dd;
    stim[25] = 16'h370c;
    stim[26] = 16'h0080;
    stim[27] = 16'h88c4;
    stim[28] = 16'hd80e;
    stim[29] = 16'h14ae;
    stim[30] = 16'hf2ce;
    stim[31] = 16'h84ab;
    stim[32] = 16'h8b23;
    stim[33] = 16'h7bdb;
    stim[34] = 16'h505a;
    stim[35] = 16'h8d63;
    stim[36] = 16'hc044;
    stim[37] = 16'ha0d5;
    stim[38] = 16'h7c1e;
    stim[39] = 16'h8c13;
    stim[40] = 16'he70b;
    stim[41] = 16'h95b6;
    stim[42] = 16'h4ade;
    stim[43] = 16'hc18c;
    stim[44] = 16'hb9fa;
    stim[45] = 16'h5c8f;
    stim[46] = 16'h0694;
    stim[47] = 16'hcd50;
    stim[48] = 16'hd741;
    stim[49] = 16'h8c97;
    stim[50] = 16'h2a37;
    stim[51] = 16'hb6cc;
    stim[52] = 16'ha1fd;
    stim[53] = 16'h01a0;
    stim[54] = 16'h1aba;
    stim[55] = 16'h56d7;
    stim[56] = 16'he2dd;
    stim[57] = 16'hcb75;
    stim[58] = 16'h3fec;
    stim[59] = 16'hd2d1;
    stim[60] = 16'hec07;
    stim[61] = 16'h32d5;
    stim[62] = 16'h6139;
    stim[63] = 16'h85d6;
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
      expv[0] = 18'h24a40;
      expv[1] = 18'h0885c;
      expv[2] = 18'h2c8e4;
      expv[3] = 18'h24cec;
      expv[4] = 18'h10014;
      expv[5] = 18'h22d54;
      expv[6] = 18'h12ce0;
      expv[7] = 18'h2a894;
      expv[8] = 18'h05240;
      expv[9] = 18'h1b614;
      expv[10] = 18'h215ac;
      expv[11] = 18'h29a6c;
      expv[12] = 18'h342d4;
      expv[13] = 18'h0e6b4;
      expv[14] = 18'h1ab74;
      expv[15] = 18'h086dc;
      expv[16] = 18'h17670;
      expv[17] = 18'h188a0;
      expv[18] = 18'h0216c;
      expv[19] = 18'h00b14;
      expv[20] = 18'h33fd0;
      expv[21] = 18'h12ad4;
      expv[22] = 18'h31f64;
      expv[23] = 18'h34c00;
      expv[24] = 18'h16088;
      expv[25] = 18'h323cc;
      expv[26] = 18'h3fdfc;
      expv[27] = 18'h1dcec;
      expv[28] = 18'h09fc4;
      expv[29] = 18'h3ad44;
      expv[30] = 18'h034c4;
      expv[31] = 18'h1ed50;
      expv[32] = 18'h1d370;
      expv[33] = 18'h21090;
      expv[34] = 18'h2be94;
      expv[35] = 18'h1ca70;
      expv[36] = 18'h0feec;
      expv[37] = 18'h17ca8;
      expv[38] = 18'h20f84;
      expv[39] = 18'h1cfb0;
      expv[40] = 18'h063d0;
      expv[41] = 18'h1a924;
      expv[42] = 18'h2d484;
      expv[43] = 18'h0f9cc;
      expv[44] = 18'h11814;
      expv[45] = 18'h28dc0;
      expv[46] = 18'h3e5ac;
      expv[47] = 18'h0cabc;
      expv[48] = 18'h0a2f8;
      expv[49] = 18'h1cda0;
      expv[50] = 18'h35720;
      expv[51] = 18'h124cc;
      expv[52] = 18'h17808;
      expv[53] = 18'h3f97c;
      expv[54] = 18'h39514;
      expv[55] = 18'h2a4a0;
      expv[56] = 18'h07488;
      expv[57] = 18'h0d228;
      expv[58] = 18'h3004c;
      expv[59] = 18'h0b4b8;
      expv[60] = 18'h04fe0;
      expv[61] = 18'h334a8;
      expv[62] = 18'h27b18;
      expv[63] = 18'h1e8a4;
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
