// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 55;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_104425 dut (
    .clock(clk),
    .io_d(in_vec[54:0]),
    .io_q(out_vec[54:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h35ecba7265cbb4;
    stim[1] = 55'h031f0b8fbb0340;
    stim[2] = 55'h0ca2e0c1b11c4b;
    stim[3] = 55'h7a463c965dfadf;
    stim[4] = 55'h71e7a8b24e0655;
    stim[5] = 55'h4409e912f41e8b;
    stim[6] = 55'h3978e8cdf0fa62;
    stim[7] = 55'h45536dce4b5d8d;
    stim[8] = 55'h2a759ab190bf6d;
    stim[9] = 55'h1d44806c6a8d0d;
    stim[10] = 55'h4c52cd4c668a48;
    stim[11] = 55'h728c828020e980;
    stim[12] = 55'h17f11cb45a67a6;
    stim[13] = 55'h4a0e5497789b1d;
    stim[14] = 55'h5bccd33488cbb6;
    stim[15] = 55'h1a05c0189b11c4;
    stim[16] = 55'h0be34fc0c26d55;
    stim[17] = 55'h1802b4a5331ba5;
    stim[18] = 55'h0eb52a35aa32ee;
    stim[19] = 55'h79ba77c2a615f7;
    stim[20] = 55'h08a1c135574983;
    stim[21] = 55'h3a2a0d8a57b174;
    stim[22] = 55'h5c75076c24b12c;
    stim[23] = 55'h5bd1cfbec46240;
    stim[24] = 55'h02dcf1d7061286;
    stim[25] = 55'h2e3f702717df5c;
    stim[26] = 55'h728fdbdb116b06;
    stim[27] = 55'h0286568dec5903;
    stim[28] = 55'h4aa9f9abf530b5;
    stim[29] = 55'h1d3db0d5c288a8;
    stim[30] = 55'h3304aca55a40b1;
    stim[31] = 55'h4d3539e99a230e;
    stim[32] = 55'h332c576d39197b;
    stim[33] = 55'h446ad6c409ae2c;
    stim[34] = 55'h67d369a9f889df;
    stim[35] = 55'h6c08e76d6a9cc9;
    stim[36] = 55'h5de4c2d0e76054;
    stim[37] = 55'h636c9c2014f808;
    stim[38] = 55'h1283f89437cc1e;
    stim[39] = 55'h7c48ab35b17b27;
    stim[40] = 55'h33ef3d5a0e07c9;
    stim[41] = 55'h0392e039682153;
    stim[42] = 55'h1cb43ba886572d;
    stim[43] = 55'h77dd4ce43aae18;
    stim[44] = 55'h3d17ff40019ca8;
    stim[45] = 55'h4fd3a4e157e161;
    stim[46] = 55'h5f42f9f0bf116a;
    stim[47] = 55'h332fd959e0378b;
    stim[48] = 55'h1bd28ea3894038;
    stim[49] = 55'h032bf78d7c8ae9;
    stim[50] = 55'h4ddaa24ff33ca5;
    stim[51] = 55'h4aa12c4a319835;
    stim[52] = 55'h705788d06ec72a;
    stim[53] = 55'h6e2af0afbed953;
    stim[54] = 55'h38e8727d8a871e;
    stim[55] = 55'h09ee6c70a6ff87;
    stim[56] = 55'h05314217d8e9b0;
    stim[57] = 55'h36b9a392643310;
    stim[58] = 55'h0947c8d4f5707e;
    stim[59] = 55'h51815f1150ea60;
    stim[60] = 55'h2bb90696fb2ae2;
    stim[61] = 55'h5888637a8ea224;
    stim[62] = 55'h0cba6fd1227c92;
    stim[63] = 55'h10a748d5fc7a00;
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
      expv[0] = 55'hxxxxxxxxxxxxxx;
      expv[1] = 55'h35ecba7265cbb4;
      expv[2] = 55'h031f0b8fbb0340;
      expv[3] = 55'h0ca2e0c1b11c4b;
      expv[4] = 55'h7a463c965dfadf;
      expv[5] = 55'h71e7a8b24e0655;
      expv[6] = 55'h4409e912f41e8b;
      expv[7] = 55'h3978e8cdf0fa62;
      expv[8] = 55'h45536dce4b5d8d;
      expv[9] = 55'h2a759ab190bf6d;
      expv[10] = 55'h1d44806c6a8d0d;
      expv[11] = 55'h4c52cd4c668a48;
      expv[12] = 55'h728c828020e980;
      expv[13] = 55'h17f11cb45a67a6;
      expv[14] = 55'h4a0e5497789b1d;
      expv[15] = 55'h5bccd33488cbb6;
      expv[16] = 55'h1a05c0189b11c4;
      expv[17] = 55'h0be34fc0c26d55;
      expv[18] = 55'h1802b4a5331ba5;
      expv[19] = 55'h0eb52a35aa32ee;
      expv[20] = 55'h79ba77c2a615f7;
      expv[21] = 55'h08a1c135574983;
      expv[22] = 55'h3a2a0d8a57b174;
      expv[23] = 55'h5c75076c24b12c;
      expv[24] = 55'h5bd1cfbec46240;
      expv[25] = 55'h02dcf1d7061286;
      expv[26] = 55'h2e3f702717df5c;
      expv[27] = 55'h728fdbdb116b06;
      expv[28] = 55'h0286568dec5903;
      expv[29] = 55'h4aa9f9abf530b5;
      expv[30] = 55'h1d3db0d5c288a8;
      expv[31] = 55'h3304aca55a40b1;
      expv[32] = 55'h4d3539e99a230e;
      expv[33] = 55'h332c576d39197b;
      expv[34] = 55'h446ad6c409ae2c;
      expv[35] = 55'h67d369a9f889df;
      expv[36] = 55'h6c08e76d6a9cc9;
      expv[37] = 55'h5de4c2d0e76054;
      expv[38] = 55'h636c9c2014f808;
      expv[39] = 55'h1283f89437cc1e;
      expv[40] = 55'h7c48ab35b17b27;
      expv[41] = 55'h33ef3d5a0e07c9;
      expv[42] = 55'h0392e039682153;
      expv[43] = 55'h1cb43ba886572d;
      expv[44] = 55'h77dd4ce43aae18;
      expv[45] = 55'h3d17ff40019ca8;
      expv[46] = 55'h4fd3a4e157e161;
      expv[47] = 55'h5f42f9f0bf116a;
      expv[48] = 55'h332fd959e0378b;
      expv[49] = 55'h1bd28ea3894038;
      expv[50] = 55'h032bf78d7c8ae9;
      expv[51] = 55'h4ddaa24ff33ca5;
      expv[52] = 55'h4aa12c4a319835;
      expv[53] = 55'h705788d06ec72a;
      expv[54] = 55'h6e2af0afbed953;
      expv[55] = 55'h38e8727d8a871e;
      expv[56] = 55'h09ee6c70a6ff87;
      expv[57] = 55'h05314217d8e9b0;
      expv[58] = 55'h36b9a392643310;
      expv[59] = 55'h0947c8d4f5707e;
      expv[60] = 55'h51815f1150ea60;
      expv[61] = 55'h2bb90696fb2ae2;
      expv[62] = 55'h5888637a8ea224;
      expv[63] = 55'h0cba6fd1227c92;
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
