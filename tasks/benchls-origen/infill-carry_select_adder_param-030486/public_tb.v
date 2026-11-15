// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_030486 dut (
    .a(in_vec[63:32]),
    .b(in_vec[31:0]),
    .o(out_vec[32:1]),
    .c(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hd11abe2dae851977;
    stim[1] = 64'hc4f1b396d7040a1a;
    stim[2] = 64'hbae21d969e0388b1;
    stim[3] = 64'ha87b68e11c9d4fc6;
    stim[4] = 64'h10df96bb11a2b15f;
    stim[5] = 64'h05ff873b869c2794;
    stim[6] = 64'h263e9ad01d13ed28;
    stim[7] = 64'h5de24c4dcdc6176c;
    stim[8] = 64'h86b2386380169b2a;
    stim[9] = 64'hc70c879148ad900e;
    stim[10] = 64'h2bab7d86e9c8d2e7;
    stim[11] = 64'hef2ad470c7ff7c62;
    stim[12] = 64'h95db7ff3bbf471bd;
    stim[13] = 64'h86a13284790a0e55;
    stim[14] = 64'h8866c8a7d77582b1;
    stim[15] = 64'h8f9593a1433ab08c;
    stim[16] = 64'h901e8b2db394a5d0;
    stim[17] = 64'h5aab0bdab4d16c3a;
    stim[18] = 64'hf8303f50d5e02049;
    stim[19] = 64'hd5fa868c8a2e58ab;
    stim[20] = 64'h51f5e1ead3b2998b;
    stim[21] = 64'h40f9ccbf8d28691b;
    stim[22] = 64'h1b7982496ccfde9b;
    stim[23] = 64'h4ee6f5f0559379f8;
    stim[24] = 64'h4341db6c847fc8e5;
    stim[25] = 64'h059011f81152a59c;
    stim[26] = 64'h7c5d808b975c65ca;
    stim[27] = 64'h2ce122d8ee90d639;
    stim[28] = 64'h8a5f738224b96c20;
    stim[29] = 64'h967fde4a4d62b098;
    stim[30] = 64'h1a107464b8d50aeb;
    stim[31] = 64'hde97036461b51f09;
    stim[32] = 64'hbd79972adc0bca20;
    stim[33] = 64'h76a3cb4aa99baff7;
    stim[34] = 64'h8b932f419ae10168;
    stim[35] = 64'h77d5e772726bf530;
    stim[36] = 64'h12347e39c49ad51d;
    stim[37] = 64'h431389206067ccf1;
    stim[38] = 64'h2da1e833dd4bbb22;
    stim[39] = 64'h8a47f9c6b89df88b;
    stim[40] = 64'h2d254675cd1975b9;
    stim[41] = 64'h2678c9577778f032;
    stim[42] = 64'h21905ac1dba38edf;
    stim[43] = 64'h58e1329a8d938ad6;
    stim[44] = 64'hdd771a2cb8494407;
    stim[45] = 64'h9a7d128fafc27010;
    stim[46] = 64'hb12f56057ef359dc;
    stim[47] = 64'hd2e94a187986c804;
    stim[48] = 64'h3a89ffa00987ff3e;
    stim[49] = 64'hb10dfbf03b6ded80;
    stim[50] = 64'h4c99e0da2ca410fd;
    stim[51] = 64'h0f7d134026497fc3;
    stim[52] = 64'h2d1d41e4cb524058;
    stim[53] = 64'h8c36ec80480d5362;
    stim[54] = 64'hb147727fcfeee048;
    stim[55] = 64'h00e505d20fc10e6b;
    stim[56] = 64'h465485d9defc4b21;
    stim[57] = 64'h95f50c7dd337156d;
    stim[58] = 64'hd0e9926f8fc471f4;
    stim[59] = 64'h2325a63f106a4fac;
    stim[60] = 64'hd6f8a07cd932eab6;
    stim[61] = 64'h40cca5e81822d4b8;
    stim[62] = 64'h227ebff8631ffc79;
    stim[63] = 64'hd08c710073948841;
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
      expv[0] = 33'h0ff3faf49;
      expv[1] = 33'h137eb7b61;
      expv[2] = 33'h0b1cb4c8f;
      expv[3] = 33'h18a31714e;
      expv[4] = 33'h045049034;
      expv[5] = 33'h119375d9e;
      expv[6] = 33'h086a50ff0;
      expv[7] = 33'h05750c773;
      expv[8] = 33'h00d91a71b;
      expv[9] = 33'h01f742f3f;
      expv[10] = 33'h02ae8a0db;
      expv[11] = 33'h16e54a1a5;
      expv[12] = 33'h0a39fe361;
      expv[13] = 33'h1ff5681b2;
      expv[14] = 33'h0bfb896b1;
      expv[15] = 33'h1a5a0885a;
      expv[16] = 33'h0876661fb;
      expv[17] = 33'h01ef8f029;
      expv[18] = 33'h19c20bf33;
      expv[19] = 33'h0c051be6f;
      expv[20] = 33'h04b50f6eb;
      expv[21] = 33'h19c446bb4;
      expv[22] = 33'h11092c1c8;
      expv[23] = 33'h148f4dfd0;
      expv[24] = 33'h18f8348a2;
      expv[25] = 33'h02dc56f28;
      expv[26] = 33'h02773ccab;
      expv[27] = 33'h036e3f223;
      expv[28] = 33'h15e31bf44;
      expv[29] = 33'h1c7c51dc4;
      expv[30] = 33'h1a5cafe9e;
      expv[31] = 33'h0809844db;
      expv[32] = 33'h1330ac295;
      expv[33] = 33'h0407ef683;
      expv[34] = 33'h04ce86153;
      expv[35] = 33'h1d483b944;
      expv[36] = 33'h1ad9ea6ac;
      expv[37] = 33'h146f6ac22;
      expv[38] = 33'h015db46ab;
      expv[39] = 33'h085cbe4a3;
      expv[40] = 33'h1f47d785c;
      expv[41] = 33'h13be37312;
      expv[42] = 33'h1fa67d340;
      expv[43] = 33'h1cce97ae0;
      expv[44] = 33'h12b80bc67;
      expv[45] = 33'h0947f053f;
      expv[46] = 33'h060455fc3;
      expv[47] = 33'h098e02439;
      expv[48] = 33'h08823fdbc;
      expv[49] = 33'h1d8f7d2e0;
      expv[50] = 33'h0f27be3ae;
      expv[51] = 33'h06b8d2606;
      expv[52] = 33'h1f0df0478;
      expv[53] = 33'h1a8887fc4;
      expv[54] = 33'h1026ca58f;
      expv[55] = 33'h0214c287a;
      expv[56] = 33'h04aa1a1f5;
      expv[57] = 33'h0d25843d5;
      expv[58] = 33'h0c15c08c7;
      expv[59] = 33'h0671febd6;
      expv[60] = 33'h160571665;
      expv[61] = 33'h0b1def540;
      expv[62] = 33'h10b3d78e2;
      expv[63] = 33'h08841f283;
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
