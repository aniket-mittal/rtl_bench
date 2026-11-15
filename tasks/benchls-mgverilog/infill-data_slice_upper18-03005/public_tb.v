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

  mg_03005 dut (
    .In1(in_vec[35:0]),
    .Out1(out_vec[17:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hb681d2bbc;
    stim[1] = 36'h370f7d8da;
    stim[2] = 36'h4e4538e8b;
    stim[3] = 36'h3f595df09;
    stim[4] = 36'h22d13b8d3;
    stim[5] = 36'hc853df4d9;
    stim[6] = 36'h780a1a8c0;
    stim[7] = 36'h59bcf1805;
    stim[8] = 36'hd82dfc05c;
    stim[9] = 36'hd52d66209;
    stim[10] = 36'h268cf274d;
    stim[11] = 36'h8420d67a9;
    stim[12] = 36'ha6a42d51b;
    stim[13] = 36'h39dead582;
    stim[14] = 36'hc26318a8d;
    stim[15] = 36'hfbc2b2c0a;
    stim[16] = 36'hfb2a05d89;
    stim[17] = 36'h1cd9d7ebe;
    stim[18] = 36'hf3904c128;
    stim[19] = 36'h449b190c7;
    stim[20] = 36'h0ccd82339;
    stim[21] = 36'h386ce4b75;
    stim[22] = 36'h6e82ae6e9;
    stim[23] = 36'h39c9d036c;
    stim[24] = 36'h64d9e7ff6;
    stim[25] = 36'he907515a5;
    stim[26] = 36'he85a58c8e;
    stim[27] = 36'h0f088a09c;
    stim[28] = 36'h187299eae;
    stim[29] = 36'hb720378f2;
    stim[30] = 36'hd9e24d889;
    stim[31] = 36'h91af85982;
    stim[32] = 36'h6b2139e65;
    stim[33] = 36'hca370d54e;
    stim[34] = 36'h8eb4a5d4a;
    stim[35] = 36'hc3909372d;
    stim[36] = 36'h8b39b83cb;
    stim[37] = 36'h6cc1d49e1;
    stim[38] = 36'h05e810023;
    stim[39] = 36'hfa10412bf;
    stim[40] = 36'h5015c40d7;
    stim[41] = 36'h9973ae887;
    stim[42] = 36'hf45fcf49c;
    stim[43] = 36'h2cc090954;
    stim[44] = 36'h2187e0093;
    stim[45] = 36'h4a27f38a2;
    stim[46] = 36'h9f365b355;
    stim[47] = 36'h3e4b5a4fd;
    stim[48] = 36'ha4d94219f;
    stim[49] = 36'h8e617dcbf;
    stim[50] = 36'h6e2e61ec8;
    stim[51] = 36'hde71336c7;
    stim[52] = 36'h86136cd53;
    stim[53] = 36'h432236dec;
    stim[54] = 36'he6d37f614;
    stim[55] = 36'h9aa00d37a;
    stim[56] = 36'hd65792b3c;
    stim[57] = 36'h938ceb3f1;
    stim[58] = 36'hf17c81cf2;
    stim[59] = 36'h01b7a46cd;
    stim[60] = 36'h78a9d3467;
    stim[61] = 36'h177808211;
    stim[62] = 36'hfa408a494;
    stim[63] = 36'hf9af5044b;
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
      expv[0] = 18'h2da07;
      expv[1] = 18'h0dc3d;
      expv[2] = 18'h13914;
      expv[3] = 18'h0fd65;
      expv[4] = 18'h08b44;
      expv[5] = 18'h3214f;
      expv[6] = 18'h1e028;
      expv[7] = 18'h166f3;
      expv[8] = 18'h360b7;
      expv[9] = 18'h354b5;
      expv[10] = 18'h09a33;
      expv[11] = 18'h21083;
      expv[12] = 18'h29a90;
      expv[13] = 18'h0e77a;
      expv[14] = 18'h3098c;
      expv[15] = 18'h3ef0a;
      expv[16] = 18'h3eca8;
      expv[17] = 18'h07367;
      expv[18] = 18'h3ce41;
      expv[19] = 18'h1126c;
      expv[20] = 18'h03336;
      expv[21] = 18'h0e1b3;
      expv[22] = 18'h1ba0a;
      expv[23] = 18'h0e727;
      expv[24] = 18'h19367;
      expv[25] = 18'h3a41d;
      expv[26] = 18'h3a169;
      expv[27] = 18'h03c22;
      expv[28] = 18'h061ca;
      expv[29] = 18'h2dc80;
      expv[30] = 18'h36789;
      expv[31] = 18'h246be;
      expv[32] = 18'h1ac84;
      expv[33] = 18'h328dc;
      expv[34] = 18'h23ad2;
      expv[35] = 18'h30e42;
      expv[36] = 18'h22ce6;
      expv[37] = 18'h1b307;
      expv[38] = 18'h017a0;
      expv[39] = 18'h3e841;
      expv[40] = 18'h14057;
      expv[41] = 18'h265ce;
      expv[42] = 18'h3d17f;
      expv[43] = 18'h0b302;
      expv[44] = 18'h0861f;
      expv[45] = 18'h1289f;
      expv[46] = 18'h27cd9;
      expv[47] = 18'h0f92d;
      expv[48] = 18'h29365;
      expv[49] = 18'h23985;
      expv[50] = 18'h1b8b9;
      expv[51] = 18'h379c4;
      expv[52] = 18'h2184d;
      expv[53] = 18'h10c88;
      expv[54] = 18'h39b4d;
      expv[55] = 18'h26a80;
      expv[56] = 18'h3595e;
      expv[57] = 18'h24e33;
      expv[58] = 18'h3c5f2;
      expv[59] = 18'h006de;
      expv[60] = 18'h1e2a7;
      expv[61] = 18'h05de0;
      expv[62] = 18'h3e902;
      expv[63] = 18'h3e6bd;
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
