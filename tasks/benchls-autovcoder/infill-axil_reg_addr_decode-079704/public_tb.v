// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_079704 dut (
    .axaddr(in_vec[31:0]),
    .reg_decode_num(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h4d26a398;
    stim[1] = 32'h8b61fbd7;
    stim[2] = 32'hfc953ecd;
    stim[3] = 32'h9805ee8d;
    stim[4] = 32'h8507b008;
    stim[5] = 32'hcb021e54;
    stim[6] = 32'h4d77650e;
    stim[7] = 32'h590645ef;
    stim[8] = 32'h549152e7;
    stim[9] = 32'h9e15d9ab;
    stim[10] = 32'h9737f13b;
    stim[11] = 32'h33567f3b;
    stim[12] = 32'h181f8aa8;
    stim[13] = 32'hd10833b7;
    stim[14] = 32'h8ac8ca82;
    stim[15] = 32'h23cf6f10;
    stim[16] = 32'h3eff2fa2;
    stim[17] = 32'h3526fc66;
    stim[18] = 32'h8a074b9d;
    stim[19] = 32'h6b2be6cb;
    stim[20] = 32'hc1ec2832;
    stim[21] = 32'hac3e0249;
    stim[22] = 32'h1a493f98;
    stim[23] = 32'hac83fbf0;
    stim[24] = 32'he1d2d8d9;
    stim[25] = 32'hde94fe46;
    stim[26] = 32'hcc9c3fd2;
    stim[27] = 32'h8253993c;
    stim[28] = 32'hd5e8bce3;
    stim[29] = 32'h3fa920c7;
    stim[30] = 32'hbecea7ee;
    stim[31] = 32'hc74213fb;
    stim[32] = 32'h1fd32f60;
    stim[33] = 32'h81cd6eaa;
    stim[34] = 32'h54a91cd7;
    stim[35] = 32'h912cad1c;
    stim[36] = 32'h840168b3;
    stim[37] = 32'hc35e9b4e;
    stim[38] = 32'h59058c36;
    stim[39] = 32'hd27ae194;
    stim[40] = 32'hf965dc9e;
    stim[41] = 32'h51e960e4;
    stim[42] = 32'hb40160f8;
    stim[43] = 32'h60ff64a7;
    stim[44] = 32'h6eeef0e1;
    stim[45] = 32'h0a2f3916;
    stim[46] = 32'h291e805a;
    stim[47] = 32'h34bca683;
    stim[48] = 32'hde853b9a;
    stim[49] = 32'hda5ddb6c;
    stim[50] = 32'hcc30130e;
    stim[51] = 32'hb3db115c;
    stim[52] = 32'he847f967;
    stim[53] = 32'h05d94570;
    stim[54] = 32'ha1fb70f8;
    stim[55] = 32'hc0b515c0;
    stim[56] = 32'hc92cf782;
    stim[57] = 32'hc0ba8b1a;
    stim[58] = 32'h8c8b6618;
    stim[59] = 32'ha0625e4f;
    stim[60] = 32'hb06ae177;
    stim[61] = 32'h3b163d70;
    stim[62] = 32'he08245e8;
    stim[63] = 32'hed4f814c;
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
      expv[0] = 3'h0;
      expv[1] = 3'h2;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h2;
      expv[6] = 3'h0;
      expv[7] = 3'h0;
      expv[8] = 3'h2;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h2;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h2;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h2;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h2;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h2;
      expv[35] = 3'h0;
      expv[36] = 3'h0;
      expv[37] = 3'h0;
      expv[38] = 3'h2;
      expv[39] = 3'h2;
      expv[40] = 3'h0;
      expv[41] = 3'h2;
      expv[42] = 3'h0;
      expv[43] = 3'h2;
      expv[44] = 3'h0;
      expv[45] = 3'h2;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h0;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h0;
      expv[52] = 3'h2;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h0;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h2;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
