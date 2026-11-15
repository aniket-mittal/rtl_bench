// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 78;
  localparam OW = 75;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059329 dut (
    .clk(clk),
    .reset(in_vec[77:77]),
    .if_write_ce(in_vec[76:76]),
    .if_write(in_vec[75:75]),
    .if_din(in_vec[74:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[74:74]),
    .if_empty_n(out_vec[73:73]),
    .if_dout(out_vec[72:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 78'h38aad369614469971e95;
    stim[1] = 78'h224b1beb47983fef3c85;
    stim[2] = 78'h0be56a5755219783db85;
    stim[3] = 78'h1bd1a63cb71c3740b640;
    stim[4] = 78'h097d79e1a225faad23e0;
    stim[5] = 78'h210ca8fbc13ec9afc45a;
    stim[6] = 78'h04b3e354499f6d2e886c;
    stim[7] = 78'h017e82e8855a8140ab0f;
    stim[8] = 78'h0f5ed6f0608b9cd80767;
    stim[9] = 78'h0b80b2b5f68a7db78472;
    stim[10] = 78'h0c10405b60c674b28a6b;
    stim[11] = 78'h1803493c96e09c183cfc;
    stim[12] = 78'h028ad8336fb3d5fa7e32;
    stim[13] = 78'h0a4acd1a5801581ca685;
    stim[14] = 78'h178b35524f8fa1b43d75;
    stim[15] = 78'h064079d31f04a18f5424;
    stim[16] = 78'h13ce0056c8e222d40e51;
    stim[17] = 78'h06c9b8b90863dfccd17f;
    stim[18] = 78'h02e4fa9eeedeccfefee3;
    stim[19] = 78'h19b6c07d54b907902182;
    stim[20] = 78'h05bfc2279ad0aacac741;
    stim[21] = 78'h0f6d9053be9efebfe36a;
    stim[22] = 78'h0bac3e7fbb07c1886d65;
    stim[23] = 78'h1e857c37dc6e1ee84f51;
    stim[24] = 78'h176436b0c3e40e706f20;
    stim[25] = 78'h07bfaf4dc8150c426ecd;
    stim[26] = 78'h10f53200fe67bfce5a01;
    stim[27] = 78'h0b9ad3a5c39c79716779;
    stim[28] = 78'h067fe0ad7a18678cd6f6;
    stim[29] = 78'h11f68692f0690515e94a;
    stim[30] = 78'h1e49879544816e4bdaae;
    stim[31] = 78'h12f37e9cb572516b2c16;
    stim[32] = 78'h0fe00669e3bb20dc5386;
    stim[33] = 78'h10d7e20fffe3db07b42f;
    stim[34] = 78'h1eb39a7ced2fd8117735;
    stim[35] = 78'h05c6480166f0d494ce48;
    stim[36] = 78'h04dfa55c66fcc09bfbb3;
    stim[37] = 78'h121d1daf52d6f31242f5;
    stim[38] = 78'h0c2b33a7f7673a2435b9;
    stim[39] = 78'h1f9b0a5dae83667a561a;
    stim[40] = 78'h065eb09878b18f5f3bfb;
    stim[41] = 78'h1fdf8d6944939d916ade;
    stim[42] = 78'h0f34e8eba389ed531553;
    stim[43] = 78'h03188647882c6a7f6d97;
    stim[44] = 78'h15f9da73600a7b793400;
    stim[45] = 78'h0b3093ce828ee4c9e7c3;
    stim[46] = 78'h0b3f02eec605e2f27a85;
    stim[47] = 78'h1f0b0b5a39e45395d582;
    stim[48] = 78'h09288d6df8bf4eb8bb34;
    stim[49] = 78'h3ba8e39bbc288d68f1fb;
    stim[50] = 78'h1cd4bbc328ab585bf971;
    stim[51] = 78'h025a25a6c6e4d644fe4f;
    stim[52] = 78'h0fbb1210b1c511289b75;
    stim[53] = 78'h0595cfc872ac796247ee;
    stim[54] = 78'h031817cca5958bcf820e;
    stim[55] = 78'h069b9845add571c49b82;
    stim[56] = 78'h0f7bae87c3756bce7822;
    stim[57] = 78'h1df2813b5972a4b71a5e;
    stim[58] = 78'h1de097d3f354acf12067;
    stim[59] = 78'h0a40324b5496f34ab54a;
    stim[60] = 78'h1e8d4a94ce8a0bba76d7;
    stim[61] = 78'h0819055ea8c48ddefc83;
    stim[62] = 78'h16c23359ea27c30d5c4c;
    stim[63] = 78'h0b1fd6df393d5364c513;
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
      expv[0] = 75'h4000000000000000000;
      expv[1] = 75'h4000000000000000000;
      expv[2] = 75'h4000000000000000000;
      expv[3] = 75'h4000000000000000000;
      expv[4] = 75'h4000000000000000000;
      expv[5] = 75'h4000000000000000000;
      expv[6] = 75'h4000000000000000000;
      expv[7] = 75'h4000000000000000000;
      expv[8] = 75'h4000000000000000000;
      expv[9] = 75'h4000000000000000000;
      expv[10] = 75'h4000000000000000000;
      expv[11] = 75'h4000000000000000000;
      expv[12] = 75'h4000000000000000000;
      expv[13] = 75'h600d24f25b827060f3f;
      expv[14] = 75'h600d24f25b827060f3f;
      expv[15] = 75'h600d24f25b827060f3f;
      expv[16] = 75'h600d24f25b827060f3f;
      expv[17] = 75'h600d24f25b827060f3f;
      expv[18] = 75'h400d24f25b827060f3f;
      expv[19] = 75'h400d24f25b827060f3f;
      expv[20] = 75'h400d24f25b827060f3f;
      expv[21] = 75'h400d24f25b827060f3f;
      expv[22] = 75'h66db01f552e41e40860;
      expv[23] = 75'h66db01f552e41e40860;
      expv[24] = 75'h66db01f552e41e40860;
      expv[25] = 75'h66db01f552e41e40860;
      expv[26] = 75'h66db01f552e41e40860;
      expv[27] = 75'h66db01f552e41e40860;
      expv[28] = 75'h66db01f552e41e40860;
      expv[29] = 75'h66db01f552e41e40860;
      expv[30] = 75'h66db01f552e41e40860;
      expv[31] = 75'h66db01f552e41e40860;
      expv[32] = 75'h66db01f552e41e40860;
      expv[33] = 75'h66db01f552e41e40860;
      expv[34] = 75'h7a15f0df71b87ba13d4;
      expv[35] = 75'h7a15f0df71b87ba13d4;
      expv[36] = 75'h7a15f0df71b87ba13d4;
      expv[37] = 75'h79261e551205b92f6ab;
      expv[38] = 75'h79261e551205b92f6ab;
      expv[39] = 75'h79261e551205b92f6ab;
      expv[40] = 75'h79261e551205b92f6ab;
      expv[41] = 75'h7ace69f3b4bf6045dcd;
      expv[42] = 75'h7ace69f3b4bf6045dcd;
      expv[43] = 75'h7e6c2976ba0d99e9586;
      expv[44] = 75'h7f7e35a5124e7645ab7;
      expv[45] = 75'h7f7e35a5124e7645ab7;
      expv[46] = 75'h5f7e35a5124e7645ab7;
      expv[47] = 75'h5f7e35a5124e7645ab7;
      expv[48] = 75'h5f7e35a5124e7645ab7;
      expv[49] = 75'h5f7e35a5124e7645ab7;
      expv[50] = 75'h4000000000000000000;
      expv[51] = 75'h4000000000000000000;
      expv[52] = 75'h7352ef0ca2ad616fe5c;
      expv[53] = 75'h7352ef0ca2ad616fe5c;
      expv[54] = 75'h7352ef0ca2ad616fe5c;
      expv[55] = 75'h7352ef0ca2ad616fe5c;
      expv[56] = 75'h7352ef0ca2ad616fe5c;
      expv[57] = 75'h7352ef0ca2ad616fe5c;
      expv[58] = 75'h7352ef0ca2ad616fe5c;
      expv[59] = 75'h77ca04ed65ca92dc697;
      expv[60] = 75'h77ca04ed65ca92dc697;
      expv[61] = 75'h77825f4fcd52b3c4819;
      expv[62] = 75'h7a352a533a282ee9db5;
      expv[63] = 75'h7a352a533a282ee9db5;
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
