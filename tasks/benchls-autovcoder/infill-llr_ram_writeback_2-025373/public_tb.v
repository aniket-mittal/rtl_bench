// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_025373 dut (
    .clk(clk),
    .reset_n(in_vec[48:48]),
    .fsm(in_vec[47:44]),
    .sin(in_vec[43:43]),
    .din(in_vec[42:35]),
    .vtc_en(in_vec[34:32]),
    .dvtc_a(in_vec[31:24]),
    .dvtc_b(in_vec[23:16]),
    .dvtc_c(in_vec[15:8]),
    .d_last(in_vec[7:0]),
    .ram_d(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h02bda288ddf80;
    stim[1] = 49'h037bfb8569be0;
    stim[2] = 49'h1ea74dcb2205b;
    stim[3] = 49'h1519a7bfd530e;
    stim[4] = 49'h110cc01d8a1af;
    stim[5] = 49'h1d3442aa63a5d;
    stim[6] = 49'h150d5abdcfd2c;
    stim[7] = 49'h1e57bab198006;
    stim[8] = 49'h11520fc5f8ba1;
    stim[9] = 49'h1f785c11c80ac;
    stim[10] = 49'h1b95e26b7725c;
    stim[11] = 49'h16509973b2519;
    stim[12] = 49'h1eee8532340c2;
    stim[13] = 49'h1e6744b0e1c52;
    stim[14] = 49'h1c72eeb304d3a;
    stim[15] = 49'h195b76dfb0341;
    stim[16] = 49'h1bf8b907be3cb;
    stim[17] = 49'h147e6bc948247;
    stim[18] = 49'h18a2c806a3691;
    stim[19] = 49'h1c9ead8415f67;
    stim[20] = 49'h1d70d49b76dfb;
    stim[21] = 49'h12224bc383366;
    stim[22] = 49'h1a0d177f1c311;
    stim[23] = 49'h17473205fdc33;
    stim[24] = 49'h1304dc3df539c;
    stim[25] = 49'h1ec291233ae19;
    stim[26] = 49'h140bdd621782b;
    stim[27] = 49'h1a22d5dfca6bc;
    stim[28] = 49'h1ff1a9862d394;
    stim[29] = 49'h1ce15dcd184fe;
    stim[30] = 49'h160cb0f707830;
    stim[31] = 49'h11df4fe951ef3;
    stim[32] = 49'h192a543c864f3;
    stim[33] = 49'h1c083e2099735;
    stim[34] = 49'h122e04ed7d317;
    stim[35] = 49'h12f416c4a7188;
    stim[36] = 49'h0cb081c55d63b;
    stim[37] = 49'h1d1112e0fe7f8;
    stim[38] = 49'h14a0a2a25b76c;
    stim[39] = 49'h1a2d41361664e;
    stim[40] = 49'h1bd3586da4140;
    stim[41] = 49'h0f7e10eba017f;
    stim[42] = 49'h193c8bbd5dc40;
    stim[43] = 49'h195f059b82bc7;
    stim[44] = 49'h11d12aab5ca0d;
    stim[45] = 49'h1f112b8b2e06e;
    stim[46] = 49'h074ad1ae52d0f;
    stim[47] = 49'h1a6aec44dce77;
    stim[48] = 49'h17d4348c414b4;
    stim[49] = 49'h1bf4b0d5b9900;
    stim[50] = 49'h194ff8ffe0da4;
    stim[51] = 49'h1169861f6e78c;
    stim[52] = 49'h14cd1b51c7947;
    stim[53] = 49'h1ff04d75725ad;
    stim[54] = 49'h131f1d36ce789;
    stim[55] = 49'h108ba5556411d;
    stim[56] = 49'h19ea860960333;
    stim[57] = 49'h12c988ef9cf5e;
    stim[58] = 49'h172b56ace9138;
    stim[59] = 49'h15f75faa308f0;
    stim[60] = 49'h1d4a6ce37acfa;
    stim[61] = 49'h1f95b08a80971;
    stim[62] = 49'h1990db5f2b888;
    stim[63] = 49'h1fe600a9c5519;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h4e;
      expv[4] = 8'h4e;
      expv[5] = 8'h4e;
      expv[6] = 8'h4e;
      expv[7] = 8'h2c;
      expv[8] = 8'h38;
      expv[9] = 8'h38;
      expv[10] = 8'h05;
      expv[11] = 8'h2b;
      expv[12] = 8'hc5;
      expv[13] = 8'hdd;
      expv[14] = 8'hdd;
      expv[15] = 8'hdd;
      expv[16] = 8'hdd;
      expv[17] = 8'hf1;
      expv[18] = 8'hf1;
      expv[19] = 8'hf1;
      expv[20] = 8'hf1;
      expv[21] = 8'h77;
      expv[22] = 8'h77;
      expv[23] = 8'h77;
      expv[24] = 8'hf5;
      expv[25] = 8'hf5;
      expv[26] = 8'h85;
      expv[27] = 8'h19;
      expv[28] = 8'h19;
      expv[29] = 8'he3;
      expv[30] = 8'h35;
      expv[31] = 8'h97;
      expv[32] = 8'h97;
      expv[33] = 8'h97;
      expv[34] = 8'h18;
      expv[35] = 8'h18;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h34;
      expv[39] = 8'h34;
      expv[40] = 8'h34;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'ha8;
      expv[50] = 8'he9;
      expv[51] = 8'he9;
      expv[52] = 8'he9;
      expv[53] = 8'hbc;
      expv[54] = 8'he0;
      expv[55] = 8'he0;
      expv[56] = 8'he0;
      expv[57] = 8'he0;
      expv[58] = 8'h93;
      expv[59] = 8'h59;
      expv[60] = 8'hc5;
      expv[61] = 8'hc5;
      expv[62] = 8'h2b;
      expv[63] = 8'h2b;
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
