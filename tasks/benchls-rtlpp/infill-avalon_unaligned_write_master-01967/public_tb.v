// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01967 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h2cbf9872fd969f354b;
    stim[1] = 70'h34d81a12ab589241d8;
    stim[2] = 70'h033eeb959c0e2cce30;
    stim[3] = 70'h126ed01e109077d251;
    stim[4] = 70'h3de9b05ccb738da07b;
    stim[5] = 70'h1aeb5f6c1d46563148;
    stim[6] = 70'h179a31faa8a1c993be;
    stim[7] = 70'h0050bce3c5b4c0822b;
    stim[8] = 70'h09916c964562547980;
    stim[9] = 70'h18193ce4169b3b0dfe;
    stim[10] = 70'h1d76556a351104f586;
    stim[11] = 70'h1a1114b4596650916f;
    stim[12] = 70'h0e58a0c7085b99d6f2;
    stim[13] = 70'h00b505ccc55efcfb57;
    stim[14] = 70'h18c8e43ad8238393e0;
    stim[15] = 70'h07d0bdc47030d67022;
    stim[16] = 70'h143e1fb642cc459222;
    stim[17] = 70'h1b07b1dd3888debdcd;
    stim[18] = 70'h08c2205e9588cc747f;
    stim[19] = 70'h140e4f27ef99bf3f8c;
    stim[20] = 70'h1716c598228aad6eb8;
    stim[21] = 70'h0a947925e6bdbefdd0;
    stim[22] = 70'h1f1d3a8d74b24b3f1a;
    stim[23] = 70'h1f173b872f2c8abc47;
    stim[24] = 70'h1aeebba50c5efad74f;
    stim[25] = 70'h0144a74851c61428c3;
    stim[26] = 70'h154b52c0eedf77b2bc;
    stim[27] = 70'h044eb2596fe8dc921c;
    stim[28] = 70'h05bb93cafda42503f6;
    stim[29] = 70'h169b005b021f78177c;
    stim[30] = 70'h136c787a3f2d4625d3;
    stim[31] = 70'h095dcd4d1f7764940c;
    stim[32] = 70'h185c881f0460071e77;
    stim[33] = 70'h18d18f753d421c6e34;
    stim[34] = 70'h04e9e39fda683a018b;
    stim[35] = 70'h02f5b68f44e6b9eac8;
    stim[36] = 70'h068360c1ce30060378;
    stim[37] = 70'h04e19805548a6903bf;
    stim[38] = 70'h178c6e4ea5032b2a00;
    stim[39] = 70'h0ea8a5bf1cf1ac78ea;
    stim[40] = 70'h2a255789380d57c072;
    stim[41] = 70'h16a6bfc3f08ce7d89b;
    stim[42] = 70'h06e54f7d9164bc5f33;
    stim[43] = 70'h042a74860d6b359011;
    stim[44] = 70'h083254e3b751e5ffba;
    stim[45] = 70'h0fa3db7151c6ec2e9e;
    stim[46] = 70'h0f91886740b6680fe0;
    stim[47] = 70'h15a396bec10809f0c3;
    stim[48] = 70'h08d8fd2f6e1b26e108;
    stim[49] = 70'h1b6a7422b93d7258e7;
    stim[50] = 70'h1ba3a2b3b594bbec81;
    stim[51] = 70'h07688853c58fb4a395;
    stim[52] = 70'h006b419fbca2d52901;
    stim[53] = 70'h1f6c44d34e40fd5247;
    stim[54] = 70'h05de026b4b664e81ca;
    stim[55] = 70'h041f10a3c4d2376636;
    stim[56] = 70'h08a2ed844c05c5325f;
    stim[57] = 70'h116b1286a34ffb5211;
    stim[58] = 70'h1f5e8c695d7576b02b;
    stim[59] = 70'h189d5ef0092ba0acab;
    stim[60] = 70'h01f86bb71754f7c805;
    stim[61] = 70'h0807584577523984d4;
    stim[62] = 70'h071a26c669749f4126;
    stim[63] = 70'h0f23819674ac4d9cfd;
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
      expv[0] = 33'h1969f354a;
      expv[1] = 33'h1589241d8;
      expv[2] = 33'h00e2cce30;
      expv[3] = 33'h09077d250;
      expv[4] = 33'h1738da07a;
      expv[5] = 33'h146563148;
      expv[6] = 33'h0a1c993bf;
      expv[7] = 33'h1b4c0822a;
      expv[8] = 33'h162547980;
      expv[9] = 33'h09b3b0dfe;
      expv[10] = 33'h11104f586;
      expv[11] = 33'h16650916e;
      expv[12] = 33'h05b99d6f2;
      expv[13] = 33'h15efcfb56;
      expv[14] = 33'h0238393e1;
      expv[15] = 33'h030d67022;
      expv[16] = 33'h0cc459222;
      expv[17] = 33'h088debdcc;
      expv[18] = 33'h188cc747e;
      expv[19] = 33'h199bf3f8c;
      expv[20] = 33'h08aad6eb8;
      expv[21] = 33'h0bdbefdd0;
      expv[22] = 33'h0b24b3f1a;
      expv[23] = 33'h12c8abc46;
      expv[24] = 33'h05efad74e;
      expv[25] = 33'h1c61428c2;
      expv[26] = 33'h0df77b2bc;
      expv[27] = 33'h1e8dc921c;
      expv[28] = 33'h1a42503f6;
      expv[29] = 33'h01f78177c;
      expv[30] = 33'h12d4625d2;
      expv[31] = 33'h17764940c;
      expv[32] = 33'h060071e76;
      expv[33] = 33'h1421c6e34;
      expv[34] = 33'h0683a018a;
      expv[35] = 33'h0e6b9eac8;
      expv[36] = 33'h030060378;
      expv[37] = 33'h08a6903be;
      expv[38] = 33'h1032b2a00;
      expv[39] = 33'h0f1ac78ea;
      expv[40] = 33'h00d57c072;
      expv[41] = 33'h08ce7d89a;
      expv[42] = 33'h164bc5f32;
      expv[43] = 33'h16b359010;
      expv[44] = 33'h151e5ffba;
      expv[45] = 33'h1c6ec2e9e;
      expv[46] = 33'h0b6680fe0;
      expv[47] = 33'h10809f0c2;
      expv[48] = 33'h01b26e108;
      expv[49] = 33'h13d7258e6;
      expv[50] = 33'h194bbec80;
      expv[51] = 33'h18fb4a394;
      expv[52] = 33'h0a2d52900;
      expv[53] = 33'h040fd5246;
      expv[54] = 33'h1664e81ca;
      expv[55] = 33'h0d2376636;
      expv[56] = 33'h005c5325e;
      expv[57] = 33'h14ffb5210;
      expv[58] = 33'h17576b02a;
      expv[59] = 33'h12ba0acaa;
      expv[60] = 33'h154f7c804;
      expv[61] = 33'h1523984d4;
      expv[62] = 33'h1749f4126;
      expv[63] = 33'h0ac4d9cfc;
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
