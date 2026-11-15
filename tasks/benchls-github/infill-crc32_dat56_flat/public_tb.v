// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 88;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  crc32_dat56_flat dut (
    .crc_in(in_vec[87:56]),
    .dat_in(in_vec[55:0]),
    .crc_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 88'hd55230bd55319679eebab1;
    stim[1] = 88'h9d05f47106c2b0899e0132;
    stim[2] = 88'h2fe4b031783d4ba37fbed7;
    stim[3] = 88'h7bd6cd062055fa18f1908a;
    stim[4] = 88'hfab76d6accb404bfdb8f6f;
    stim[5] = 88'h8e9755a687b0e6133b9224;
    stim[6] = 88'h349c6692ac2cd05e4579d4;
    stim[7] = 88'h65bc0ea8a5266c4df2384b;
    stim[8] = 88'h0c05270ab02466d7e6ab3f;
    stim[9] = 88'hdce7f777799237e8c420a4;
    stim[10] = 88'he11a180d818f569e542812;
    stim[11] = 88'hc621d8a754f46e400581f6;
    stim[12] = 88'he5ce5a84d16e58b88d61ff;
    stim[13] = 88'h5cfe85b9ce1149e2595366;
    stim[14] = 88'hb98ec3ee7a2a6b2bd5d990;
    stim[15] = 88'hd060543204139b20757c1f;
    stim[16] = 88'h56ca3e17b6f4c3a7d21dcd;
    stim[17] = 88'h0dfa3a66dfc413ece0da19;
    stim[18] = 88'h11cdad84e6d849dfdd5823;
    stim[19] = 88'hc464aa9b7525423d8f9619;
    stim[20] = 88'hf584d3e364b95ab1101821;
    stim[21] = 88'h1c82ace1f09f31415759a1;
    stim[22] = 88'heac1c801eca290a1945ce4;
    stim[23] = 88'hed018411c9f4037a08a7d6;
    stim[24] = 88'h25e97e5fa78962d45983b0;
    stim[25] = 88'h0ff1400992971f74ee5b13;
    stim[26] = 88'h0e030ef013959a5074122e;
    stim[27] = 88'hd9ce489cf62b12962e2adc;
    stim[28] = 88'he6ac55286d136fc5510091;
    stim[29] = 88'h0dd6fbf5ecf090b9b8022e;
    stim[30] = 88'h59978c4e5f2ade2b871039;
    stim[31] = 88'hc035022473a5b29dd55e26;
    stim[32] = 88'h51023e420468b664b4036e;
    stim[33] = 88'h9374361a5d8606e5ce0759;
    stim[34] = 88'hcdbec1c69ef2927070fc27;
    stim[35] = 88'h8f91bece7598117c107689;
    stim[36] = 88'hb7f50113d3e58d7a008738;
    stim[37] = 88'h925f16cbb0743e0e8f43b9;
    stim[38] = 88'h0bb027ce6ae055d8befca8;
    stim[39] = 88'h957e6c820d8b943c8991d6;
    stim[40] = 88'h2488406a91744275a0d23d;
    stim[41] = 88'h85f6465f262075f0bd67ac;
    stim[42] = 88'he212fc21f01a4efdbed4de;
    stim[43] = 88'h8f0cd354d1deece992f6bc;
    stim[44] = 88'h699aa3845e8b2d087c5495;
    stim[45] = 88'h32b136a14da5fe029e5cb7;
    stim[46] = 88'h8d44738e41c13f3e41b73c;
    stim[47] = 88'h90e7d67a5fb7cfb6ddecd9;
    stim[48] = 88'h9ff6fdbc298fdd07fbbe34;
    stim[49] = 88'h0c36dc1ab228bfbe60ca8c;
    stim[50] = 88'h0af4d90a33dbda619eb716;
    stim[51] = 88'h31b8cd785d6bb41e7d0df9;
    stim[52] = 88'hf292c1f1dded4f68f51aa8;
    stim[53] = 88'h1701265c5b3646493b334b;
    stim[54] = 88'h29c2b74e4fc3c58779e252;
    stim[55] = 88'ha5d2d9e202d6d759fae70d;
    stim[56] = 88'hb391b0117e553784819a4c;
    stim[57] = 88'h20a04cc46ac6f21a744ac4;
    stim[58] = 88'h4ce56861abdc5c868585d8;
    stim[59] = 88'h30246c0e5001a770b3742b;
    stim[60] = 88'hcf6fd77db86a4b9d72ac03;
    stim[61] = 88'hbdb90f95928647e2a76a05;
    stim[62] = 88'ha6b8936466fb8b07264af0;
    stim[63] = 88'he3c9d5485d472ceba009bd;
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
      expv[0] = 32'h85358cf2;
      expv[1] = 32'h1c4b9c40;
      expv[2] = 32'hee41dbf4;
      expv[3] = 32'h84adf68d;
      expv[4] = 32'ha994ee82;
      expv[5] = 32'hcb784daa;
      expv[6] = 32'h559f662a;
      expv[7] = 32'hf5d75017;
      expv[8] = 32'hbf573812;
      expv[9] = 32'h0a6214f9;
      expv[10] = 32'h7f5de76d;
      expv[11] = 32'h9ac9f575;
      expv[12] = 32'h3699997c;
      expv[13] = 32'hf42234c8;
      expv[14] = 32'h7e6770c6;
      expv[15] = 32'h239a9469;
      expv[16] = 32'hd10880db;
      expv[17] = 32'h4231f0f3;
      expv[18] = 32'he84001fb;
      expv[19] = 32'hbc053659;
      expv[20] = 32'h70222970;
      expv[21] = 32'h5b0bbac0;
      expv[22] = 32'h041b6d67;
      expv[23] = 32'he9553e04;
      expv[24] = 32'hffe812e6;
      expv[25] = 32'hc571fdd4;
      expv[26] = 32'h0b9fae59;
      expv[27] = 32'h356a4588;
      expv[28] = 32'hb0cf1c85;
      expv[29] = 32'h0797358c;
      expv[30] = 32'hf1a58773;
      expv[31] = 32'hef2bbaee;
      expv[32] = 32'h1af68349;
      expv[33] = 32'h02631604;
      expv[34] = 32'h0919887d;
      expv[35] = 32'hc9262cca;
      expv[36] = 32'he6fc0ce8;
      expv[37] = 32'h14d3840c;
      expv[38] = 32'h7d0f645c;
      expv[39] = 32'h84d298b5;
      expv[40] = 32'haa5307f8;
      expv[41] = 32'h0f8a5a4f;
      expv[42] = 32'hc02eaf78;
      expv[43] = 32'he7cbb851;
      expv[44] = 32'hc9c84a2a;
      expv[45] = 32'h5b64fa98;
      expv[46] = 32'hee0e7222;
      expv[47] = 32'hadc32c93;
      expv[48] = 32'he321f443;
      expv[49] = 32'hf4704dfa;
      expv[50] = 32'hb37e1bfd;
      expv[51] = 32'h633d4ad1;
      expv[52] = 32'h1814136e;
      expv[53] = 32'h6432274b;
      expv[54] = 32'hcb843a06;
      expv[55] = 32'he44d6663;
      expv[56] = 32'hf63ad46f;
      expv[57] = 32'h2e4c45f3;
      expv[58] = 32'h6c619f60;
      expv[59] = 32'h687564ed;
      expv[60] = 32'h64712c1c;
      expv[61] = 32'h0c7effd2;
      expv[62] = 32'h0091499c;
      expv[63] = 32'h5d627ab9;
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
