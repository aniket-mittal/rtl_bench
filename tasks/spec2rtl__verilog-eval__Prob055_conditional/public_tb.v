// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .a(in_vec[31:24]),
    .b(in_vec[23:16]),
    .c(in_vec[15:8]),
    .d(in_vec[7:0]),
    .min(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h7d870c15;
    stim[1] = 32'h3195e624;
    stim[2] = 32'h1d4a66ea;
    stim[3] = 32'h5b60d0fd;
    stim[4] = 32'h09f26e5f;
    stim[5] = 32'hd97f9db4;
    stim[6] = 32'h8a0abf97;
    stim[7] = 32'h4579eadd;
    stim[8] = 32'hf36ac12a;
    stim[9] = 32'h526bd83d;
    stim[10] = 32'h6b720beb;
    stim[11] = 32'hec44d807;
    stim[12] = 32'h1ca9057c;
    stim[13] = 32'h49788b79;
    stim[14] = 32'hda189357;
    stim[15] = 32'hf9172aaa;
    stim[16] = 32'h152e9a10;
    stim[17] = 32'h698ec681;
    stim[18] = 32'h55a261f1;
    stim[19] = 32'h6924c20b;
    stim[20] = 32'h8a806a73;
    stim[21] = 32'h44f1246e;
    stim[22] = 32'h00338db5;
    stim[23] = 32'h568322b1;
    stim[24] = 32'hca39e42d;
    stim[25] = 32'h49604429;
    stim[26] = 32'he2fa2a7b;
    stim[27] = 32'hb1aeef35;
    stim[28] = 32'hd41c3288;
    stim[29] = 32'ha06268f0;
    stim[30] = 32'h1bfaefff;
    stim[31] = 32'ha140c3a8;
    stim[32] = 32'h25496ecd;
    stim[33] = 32'h18c0e394;
    stim[34] = 32'h682b3251;
    stim[35] = 32'hc31f3703;
    stim[36] = 32'hb1ae3b5f;
    stim[37] = 32'h76b78b82;
    stim[38] = 32'hac9ae347;
    stim[39] = 32'h3005c7d3;
    stim[40] = 32'h59249ba7;
    stim[41] = 32'h4f7765ad;
    stim[42] = 32'hc6879e4d;
    stim[43] = 32'h7d865753;
    stim[44] = 32'h8d5d5413;
    stim[45] = 32'h9dadb59f;
    stim[46] = 32'ha541b328;
    stim[47] = 32'hbec23ee3;
    stim[48] = 32'hd2bc7de6;
    stim[49] = 32'h393d4fa5;
    stim[50] = 32'h4a9b37ac;
    stim[51] = 32'hd2b39f4e;
    stim[52] = 32'h9e2f7af1;
    stim[53] = 32'hdb839766;
    stim[54] = 32'h958ba7e1;
    stim[55] = 32'h059b951b;
    stim[56] = 32'h25aaa4cc;
    stim[57] = 32'he6710b25;
    stim[58] = 32'h24f86418;
    stim[59] = 32'h7ed08489;
    stim[60] = 32'h357a3c3e;
    stim[61] = 32'h12071445;
    stim[62] = 32'h64782b41;
    stim[63] = 32'h00b56acf;
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
      expv[0] = 8'h0c;
      expv[1] = 8'h24;
      expv[2] = 8'h1d;
      expv[3] = 8'h5b;
      expv[4] = 8'h09;
      expv[5] = 8'h7f;
      expv[6] = 8'h0a;
      expv[7] = 8'h45;
      expv[8] = 8'h2a;
      expv[9] = 8'h3d;
      expv[10] = 8'h0b;
      expv[11] = 8'h07;
      expv[12] = 8'h05;
      expv[13] = 8'h49;
      expv[14] = 8'h18;
      expv[15] = 8'h17;
      expv[16] = 8'h10;
      expv[17] = 8'h69;
      expv[18] = 8'h55;
      expv[19] = 8'h0b;
      expv[20] = 8'h6a;
      expv[21] = 8'h24;
      expv[22] = 8'h00;
      expv[23] = 8'h22;
      expv[24] = 8'h2d;
      expv[25] = 8'h29;
      expv[26] = 8'h2a;
      expv[27] = 8'h35;
      expv[28] = 8'h1c;
      expv[29] = 8'h62;
      expv[30] = 8'h1b;
      expv[31] = 8'h40;
      expv[32] = 8'h25;
      expv[33] = 8'h18;
      expv[34] = 8'h2b;
      expv[35] = 8'h03;
      expv[36] = 8'h3b;
      expv[37] = 8'h76;
      expv[38] = 8'h47;
      expv[39] = 8'h05;
      expv[40] = 8'h24;
      expv[41] = 8'h4f;
      expv[42] = 8'h4d;
      expv[43] = 8'h53;
      expv[44] = 8'h13;
      expv[45] = 8'h9d;
      expv[46] = 8'h28;
      expv[47] = 8'h3e;
      expv[48] = 8'h7d;
      expv[49] = 8'h39;
      expv[50] = 8'h37;
      expv[51] = 8'h4e;
      expv[52] = 8'h2f;
      expv[53] = 8'h66;
      expv[54] = 8'h8b;
      expv[55] = 8'h05;
      expv[56] = 8'h25;
      expv[57] = 8'h0b;
      expv[58] = 8'h18;
      expv[59] = 8'h7e;
      expv[60] = 8'h35;
      expv[61] = 8'h07;
      expv[62] = 8'h2b;
      expv[63] = 8'h00;
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
