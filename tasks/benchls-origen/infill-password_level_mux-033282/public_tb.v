// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_033282 dut (
    .Level(in_vec[63:61]),
    .password_auth(in_vec[60:60]),
    .user_id(in_vec[59:56]),
    .Password(in_vec[55:52]),
    .RNG1(in_vec[51:48]),
    .RNG2(in_vec[47:44]),
    .PlayerTIn(in_vec[43:40]),
    .PlayerUIn(in_vec[39:36]),
    .FRndOrig(in_vec[35:32]),
    .FRndEncryp(in_vec[31:28]),
    .SRndEncryp(in_vec[27:24]),
    .SRndOrig(in_vec[23:20]),
    .SC_Tens_l2(in_vec[19:16]),
    .SC_Units_l2(in_vec[15:12]),
    .SC_Tens_l3(in_vec[11:8]),
    .SC_Units_l3(in_vec[7:4]),
    .index(in_vec[3:0]),
    .NumOut1(out_vec[29:26]),
    .NumOut2(out_vec[25:22]),
    .NumOut3(out_vec[21:18]),
    .NumOut4(out_vec[17:14]),
    .NumOut5(out_vec[13:10]),
    .NumOut6(out_vec[9:6]),
    .Encrypt_on1(out_vec[5:5]),
    .Encrypt_on2(out_vec[4:4]),
    .Encrypt_on3(out_vec[3:3]),
    .Encrypt_on4(out_vec[2:2]),
    .Encrypt_on5(out_vec[1:1]),
    .Encrypt_on6(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h6c9853cb993bac42;
    stim[1] = 64'h8d1db1ebaa8b3b02;
    stim[2] = 64'h0c1f7b772544f3f5;
    stim[3] = 64'h54f1ce43ae0a5d2b;
    stim[4] = 64'h126b28333255bc9e;
    stim[5] = 64'hb7a8d03c12051b96;
    stim[6] = 64'h4a702a23250514e8;
    stim[7] = 64'h52d16396ff1e323b;
    stim[8] = 64'h43e12ed1462ef72c;
    stim[9] = 64'h38e9a1e1c96c4851;
    stim[10] = 64'h61d91ab5930648d0;
    stim[11] = 64'h11a15592a87c91c8;
    stim[12] = 64'hed3f74a78074199e;
    stim[13] = 64'h2e83a20b83962b7a;
    stim[14] = 64'h007eb2e021bca04e;
    stim[15] = 64'h080438e635be38e3;
    stim[16] = 64'h6cedcc1bc9f0c154;
    stim[17] = 64'h2dec949acd24d31e;
    stim[18] = 64'h1745628640f5a15d;
    stim[19] = 64'h2acbf57667e7e852;
    stim[20] = 64'h2955ef6f714c5767;
    stim[21] = 64'hd0d48eb68b0eac41;
    stim[22] = 64'h92fbeb2376899b5e;
    stim[23] = 64'h6ff6246fa06f3ca7;
    stim[24] = 64'hbec2e6c7e478bb5c;
    stim[25] = 64'h448aa800c08e4a9b;
    stim[26] = 64'h759782784e1cbfc1;
    stim[27] = 64'h3830a22c2ca4c8fe;
    stim[28] = 64'hb504f22671a4b24a;
    stim[29] = 64'hf980c0bbfbe2320b;
    stim[30] = 64'hd5eba14d35f81324;
    stim[31] = 64'h9183552014aeeca6;
    stim[32] = 64'he268bd763be97486;
    stim[33] = 64'hbe8a8709ad740bec;
    stim[34] = 64'h3d5275e5877d608e;
    stim[35] = 64'h2cdba2ee100c1f77;
    stim[36] = 64'hbf0f5c785cc53c1e;
    stim[37] = 64'h8fd96d51b1c63af0;
    stim[38] = 64'hc8a7ef4c4111e04d;
    stim[39] = 64'h224435d448f2581c;
    stim[40] = 64'ha93c1cc0c479dc61;
    stim[41] = 64'h977746c8636b9ba8;
    stim[42] = 64'h7af7d2a3df6514f0;
    stim[43] = 64'h26ac22ca05ff5cab;
    stim[44] = 64'h6bb4a980cbcc052f;
    stim[45] = 64'hc42bbe9da4a07caa;
    stim[46] = 64'h09c7ce5bdfac3058;
    stim[47] = 64'h4d216d4793966387;
    stim[48] = 64'hf327f363195aa69b;
    stim[49] = 64'hd27050bd23b829dd;
    stim[50] = 64'h98b313086ab051aa;
    stim[51] = 64'h080d32dcc705f651;
    stim[52] = 64'h11d3bb7ac2e34bd1;
    stim[53] = 64'h3cde646a0fa3a7bf;
    stim[54] = 64'h770b94767f3fd01e;
    stim[55] = 64'hcdb0e9f65fd03ac0;
    stim[56] = 64'he402c6379b95d41d;
    stim[57] = 64'hc492196787ecc4a7;
    stim[58] = 64'haeed5db81e986b0f;
    stim[59] = 64'hf483aabe599e7a11;
    stim[60] = 64'h621208ab30812171;
    stim[61] = 64'h243e130981d33336;
    stim[62] = 64'hb29027ab070f6e7d;
    stim[63] = 64'h5075eee17ac3c4dd;
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
      expv[0] = 30'h273fffcf;
      expv[1] = 30'h077fffcf;
      expv[2] = 30'h073fffcf;
      expv[3] = 30'h3c3a97c9;
      expv[4] = 30'h1bffffdf;
      expv[5] = 30'h2bffffdf;
      expv[6] = 30'h1ebfffcf;
      expv[7] = 30'h347f8fc9;
      expv[8] = 30'h38ffffcf;
      expv[9] = 30'h3873ffcf;
      expv[10] = 30'h347fffcf;
      expv[11] = 30'h2bffffdf;
      expv[12] = 30'h0f7fffcf;
      expv[13] = 30'h23bfffcf;
      expv[14] = 30'h1c3fffcf;
      expv[15] = 30'h023fffcf;
      expv[16] = 30'h3b3fffcf;
      expv[17] = 30'h3b7fffcf;
      expv[18] = 30'h13ffffdf;
      expv[19] = 30'h32bfffcf;
      expv[20] = 30'h167fffcf;
      expv[21] = 30'h37ffffdf;
      expv[22] = 30'h3a66d7c1;
      expv[23] = 30'h3fffffcf;
      expv[24] = 30'h33ffffdf;
      expv[25] = 30'h213fffcf;
      expv[26] = 30'h1e09ff00;
      expv[27] = 30'h0f0bffcf;
      expv[28] = 30'h03ffffdf;
      expv[29] = 30'h23ffffdf;
      expv[30] = 30'h3bffffdf;
      expv[31] = 30'h1bbb2bc1;
      expv[32] = 30'h18bfffcf;
      expv[33] = 30'h23ffffdf;
      expv[34] = 30'h1563ffcf;
      expv[35] = 30'h373fffcf;
      expv[36] = 30'h03ffffdf;
      expv[37] = 30'h37ffffcf;
      expv[38] = 30'h2a3fffcf;
      expv[39] = 30'h10bfffcf;
      expv[40] = 30'h0e7fffcf;
      expv[41] = 30'h22e6ebc1;
      expv[42] = 30'h1f4a93c0;
      expv[43] = 30'h29bfffcf;
      expv[44] = 30'h2effffcf;
      expv[45] = 30'h093fffcf;
      expv[46] = 30'h327fffcf;
      expv[47] = 30'h0b7fffcf;
      expv[48] = 30'h0bffffdf;
      expv[49] = 30'h1fffffdf;
      expv[50] = 30'h28146bc1;
      expv[51] = 30'h023fffcf;
      expv[52] = 30'h37ffffdf;
      expv[53] = 30'h3683ffcf;
      expv[54] = 30'h2e51c040;
      expv[55] = 30'h2f7fffcf;
      expv[56] = 30'h013fffcf;
      expv[57] = 30'h253fffcf;
      expv[58] = 30'h3bbfffcf;
      expv[59] = 30'h23ffffdf;
      expv[60] = 30'h04bfffcf;
      expv[61] = 30'h0d3fffcf;
      expv[62] = 30'h27ffffdf;
      expv[63] = 30'h1f28f3c9;
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
