// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_074891 dut (
    .i_iclk(clk),
    .i_icount(in_vec[32:1]),
    .i_oclk(in_vec[0:0]),
    .o_ocount(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h14431dabb;
    stim[1] = 33'h0d9ab1871;
    stim[2] = 33'h14cdeef19;
    stim[3] = 33'h00ebb0c64;
    stim[4] = 33'h00fa1ca22;
    stim[5] = 33'h0c41b661a;
    stim[6] = 33'h1d1ad768d;
    stim[7] = 33'h0c80912ff;
    stim[8] = 33'h18dd3e59f;
    stim[9] = 33'h105bb26e3;
    stim[10] = 33'h095bb9e60;
    stim[11] = 33'h098b39748;
    stim[12] = 33'h06b6716c0;
    stim[13] = 33'h01c95e96a;
    stim[14] = 33'h18647e005;
    stim[15] = 33'h1acb9ec41;
    stim[16] = 33'h18154f16f;
    stim[17] = 33'h01b5fb183;
    stim[18] = 33'h0b0191cc7;
    stim[19] = 33'h1998b77bd;
    stim[20] = 33'h14b5fa15d;
    stim[21] = 33'h022cb5453;
    stim[22] = 33'h0de6e4b8c;
    stim[23] = 33'h07264a2aa;
    stim[24] = 33'h06119518c;
    stim[25] = 33'h011c7d29c;
    stim[26] = 33'h1a0c881b5;
    stim[27] = 33'h00935bcca;
    stim[28] = 33'h0d1f79114;
    stim[29] = 33'h124fc3866;
    stim[30] = 33'h12a544d36;
    stim[31] = 33'h1f7a77267;
    stim[32] = 33'h1583fe561;
    stim[33] = 33'h0287779c1;
    stim[34] = 33'h1372416df;
    stim[35] = 33'h0f194ddee;
    stim[36] = 33'h0dd55ad9c;
    stim[37] = 33'h08274e25b;
    stim[38] = 33'h19775f22d;
    stim[39] = 33'h17ef43e62;
    stim[40] = 33'h01defbbc9;
    stim[41] = 33'h1583e77fe;
    stim[42] = 33'h1ceb94f68;
    stim[43] = 33'h12277c249;
    stim[44] = 33'h1eb9ba9ad;
    stim[45] = 33'h1605f56b8;
    stim[46] = 33'h130febb3c;
    stim[47] = 33'h053616dab;
    stim[48] = 33'h18316003b;
    stim[49] = 33'h0266a6379;
    stim[50] = 33'h0cebdaf92;
    stim[51] = 33'h18354b058;
    stim[52] = 33'h1c08b105a;
    stim[53] = 33'h13578bc1f;
    stim[54] = 33'h1edc79cfe;
    stim[55] = 33'h1c6018e07;
    stim[56] = 33'h1532f89d7;
    stim[57] = 33'h1c51bd43e;
    stim[58] = 33'h00b2ca29c;
    stim[59] = 33'h1d849c1b2;
    stim[60] = 33'h08e8f63ca;
    stim[61] = 33'h1ae2bd983;
    stim[62] = 33'h0525b714a;
    stim[63] = 33'h0831c4cef;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'h620db30d;
      expv[27] = 32'h620db30d;
      expv[28] = 32'h620db30d;
      expv[29] = 32'h620db30d;
      expv[30] = 32'h620db30d;
      expv[31] = 32'h0e4af4b5;
      expv[32] = 32'h0e4af4b5;
      expv[33] = 32'h0e4af4b5;
      expv[34] = 32'h0e4af4b5;
      expv[35] = 32'h0e4af4b5;
      expv[36] = 32'h0e4af4b5;
      expv[37] = 32'h08e3e94e;
      expv[38] = 32'h08e3e94e;
      expv[39] = 32'h08e3e94e;
      expv[40] = 32'h952a269b;
      expv[41] = 32'h952a269b;
      expv[42] = 32'h952a269b;
      expv[43] = 32'h6eaad6ce;
      expv[44] = 32'h6eaad6ce;
      expv[45] = 32'h6eaad6ce;
      expv[46] = 32'h6eaad6ce;
      expv[47] = 32'hbf7a1f31;
      expv[48] = 32'hbf7a1f31;
      expv[49] = 32'hbf7a1f31;
      expv[50] = 32'hbf7a1f31;
      expv[51] = 32'hbf7a1f31;
      expv[52] = 32'hbf7a1f31;
      expv[53] = 32'he75ca7b4;
      expv[54] = 32'he75ca7b4;
      expv[55] = 32'h987f5d9e;
      expv[56] = 32'h987f5d9e;
      expv[57] = 32'h987f5d9e;
      expv[58] = 32'h987f5d9e;
      expv[59] = 32'h987f5d9e;
      expv[60] = 32'h987f5d9e;
      expv[61] = 32'he045882d;
      expv[62] = 32'he045882d;
      expv[63] = 32'hf6e3ce7f;
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
